package com.example.ecommerce.controller.test;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.ConnectionException;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Dashboard", value = "/dashboard")
public class Dashboard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        MC.createInstance();

        try {
//            List<Product> products = MC.instance.productService.getNew4Products();
            List<Product> products = ProductService.getInstance().getNew4Products();
            request.setAttribute("listproduct", products);

        } catch (ConnectionException e) {
//            MC.instance.log.error(this.getClass().getName(),"Error connecting to DB");
//            MC.instance.log.error(this.getClass().getName(), new RuntimeException(e));
        }

        String url = "/views/web/common/home.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}