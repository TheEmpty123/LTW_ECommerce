package com.example.ecommerce.controller2;

import java.io.*;
import java.util.ArrayList;
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
        List<Product> products;
        HttpSession session = request.getSession(true);


        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) {
            c = new Cart();
            session.setAttribute("cart", c);
        }
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

        int productId = Integer.parseInt(request.getParameter("id"));
        Product product = ProductService.getInstance().getProductById(productId);
        try {
            if (product != null) {
                products = (List<Product>) session.getAttribute("recentlyView");
                if (products == null) {
                    products = new ArrayList<>();
                }

                boolean alreadyView = products.stream().anyMatch(p -> p.getId() == product.getId());
                if (!alreadyView) {
                    products.add(0, product);
                    if (products.size() > 8) {
                        products.remove(products.size() - 1);
                    }
                }
                session.setAttribute("recentlyView", products);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        String url = "/index.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}