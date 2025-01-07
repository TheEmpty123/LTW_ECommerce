package com.example.ecommerce.controller2.adm;

import java.io.*;

import com.example.ecommerce.Common.Enum.Accessible;
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
        HttpSession session = request.getSession();

        Accessible isAccessible = null;

        try {
            // get user INFO through session
            isAccessible = MC.instance.userService.isAccessible(session);
        } catch (ConnectionException e) {
            MC.instance.log.error("Error connecting to server");
            MC.instance.log.error(e.getMessage());
        }

        // Temporary
        isAccessible = Accessible.ADMINISTRATOR;

        if (isAccessible == Accessible.NOT_LOGGED_IN) {
            MC.instance.log.warn(getClass().getName(), "Access denied");

            response.sendRedirect("/login");
        } else if (isAccessible == Accessible.CLIENT)
        {
            MC.instance.log.error(getClass().getName(), "Access denied");

            response.sendRedirect("/404");
        }
        else if (isAccessible == Accessible.EMPLOYEE || isAccessible == Accessible.ADMINISTRATOR || isAccessible == Accessible.MANAGER)
        {
            MC.instance.log.info(getClass().getName(), "Access control allowed");
            request.setAttribute("role", isAccessible);

            var a = MC.instance.orderService.get5RecentOrders();

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/dashboard.jsp");
            dispatcher.forward(request, response);
        }
    }

    public void destroy() {
    }
}