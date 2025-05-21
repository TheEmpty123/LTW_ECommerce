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
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.mail.internet.AddressException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@MultipartConfig
@WebServlet(name = "Order", value = "/order")
public class OrderController extends HttpServlet {
    OrderItemService orderItemService = new OrderItemService();
    OwnAddressService ownAddressService = new OwnAddressService();
    OrderService service = new OrderService();
    CategoryService cateService = new CategoryService();
    List<Category> categories;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            HttpSession session = req.getSession(true);
            User user = (User) session.getAttribute("auth");
            categories = cateService.getAllCategory();

            if (user != null) {
                int idUser = user.getId();
                List<OrderItem> orderitems = orderItemService.getOrderItem(idUser);
                List<OwnAddress> address = ownAddressService.getOwnAddress(idUser);
                Cart cart = (Cart) session.getAttribute("cart");

                System.out.println("Fetched order items: " + orderitems);

                double totalMoney = service.getTotalRevenue(true);

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
                req.setAttribute("totalCart", cart.getTotal());
                req.setAttribute("mapCate", mapCate);
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
        OwnAddressService ownAddressService = new OwnAddressService();

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

                List<OwnAddress> oa = ownAddressService.getOwnAddress(idUser);
                String status = "{\"status\":\"success\"}";

                AddressResponse adRe = new AddressResponse(oa.get(0), status);
                System.out.println(adRe.getAddress());
                System.out.println(adRe.getStatus());
                Gson gson = new GsonBuilder()
                        .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                        .registerTypeAdapter(Timestamp.class, new TimestampAdapter())
                        .create();
//                PrintWriter out = resp.getWriter();
//                out.print(gson.toJson(adRe));
//                out.flush();
                resp.getWriter().write(gson.toJson(adRe));
                System.out.println("Đã trả json về client");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static class AddressResponse {
        private final OwnAddress address;
        private final String status;

        public AddressResponse(OwnAddress address, String status) {
            this.address = address;
            this.status = status;
        }

        public OwnAddress getAddress() {
            return address;
        }

        public String getStatus() {
            return status;
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
        req.getParameterMap().forEach((k, v) -> System.out.println(k + " = " + String.join(",", v)));

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

