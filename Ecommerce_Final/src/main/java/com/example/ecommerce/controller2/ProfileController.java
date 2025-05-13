package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.*;
import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Common.Enum.ShippingStatus;
import com.example.ecommerce.controller2.cart.CartController;
import com.example.ecommerce.service.*;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
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
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Profile", value = "/profile")
public class ProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        User u = (User) session.getAttribute("auth");
        if (c == null) {
            c = new Cart();
            session.setAttribute("cart", c);
        }
        session.setAttribute("cart", c);


        ProductService service = new ProductService();
        AddressService addService = new AddressService();
        CategoryService cateService = new CategoryService();
        OrderService orderService = new OrderService();
        OrderItemService orderItemService = new OrderItemService();
        FavouriteProductService favouriteProductService = FavouriteProductService.getInstance();

        List<Order> orders = new ArrayList<>();
        List<OrderItem> orderItemsOfUser = new ArrayList<>();
        Map<ShippingStatus, List<Order>> orderByShippingStatus = new HashMap<>();
        Map<Integer, List<String>> thumbOfOrders = new HashMap<>();
        List<Product> data;
        List<Category> categories;
        try {
            data = service.getAllProducts();
            categories = cateService.getAllCategory();
            orders = orderService.getOrderOfUser(u.getId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (!orders.isEmpty()) {
            for (Order order : orders) {
                order.setTotal(orderService.getTotalOfOrder(order.getId()));
                if (orderByShippingStatus.containsKey(order.getShippingStatus())) {
                    orderByShippingStatus.get(order.getShippingStatus()).add(order);
                } else {
                    List<Order> temp = new ArrayList<>();
                    temp.add(order);
                    orderByShippingStatus.put(order.getShippingStatus(), temp);
                }
            }
            orderItemsOfUser = orderItemService.getOrderItem(u.getId());

            for (OrderItem orderItem : orderItemsOfUser) {
                String thumb = "";
                for (Product d : data) {
                    if (d.getId() == orderItem.getProductID()) thumb = d.getThumb();
                }
                if (thumbOfOrders.containsKey(orderItem.getOrderID())) {
                    thumbOfOrders.get(orderItem.getOrderID()).add(thumb);
                } else {
                    List<String> temp = new ArrayList<>();
                    temp.add(thumb);
                    thumbOfOrders.put(orderItem.getOrderID(), temp);
                }
            }
        }
        req.setAttribute("thumbOfOrders", thumbOfOrders);
        req.setAttribute("allProducts", data);
        req.setAttribute("ordersOfUser", orders);
        req.setAttribute("orderByShippingStatus", orderByShippingStatus);

        List<Product> favoriteProducts = new ArrayList<>();
        List<Integer> favoriteProductIds = favouriteProductService.getFavouriteProductByUserId(u.getId());

        for (Product pro : data) {
            if (favoriteProductIds.contains(pro.getId())) {
                favoriteProducts.add(pro);
            }
        }
        req.setAttribute("favoriteProducts", favoriteProducts);

        //Lay du lieu category de hien thi len giao dien
        int catePerCol = 5;
        HashMap<Integer, List<Category>> mapCate = new HashMap<>();

        int countCol = categories.size() % catePerCol == 0 ? categories.size() / catePerCol : categories.size() / catePerCol + 1;

        for (int i = 0; i < countCol; i++) {
            int index = i * catePerCol;
            for (int j = index; j < index + catePerCol; j++) {
                if (!mapCate.containsKey(i)) {
                    List<Category> list = new ArrayList<>();
                    list.add(categories.get(j));
                    mapCate.put(i, list);
                } else {
                    if (j < categories.size()) mapCate.get(i).add(categories.get(j));
                    else break;
                }
            }
        }

        Address address = addService.getAddressById(u.getId());
        System.out.println(u.getId() + "hahahaa");

        req.setAttribute("address", address);
        req.setAttribute("mapCate", mapCate);
        req.getRequestDispatcher("/views/auth/Profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        HttpSession session = req.getSession(true);
        User u = (User) session.getAttribute("auth");

        ProductService service = new ProductService();
        OrderItemService orderItemService = new OrderItemService();
        OrderService orderService = new OrderService();
        Map<ShippingStatus, List<Order>> orderByShippingStatus = new HashMap<>();
        Map<Integer, List<String>> thumbOfOrders = new HashMap<>();

        // Đọc JSON từ request
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = req.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        String json = sb.toString();
        JSONObject jsonObject = new JSONObject(json); // Nếu bạn dùng org.json
        String status = jsonObject.getString("status");

        List<Product> data;
        List<Order> orderWithStatus = new ArrayList<>();
        List<OrderItem> orderItemsOfUser = new ArrayList<>();
        if (u != null) {
            try {
                data = service.getAllProducts();
                orderWithStatus = orderService.getOrderOfUserByStatus(u.getId(), status);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

            if (!orderWithStatus.isEmpty()) {
                for (Order order : orderWithStatus) {
                    order.setTotal(orderService.getTotalOfOrder(order.getId()));
                    if (orderByShippingStatus.containsKey(order.getShippingStatus())) {
                        orderByShippingStatus.get(order.getShippingStatus()).add(order);
                    } else {
                        List<Order> temp = new ArrayList<>();
                        temp.add(order);
                        orderByShippingStatus.put(order.getShippingStatus(), temp);
                    }
                }
                orderItemsOfUser = orderItemService.getOrderItem(u.getId());

                for (OrderItem orderItem : orderItemsOfUser) {
                    String thumb = "";
                    for (Product d : data) {
                        if (d.getId() == orderItem.getProductID()) thumb = d.getThumb();
                    }
                    if (thumbOfOrders.containsKey(orderItem.getOrderID())) {
                        thumbOfOrders.get(orderItem.getOrderID()).add(thumb);
                    } else {
                        List<String> temp = new ArrayList<>();
                        temp.add(thumb);
                        thumbOfOrders.put(orderItem.getOrderID(), temp);
                    }
                }
            }
        }
        // Tạo JSON trả về
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .registerTypeAdapter(Timestamp.class, new TimestampAdapter())
                .create();
        OrdersResponse response = new OrdersResponse(orderWithStatus, thumbOfOrders);
        resp.getWriter().write(gson.toJson(response));
//        System.out.println(response.toString());
//        String jsonResponse = gson.toJson(response); // Hoặc gson.toJson(orderList);
//        System.out.println("jsonResponse: " + jsonResponse);
//        PrintWriter out = resp.getWriter();
//        out.print(jsonResponse);
//        out.flush();
    }

    private static class OrdersResponse {
        private final List<Order> lists;
        private final  Map<Integer, List<String>> thumbs;

        public OrdersResponse(List<Order> lists, Map<Integer, List<String>> thumbs) {
            this.lists = lists;
            this.thumbs = thumbs;
        }

        public List<Order> getLists() {
            return lists;
        }
        public Map<Integer, List<String>> getThumbs() {
            return thumbs;
        }
        @Override
        public String toString() {
            return lists.toString();
        }
    }
}
