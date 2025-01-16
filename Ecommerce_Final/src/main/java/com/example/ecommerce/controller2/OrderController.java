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

            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            session.setAttribute("cart", cart);

            if (user != null) {
                int idUser = user.getId();
                System.out.println("id " + idUser);

                Order order = new Order(idUser);
                this.service.addOrder(order);

                processCartItems(cart, order);

                handleShippingInfo(req, resp, idUser);

                resp.sendRedirect(req.getContextPath() + "/order");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void processCartItems(Cart cart, Order order) {
        for (CartProduct cartProduct : cart.getList()) {
            int productId = cartProduct.getId();
            int amount = cartProduct.getQuantity();
            System.out.println("Inserting/updating OrderItem with orderId: " + order.getId() + ", productId: " + productId + ", amount: " + amount);

            OrderItem orderItem = orderItemService.findOrderItemByProductId(new OrderItem(order.getId(), productId));

            if (orderItem != null) {

                orderItem.setAmount(orderItem.getAmount() + amount);
                orderItemService.updateOrderItem(orderItem.getId(), orderItem.getProductID(), orderItem.getAmount());
            } else {
                orderItem = new OrderItem(order.getId(), productId, amount);
                orderItemService.addOrderItem(orderItem);
            }
        }
    }

    private void handleShippingInfo(HttpServletRequest req, HttpServletResponse resp, int idUser) throws IOException {

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

        if (isShippingInfoValid(name, phone, address, city, district)) {
            this.ownAddressService.updateOwnAddress(name, phone, city, address, idUser, idUser);
            System.out.println("Điền thông tin thành công!");
        } else {
            resp.getWriter().write("{\"success\": false, \"error\": \"Vui lòng điền đầy đủ thông tin.\"}");
        }
    }

    private boolean isShippingInfoValid(String name, String phone, String address, String city, String district) {
        return name != null && !name.isEmpty() &&
                phone != null && !phone.isEmpty() &&
                address != null && !address.isEmpty() &&
                city != null && !city.isEmpty() &&
                district != null && !district.isEmpty();
    }


}

