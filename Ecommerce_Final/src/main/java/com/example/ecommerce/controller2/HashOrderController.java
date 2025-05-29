package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.service.OrderItemService;
import com.example.ecommerce.service.OrderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Hash", value = "/hash")
public class HashOrderController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderItemService orderItemService = OrderItemService.getInstance();
        HttpSession session = req.getSession();
        BufferedReader reader = req.getReader();
        StringBuilder json = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            json.append(line);
        }

        JSONObject obj = new JSONObject(json.toString());
        int ids = Integer.parseInt(obj.getString("ids"));

        OrderService orderService = OrderService.getInstance();
        String hashCode = "";
        try{
            Order order = orderService.getOrderById(ids);
            order.setListOrderItem(orderItemService.getAllOrderItemByOrderId(order.getId()));
            hashCode = order.hashOrder();

            session.setAttribute("currOrderId", ids);

            PrintWriter out = resp.getWriter();
            out.print(hashCode);
            out.flush();
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
