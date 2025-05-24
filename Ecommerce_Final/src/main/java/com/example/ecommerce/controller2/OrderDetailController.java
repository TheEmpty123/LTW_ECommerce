package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Cart.CartProduct;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.controller2.cart.CartController;
import com.example.ecommerce.service.OrderItemService;
import com.example.ecommerce.service.OrderService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@WebServlet(name = "order-details", value = "/order-detail")
public class OrderDetailController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BufferedReader reader = req.getReader();
        StringBuilder json = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            json.append(line);
        }

        JSONObject obj = new JSONObject(json.toString());
        String ids = obj.getString("ids");

        OrderItemService orderItemService = OrderItemService.getInstance();
        try{

            List<OrderItem> list = orderItemService.getAllOrderItemByOrderId(Integer.parseInt(ids));
            // Tạo JSON trả về
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                    .registerTypeAdapter(Timestamp.class, new TimestampAdapter())
                    .create();
            resp.getWriter().write(gson.toJson(new OrderDetailReponse(list)));
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    private static class OrderDetailReponse{
        private final List<OrderItem> lists;

        public OrderDetailReponse(List<OrderItem> lists) {
            this.lists = lists;
        }
        public List<OrderItem> getLists() {
            return lists;
        }
    }
}
