package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.DAO.iml.OrderDao;
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
        OrderService service = new OrderService();
        OrderDao dao = new OrderDao();
        List<Order> orders = new ArrayList<>();
        HttpSession session = req.getSession(true);

        orders = service.getAllOrder();
        double totalMoney = dao.getTotalRevenue(true);
        req.setAttribute("orders", orders);
        req.getRequestDispatcher("views/web/order/order.jsp").forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
