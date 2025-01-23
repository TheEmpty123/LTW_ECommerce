package com.example.ecommerce;

import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "Er404", value = "/404")
public class Er404 extends HttpServlet {

    // 404 page
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setStatus(404);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/views/web/common/404.jsp");
        rd.forward(request, response);
    }

    public void destroy() {
    }
}