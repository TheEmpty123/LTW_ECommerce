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

//            var a = MC.instance.orderService.get5RecentOrders();

            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/dashboard.jsp");
            dispatcher.forward(request, response);

    }

    public void destroy() {
    }
}