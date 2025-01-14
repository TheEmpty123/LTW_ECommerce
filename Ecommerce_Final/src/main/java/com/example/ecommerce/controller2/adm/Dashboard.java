package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.text.NumberFormat;
import java.util.Locale;

import com.example.ecommerce.controller2.MC;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.ConnectionException;

@WebServlet(name = "Dashboard", value = "/admin/dashboard")
public class Dashboard extends HttpServlet implements ControllerBase {

    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading dashboard page ============");

        try {
            NumberFormat formatter = NumberFormat.getInstance(Locale.ENGLISH);

            log.info("Getting 5 recent orders...");
            var orders = MC.instance.orderService.get5RecentOrders(false);
            request.setAttribute("recentOrders", orders);

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

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/dashboard.jsp");
        dispatcher.forward(request, response);

    }

    public void destroy() {
    }
}