package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.text.NumberFormat;
import java.util.Locale;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.Common.Enum.ShippingStatus;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.ConnectionException;

@WebServlet(name = "ReportManagementServlet", value = "/admin/report")
public class ReportManagement extends HttpServlet implements ControllerBase{
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading dashboard page ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (!MC.instance.userService.hasPermission(user, RolePermission.REPORTS_MANAGEMENT, true)) {
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

        try {
            NumberFormat formatter = NumberFormat.getInstance(Locale.ENGLISH);

            log.info("Getting 5 recent orders...");
            var orders = MC.instance.orderService.get5RecentOrders(false);
            request.setAttribute("recentOrders", orders);

            double delivered = (double) MC.instance.orderService.getTotalShippedOrder(false);
            double delivering = (double) MC.instance.orderService.getTotalOrderWithStatus(false, ShippingStatus.Delivering);
            double packaging = (double) MC.instance.orderService.getTotalOrderWithStatus(false, ShippingStatus.Packaging);
            double sum = delivered + delivering + packaging;
            log.info(delivered + " " + delivering + " " + packaging);

            double pr = (delivered / sum) * 100;
            double de = (delivering / sum) * 100;
            double pa = 100 - pr - de;

            request.setAttribute("pr", pr);
            request.setAttribute("de", de);
            request.setAttribute("pa", pa);

            log.info(pr + " " + de + " " + pa);

            log.info("Getting total revenue...");
            double totalRevenue = MC.instance.orderService.getTotalRevenue(false);
            request.setAttribute("totalRevenue", formatter.format(totalRevenue));

            log.info("Getting total processing..");
            double totalProcessing = MC.instance.orderService.getTotalProcessing(false);
            request.setAttribute("totalProcessing", formatter.format(totalProcessing));

            log.info("Getting total shipped order...");
            double totalShipped = MC.instance.orderService.getTotalShipped(false);
            request.setAttribute("totalShipped", formatter.format(totalShipped));

            log.info("Getting total employee...");
            int totalEmployee = MC.instance.userService.getTotalEmployee(false);
            request.setAttribute("totalEmployee", totalEmployee);

            log.info("Ready for dashboard page");
        } catch (ConnectionException e) {
            log.error("Error connecting to the database");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/sales-reports.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}