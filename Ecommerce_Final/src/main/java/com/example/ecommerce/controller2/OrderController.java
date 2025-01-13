package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.DAO.iml.OrderDao;
import com.example.ecommerce.DAO.iml.OrderItemDao;
import com.example.ecommerce.service.OrderItemService;
import com.example.ecommerce.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Order", value = "/order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

       OrderItemService orderItemService = new OrderItemService();
        List<OrderItem> orderitems = orderItemService.getOrderItem();

        req.setAttribute("orderitems", orderitems);

        req.getRequestDispatcher("/views/web/order/order.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Handle POST request here if needed
    }
}

