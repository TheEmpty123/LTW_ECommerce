package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.time.LocalDateTime;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Bean.ProductAttribute;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.Gender;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.Common.Enum.StatusUser;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns = {"/admin/edit-product", "/admin/add-product"})
public class ProductHandler extends HttpServlet implements ControllerBase {
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading add/edit product form ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (!MC.instance.userService.hasPermission(user, RolePermission.PRODUCT_MANAGEMENT, true)) {
            log.warn("User management not permitted, redirecting to 404 page");
            response.sendRedirect("/404");
            return;
        }

        log.info("User has access to this resource");
        if (MC.instance.userService.hasPermission(user, RolePermission.SUPREME, true)) {
            request.setAttribute("role", RolePermission.SUPREME);
        } else if (MC.instance.userService.hasPermission(user, RolePermission.USER_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.USER_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(user, RolePermission.ORDER_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.ORDER_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(user, RolePermission.PRODUCT_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.PRODUCT_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(user, RolePermission.REPORTS_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.REPORTS_MANAGEMENT);
        } else
            request.setAttribute("role", RolePermission.REPORTS_MANAGEMENT);

        String uri = request.getRequestURI();
        boolean flag = false;

        if (uri.endsWith("add-product")) {
            request.setAttribute("CMD", "add-product");
            flag = false;
        } else if (uri.endsWith("edit-product")) {
            request.setAttribute("CMD", "edit-product");
            flag = true;
        }

        if (flag) {
            if (MC.instance.savedID == null) {
                if (request.getParameter("id") == null) {
                    response.sendRedirect("/admin/add-product");
                    return;
                }
                Integer id = Integer.parseInt(request.getParameter("id"));
                MC.instance.savedID = id;
                MC.instance.backupID = id;

                log.info("Saved ID: " + id);
                response.sendRedirect("/admin/edit-product");
                return;
            }

            int id = MC.instance.savedID;

            Product u = MC.instance.productService.getProductById(id);

            request.setAttribute("product", u);
            MC.instance.savedID = null;
        }

        var cate = MC.instance.categoryService.getAllCategory();
        request.setAttribute("cate", cate);

        log.info("Form is ready");
        request.getRequestDispatcher("/views/admin/add-product.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        log.warn("============ Request to update user received ============");

        HttpSession session = request.getSession();
        User users = (User) session.getAttribute("auth");
        if (MC.instance.userService.hasPermission(users, RolePermission.SUPREME, true)) {
            request.setAttribute("role", RolePermission.SUPREME);
        } else if (MC.instance.userService.hasPermission(users, RolePermission.USER_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.USER_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(users, RolePermission.ORDER_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.ORDER_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(users, RolePermission.PRODUCT_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.PRODUCT_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(users, RolePermission.REPORTS_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.REPORTS_MANAGEMENT);
        } else
            request.setAttribute("role", RolePermission.REPORTS_MANAGEMENT);

        String uri = request.getRequestURI();
        boolean flag = false;

        if (uri.endsWith("add-product")) {
            flag = false;
        } else if (uri.endsWith("edit-product")) {
            flag = true;
        }

        try {
            if (flag) {
                log.info("Performing edit product action");
                String username = request.getParameter("username");
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String phoneNo = request.getParameter("phone");
                int roleID = Integer.parseInt(request.getParameter("role"));
                StatusUser status = request.getParameter("status").equalsIgnoreCase("enable") ? StatusUser.ENABLE : StatusUser.DISABLE;
                int id = MC.instance.backupID;
                User user = MC.instance.userService.getUserByID(id);

                if (MC.instance.userService.checkUserExists(username)) {
                    request.setAttribute("errorMessage", "Username already exists. Please choose a different one.");
                    var cate = MC.instance.categoryService.getAllCategory();
                    request.setAttribute("cate", cate);
                    request.setAttribute("user", user);
                    request.setAttribute("method", "edit");
                    request.getRequestDispatcher("/views/admin/add-user.jsp")
                            .forward(request, resp);
                    return;
                }

                {
                    user.setUsername(username.equals("") ? user.getUsername() : username);
                    user.setFullName(fullName.equals("") ? user.getFullName() : fullName);
                    user.setEmail(email.equals("") ? user.getEmail() : email);
                    user.setPass(password.equals("") ? "" : password);
                    user.setPhoneNum(phoneNo.equals("") ? user.getPhoneNum() : phoneNo);
                    user.setRoleID(roleID);
                    user.setStatusUser(status);
                }

                boolean success = MC.instance.userService.updateUser(user);

                if (success) {
                    log.warn("Updated product successfully");

                    request.setAttribute("successMessage", "Product has been updated");
                    request.setAttribute("user", user);
                    request.setAttribute("method", "edit");
                    request.getRequestDispatcher("/views/admin/add-user.jsp")
                            .forward(request, resp);
                    return;
                } else {
                    log.warn("Updated product failed");

                    request.setAttribute("errorMessage", "Some error occurred. Please try again.");
                    request.setAttribute("user", user);
                    request.setAttribute("method", "edit");
                    request.getRequestDispatcher("/views/admin/add-user.jsp")
                            .forward(request, resp);
                    return;
                }
            } else {
                log.info("Performing add product action");

                String productName = request.getParameter("productName");
                int cateId = Integer.parseInt(request.getParameter("productCategory"));
                String material = request.getParameter("material");
                String price = request.getParameter("price");
                String size = request.getParameter("size");
                String description = request.getParameter("des");

                if (MC.instance.productService.getProductByName(productName) != null) {
                    request.setAttribute("errorMessage", "Product name already exists. Please choose a different one.");
                    request.setAttribute("CMD", "add-product");
                    request.getRequestDispatcher("/views/admin/add-product.jsp")
                            .forward(request, resp);
                    return;
                }

                ProductAttribute attribute = MC.instance.productService.addProductAttribute(new ProductAttribute(0, material, size));

                price = price.replace(",", "");
                double priceDouble = Double.parseDouble(price);

                Product product = new Product(0, productName, description, priceDouble, "", LocalDateTime.now(), cateId, attribute.getId());

                MC.instance.productService.addNewProduct(product);
            }

        } catch (Exception e) {
            log.error("Unknown error occurred while performing add/edit user action");
            e.printStackTrace();
        }


        resp.sendRedirect("/admin/products");
    }

    public void destroy() {
    }
}