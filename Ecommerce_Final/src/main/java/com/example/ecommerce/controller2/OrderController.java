package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.Bean.OwnAddress;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.DAO.iml.OrderDao;
import com.example.ecommerce.DAO.iml.OrderItemDao;
import com.example.ecommerce.service.OrderItemService;
import com.example.ecommerce.service.OrderService;
import com.example.ecommerce.service.OwnAddressService;
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

        try {
            HttpSession session = req.getSession(true);
            User user = (User) session.getAttribute("auth");

            if (user != null) {
                int idUser = user.getId();
                OrderItemService orderItemService = new OrderItemService();
                OwnAddressService ownAddressService = new OwnAddressService();
                OrderService service = new OrderService();

                List<OrderItem> orderitems = orderItemService.getOrderItem(idUser);
                List<OwnAddress> address = ownAddressService.getOwnAddress(idUser);

                System.out.println("Fetched order items: " + orderitems);

                double totalMoney = service.getTotalRevenue(true);


                req.setAttribute("orderitems", orderitems);
                req.setAttribute("total", totalMoney);
                req.setAttribute("address", address);

                req.getRequestDispatcher("/views/web/order/order.jsp").forward(req, resp);
            } else {
                resp.sendRedirect("/login");
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "An error occurred while processing the order.");
            req.getRequestDispatcher("/views/web/error.jsp").forward(req, resp);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Handle POST request here if needed
    }
}

