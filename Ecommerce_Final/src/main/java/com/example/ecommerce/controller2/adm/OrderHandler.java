package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.util.List;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.Payment;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.Common.Enum.ShippingStatus;
import com.example.ecommerce.Common.Enum.Statuss;
import com.example.ecommerce.Dto.OrderDto;
import com.example.ecommerce.Utils.CipherUtils;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "OrderHandlerServlet", value = "/admin/edit-order")
public class OrderHandler extends HttpServlet implements ControllerBase {
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading orders modifier page ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (!MC.instance.userService.hasPermission(user, RolePermission.ORDER_MANAGEMENT, true)) {
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
        request.setAttribute("CMD", "order");

        try {
            log.info("Preparing for orders modifier page");

            int id = Integer.parseInt(request.getParameter("id"));

            MC.instance.backupID = id;

            OrderDto orders = MC.instance.orderService.getOrderDtoById(id);
            request.setAttribute("o", orders);

            Order order = MC.instance.orderService.getOrderById(id);
            User u = MC.instance.userService.getUserByID(order.getUserID());
            request.setAttribute("ord", order);
            request.setAttribute("u", u);

            var oi = MC.instance.orderService.getAllOrderItemDtoFromOrder(id);
            request.setAttribute("oi", oi);

            String code = "";
            if (order.getPromotion_id() != null && (!order.getPromotion_id().equals(""))) {
                var pro = MC.instance.promotionService.getPromotionById(Integer.parseInt(order.getPromotion_id()));
                code = pro.getCodes();
            }
            request.setAttribute("code", code);

            log.info("Ready for orders management page");
        } catch (Exception e) {
            log.error("Unknown error occurred while loading permission management page");
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unknown error occurred while loading page, please try again later");
        }

        request.getRequestDispatcher("/views/admin/modify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.warn("============ Update order request performed ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (!MC.instance.userService.hasPermission(user, RolePermission.ORDER_MANAGEMENT, true)) {
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
        request.setAttribute("CMD", "order");

        try {
            log.info("Performing update orders");

            String phone = request.getParameter("phone");
            String signature = request.getParameter("signature");
            int pay = Integer.parseInt(request.getParameter("pay"));
            int ship = Integer.parseInt(request.getParameter("ship"));
            int id = MC.instance.backupID;

            Order order = MC.instance.orderService.getOrderById(id);
            ShippingStatus status;
            Statuss statuss;

            switch (pay) {
                case 1:
                    statuss = Statuss.PENDING;
                    break;
                case 2:
                    statuss = Statuss.COMPLETED;
                    break;
                case 3:
                    statuss = Statuss.CANCELLED;
                    break;
                default:
                    statuss = Statuss.PENDING;
                    break;
            }

            switch (ship){
                case 1:
                    status = ShippingStatus.Packaging;
                    break;
                case 2:
                    status = ShippingStatus.Delivering;
                    break;
                case 3:
                    status = ShippingStatus.Completed;
                    break;
                case 4:
                    status = ShippingStatus.Completed;
                    break;
                default:
                    status = ShippingStatus.Packaging;
                    break;
            }

            {
                phone = phone.equals("") ? order.getSdt() : phone;
                order.setSdt(phone);
                order.setShippingStatus(status);
                order.setSignature(signature);
                var li = MC.instance.orderItemService.getAllOrderItemByOrderId(order.getId());
                order.setListOrderItem(li);
                order.getListOrderItem().forEach(x -> x.setProduct(MC.instance.productService.getProductById(x.getProductID())));
            }

            boolean success = MC.instance.orderService.updateOrder(id, order.getPaymentID(), phone, status, statuss, signature);

            if (success){
                request.setAttribute("successMessage", "Updated order successfully");
                CipherUtils.createSignature(order.hashOrder());
            }
            else {
                request.setAttribute("errorMessage", "Failed to update, update request may violate payment & shipment rules, please try again");
            }

            OrderDto orders = MC.instance.orderService.getOrderDtoById(id);
            request.setAttribute("o", orders);

            Order orderr = MC.instance.orderService.getOrderById(id);
            User u = MC.instance.userService.getUserByID(orderr.getUserID());
            request.setAttribute("u", u);
            request.setAttribute("ord", orderr);

            var oi = MC.instance.orderService.getAllOrderItemDtoFromOrder(id);
            request.setAttribute("oi", oi);

            String code = "";
            if (order.getPromotion_id() != null && (!order.getPromotion_id().equals(""))) {
                var pro = MC.instance.promotionService.getPromotionById(Integer.parseInt(order.getPromotion_id()));
                code = pro.getCodes();
            }
            request.setAttribute("code", code);

        } catch (Exception e) {
            log.error("Unknown error occurred while loading permission management page");
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unknown error occurred while loading page, please try again later");
        }


        request.getRequestDispatcher("/views/admin/modify.jsp").forward(request, response);
    }

    public void destroy() {
    }
}