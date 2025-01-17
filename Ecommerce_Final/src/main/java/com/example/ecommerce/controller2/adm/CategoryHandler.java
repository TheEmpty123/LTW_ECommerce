package com.example.ecommerce.controller2.adm;

import java.io.*;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Bean.ProductAttribute;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns = {"/admin/add-category", "/admin/edit-category"})
public class CategoryHandler extends HttpServlet implements ControllerBase {
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

        if (uri.endsWith("add-category")) {
            request.setAttribute("CMD", "add-category");
            flag = false;
        } else if (uri.endsWith("edit-category")) {
            request.setAttribute("CMD", "edit-category");
            flag = true;
        }

        if (flag) {

            int id = Integer.parseInt(request.getParameter("id"));

            MC.instance.backupID = id;

            var cate = MC.instance.categoryService.getCategoryById(id);
            request.setAttribute("c", cate);

            MC.instance.savedID = null;
        }

        log.info("Form is ready");
        request.getRequestDispatcher("/views/admin/add-product.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        log.warn("============ Request add/edit category form ============");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
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
        String name = request.getParameter("name");

        if (uri.endsWith("add-category")) {
            if (MC.instance.categoryService.getCategoryByName(name) != null) {
                request.setAttribute("errorMessage", "Category name already exists. Please choose a different one.");
                request.setAttribute("CMD", "add-category");
                request.getRequestDispatcher("/views/admin/add-product.jsp")
                        .forward(request, resp);
                return;
            }

            MC.instance.categoryService.addCategory(0, name);
            resp.sendRedirect("/admin/category");
            return;
        } else if (uri.endsWith("edit-category")) {
            if (MC.instance.categoryService.getCategoryByName(name) != null) {
                var cate = MC.instance.categoryService.getCategoryById(MC.instance.backupID);
                request.setAttribute("c", cate);
                request.setAttribute("CMD", "edit-category");
                request.getRequestDispatcher("/views/admin/add-product.jsp")
                        .forward(request, resp);
                return;
            }

            MC.instance.categoryService.updateName(MC.instance.backupID, name);
            var cate = MC.instance.categoryService.getCategoryByName(name);
            request.setAttribute("c", cate);
            request.setAttribute("CMD", "edit-category");
            request.setAttribute("successMessage", "Category has been updated");
            request.getRequestDispatcher("/views/admin/add-product.jsp")
                    .forward(request, resp);
            return;
        }

        resp.sendRedirect("/admin/category");
        return;
    }

    public void destroy() {
    }
}