package com.example.ecommerce.controller2;

import java.io.*;
import java.util.List;

import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.ConnectionException;

@WebServlet(name = "home", value = "/kenes")
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        MC.createInstance();
        HttpSession session = request.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) {
            c = new Cart();
            session.setAttribute("cart", c);
        }
        List<Product> products;
        CategoryService categoryService = new CategoryService();
        try {
//            List<Product> products = MC.instance.productService.getNew4Products();
            products = ProductService.getInstance().getNew4Products();
            if (products == null || products.isEmpty()) {
                request.setAttribute("error", "No product found");
            } else {
                request.setAttribute("success", "ddmmm");
                request.setAttribute("list_product", products);
                System.out.println(products);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "failed to load product");

//            MC.instance.log.error(this.getClass().getName(),"Error connecting to DB");
//            MC.instance.log.error(this.getClass().getName(), new RuntimeException(e));
        }

//        String url = "/webapp/WEB-INF/index.jsp";
        String url = "/index.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}