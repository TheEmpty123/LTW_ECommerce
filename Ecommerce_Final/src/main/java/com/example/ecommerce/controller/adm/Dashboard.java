package com.example.ecommerce.controller.adm;

import java.io.*;

import com.example.ecommerce.Common.Enum.Accessibility;
import com.example.ecommerce.controller.MC;
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

        Accessibility isAccessible = null;

        try {
            // get user INFO through session
            isAccessible = MC.instance.userService.isAccessible(session);
        } catch (ConnectionException e) {
            MC.instance.log.error("Error connecting to server");
            MC.instance.log.error(e.getMessage());
        }

        // Temporary
        isAccessible = Accessibility.ADMINISTRATOR;

        if (isAccessible == Accessibility.NOT_LOGGED_IN) {
            MC.instance.log.warn(getClass().getName(), "Access denied");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/auth/Login.jsp");
            dispatcher.forward(request, response);
        } else if (isAccessible == Accessibility.CLIENT)
        {
            MC.instance.log.error(getClass().getName(), "Access denied");

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/web/common/404.jsp");
            dispatcher.forward(request, response);
        }
        else if (isAccessible == Accessibility.EMPLOYEE)
        {
            MC.instance.log.info(getClass().getName(), "Access control allowed");
            // request.setAttribute("listContact",listContact);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/dashboard.jsp");
            dispatcher.forward(request, response);
        }
        else if (isAccessible == Accessibility.MANAGER)
        {
            MC.instance.log.info(getClass().getName(), "Access control allowed");
            // request.setAttribute("listContact",listContact);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/dashboard.jsp");
            dispatcher.forward(request, response);
        }
        else if (isAccessible == Accessibility.ADMINISTRATOR)
        {
            MC.instance.log.info(getClass().getName(), "Access control allowed");
            // request.setAttribute("listContact",listContact);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/dashboard.jsp");
            dispatcher.forward(request, response);
        }
    }

    public void destroy() {
    }
}