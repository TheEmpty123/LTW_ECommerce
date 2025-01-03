package com.example.ecommerce.controller2.cart;

import com.example.ecommerce.Bean.Cart.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Remove", value = "/del-cart")
public class Remove extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pid = -1;
        try{
            pid = Integer.parseInt(req.getParameter("pid"));
        }catch (NumberFormatException e){
            resp.sendRedirect("showCart");
            return;
        }
        HttpSession session = req.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if(c == null) {
            c = new Cart();
            session.setAttribute("cart", c);
            return;
        }
        c.remove(pid);
        session.setAttribute("cart", c);
        resp.sendRedirect("showCart");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

}
