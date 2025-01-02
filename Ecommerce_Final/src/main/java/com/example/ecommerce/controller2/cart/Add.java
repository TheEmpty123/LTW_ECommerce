package com.example.ecommerce.controller2.cart;

import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Add", value = "/add-cart")
public class Add extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService ps = new ProductService();
        Product p = ps.getProductById(Integer.parseInt(req.getParameter("pid")));
        if(p == null) resp.sendRedirect("list-product?cart=false");

        HttpSession session = req.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if(c == null) c = new Cart();
        c.add(p);

        session.setAttribute("cart", c);
        resp.sendRedirect("list-product?cart=true");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
