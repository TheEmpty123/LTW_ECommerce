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

@WebServlet(name = "home", value = "/kenes")
public class Home extends HttpServlet {



    @Override
    public void init() throws ServletException {
        super.init();
        ProductService productService = new ProductService();

//        List<ServiceBase> services = new ArrayList<ServiceBase>();
//
//        services.add(productService);
//
//        services.forEach(ServiceBase::init);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LogObj.defaultLog.info("a");

        init();

        List<Product> products = ProductService.getInstance().getNew4Products();
        request.setAttribute("listproduct", products);

        String url = "/views/web/common/home.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}