package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.*;
import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Cart.CartProduct;
import com.example.ecommerce.DAO.iml.OrderDao;
import com.example.ecommerce.DAO.iml.OrderItemDao;
import com.example.ecommerce.Location.LocationData;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.OrderItemService;
import com.example.ecommerce.service.OrderService;
import com.example.ecommerce.service.OwnAddressService;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "Order", value = "/order")
public class OrderController extends HttpServlet {
    OrderItemService orderItemService = new OrderItemService();
    OwnAddressService ownAddressService = new OwnAddressService();
    OrderService service = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            HttpSession session = req.getSession(true);
            User user = (User) session.getAttribute("auth");

            if (user != null) {
                int idUser = user.getId();
                List<OrderItem> orderitems = orderItemService.getOrderItem(idUser);
                List<OwnAddress> address = ownAddressService.getOwnAddress(idUser);

                System.out.println("Fetched order items: " + orderitems);

                double totalMoney = service.getTotalRevenue(true);
//                this.service.addOrder(idUser);

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
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = req.getSession(true);
            Cart cart = (Cart) session.getAttribute("cart");
            User user = (User) session.getAttribute("auth");

//            String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
//            Gson gson = new Gson();
//            CartProduct newItem = gson.fromJson(json, CartProduct.class);


            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            if (user != null) {
                int idUser = user.getId();
                System.out.println("id" + idUser);


                Order order = new Order(idUser);
                System.out.println("inserting order with userid" + idUser);
//                OrderItem orderItem = new OrderItem(order.getId(), idProduct, amount);
//                System.out.println("Inserting OrderItem with orderId: " + order.getId() + ", productId: " + idProduct + ", amount: " + amount);

//                this.service.addOrder(order);
//                this.orderItemService.addOrderItem(orderItem);

                int productId = 0;
                int amount = 0;
                OrderItem orderItem = new OrderItem();
                for (CartProduct cartProduct : cart.getList()) {
                    productId = cartProduct.getId();
                    amount = cartProduct.getQuantity();
                    System.out.println("abc" + productId);

                    orderItem = new OrderItem(order.getId(), productId, amount);
                    System.out.println("Inserting OrderItem with orderId: " + order.getId() + ", productId: " + productId + ", amount: " + amount);

                }
                this.service.addOrder(order);
                this.orderItemService.addOrderItem(orderItem);

                String name = req.getParameter("name");
                String phone = req.getParameter("phone");
                String address = req.getParameter("address");
                String idCity = req.getParameter("city");
                String city = LocationData.findProvine(idCity);
                String district = req.getParameter("district");

                System.out.println("Name: " + name);
                System.out.println("Phone: " + phone);
                System.out.println("Address: " + address);
                System.out.println("City: " + city);
                System.out.println("District: " + district);


                if (name != null && !name.isEmpty() &&
                        phone != null && !phone.isEmpty() &&
                        address != null && !address.isEmpty() &&
                        city != null && !city.isEmpty() &&
                        district != null && !district.isEmpty()) {

                    this.ownAddressService.updateOwnAddress(name, phone, city, address, idUser, idUser);

                    System.out.println("Điền thông tin thành công!");
                    resp.sendRedirect(req.getContextPath() + "/order");
                } else {
                    System.out.println(" ");
                }
            } else {
                resp.getWriter().write("{\"success\": false, \"error\": \"Người dùng không hợp lệ.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().write("{\"success\": false, \"error\": \"Có lỗi xảy ra khi xử lý yêu cầu.\"}");
        }
    }


}

