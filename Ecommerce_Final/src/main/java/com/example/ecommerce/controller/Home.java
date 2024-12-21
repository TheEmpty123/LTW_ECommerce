package com.example.ecommerce.controller;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Common.IInitializable;
import com.example.ecommerce.Common.LogObj;
import com.example.ecommerce.service.ProductService;
import com.example.ecommerce.service.ServiceBase;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.ConnectionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet(name = "home", value = "/kenes")
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            List<Product> products = MC.instance.productService.getNew4Products();
            request.setAttribute("listproduct", products);

        } catch (ConnectionException e) {
            MC.instance.log.error(this.getClass().getName(),"Error connecting to DB");
            MC.instance.log.error(this.getClass().getName(), new RuntimeException(e));
        }

        String url = "/views/web/common/home.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}