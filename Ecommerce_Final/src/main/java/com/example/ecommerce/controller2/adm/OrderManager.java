package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.util.List;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.Dto.OrderDto;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "OrderManagerServlet", value = "/admin/orders")
public class OrderManager extends HttpServlet implements ControllerBase{
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading orders management page ============");

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
        request.setAttribute("CMD", "orders");

        try {
            log.info("Preparing for orders management page");

            List<OrderDto> orders = MC.instance.orderService.getAllOrderDto();
            request.setAttribute("orders", orders);

            int total = orders.size();
            request.setAttribute("total", total);

            int delivered = MC.instance.orderService.getTotalShippedOrder(false);
            request.setAttribute("delivered", delivered);

            int delivering = MC.instance.orderService.getTotalOnProgressOrder(false);
            request.setAttribute("delivering", delivering);

            int cancelled = MC.instance.orderService.getTotalCancelledOrder(false);
            request.setAttribute("cancelled", cancelled);

            int pending = MC.instance.orderService.getTotalPendingOrder(false);
            request.setAttribute("pending", pending);

            int refunded = MC.instance.orderService.getTotalRefundedOrder(false);
            request.setAttribute("refunded", refunded);

            log.info("Ready for orders management page");
        }
        catch (Exception e) {
            log.error("Unknown error occurred while loading permission management page");
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unknown error occurred while loading permission management page, please try again later");
        }

        request.getRequestDispatcher("/views/admin/product-management.jsp").forward(request, response);
    }

    public void destroy() {
    }
}