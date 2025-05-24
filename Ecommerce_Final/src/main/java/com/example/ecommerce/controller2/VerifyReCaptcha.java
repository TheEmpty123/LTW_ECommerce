package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Cart.CartProduct;
import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.OrderItemService;
import com.example.ecommerce.service.OrderService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Scanner;

@MultipartConfig
@WebServlet(name = "Verify", value = "/verify")
public class VerifyReCaptcha extends HttpServlet {
    OrderItemService orderItemService = OrderItemService.getInstance();

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////        resp.sendRedirect("/views/web/order/order-detail.jsp"); // sửa đường dẫn phù hợp
////        resp.setHeader("Content-Security-Policy",
////                "script-src 'self' https://www.google.com https://www.gstatic.com; " +
////                        "frame-src https://www.google.com https://www.gstatic.com; " +
////                        "style-src 'self' 'unsafe-inline';");
//    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String gRecaptchaResponse = req.getParameter("g-recaptcha-response");
//        String publicKey = req.getParameter("public-key-input");
//        String signature = req.getParameter("signature-input");

        OrderService orderService = OrderService.getInstance();
        OrderItemService orderItemService = OrderItemService.getInstance();
        HttpSession session = req.getSession();
        User u = (User) session.getAttribute("auth");

        // Nếu null, thử đọc theo cách này
        for (Part part : req.getParts()) {
            if (part.getName().equals("g-recaptcha-response")) {
                Scanner scanner = new Scanner(part.getInputStream()).useDelimiter("\\A");
                gRecaptchaResponse = scanner.hasNext() ? scanner.next() : "";
            }
        }

        if (gRecaptchaResponse != null && !gRecaptchaResponse.isEmpty()) {
            boolean isVerified = verifyRecaptcha(gRecaptchaResponse);
            if (isVerified) {
                try {
                    // Xử lý tiếp theo
                    Cart cart = (Cart) session.getAttribute("cart");
                    String idPromotion = (String) session.getAttribute("idPromotion");
                    double valueOfPromotion = (Double) session.getAttribute("valueOfPromotion");
                    Order o = null;
                    try {
                        if (idPromotion != null) {
                            o = new Order(u.getId(), 1, idPromotion, u.getPhoneNum());
                        } else {
                            o = new Order(u.getId(), 1, u.getPhoneNum());
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    //sao khi tạo order xong thì lưu order xuống database
                    if (o != null) {
                        try {
                            orderService.addOrder(o);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        System.out.println("order added");
                        try {
                            processCartItems(cart, o);
                            cart.clearCart();
                            valueOfPromotion = 0;
                            session.setAttribute("valueOfPromotion", valueOfPromotion);

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    PrintWriter out = resp.getWriter();
                    out.print("{\"success\": true, \"message\": \"Đã đặt hàng thành công.\"}");
                    out.flush();
                }catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                resp.getWriter().println("Xác minh thất bại!");
                System.out.println("Xác minh thất bại  rồi.");
            }
        }
    }

    //<%--                site-key: 6Lc4L0ErAAAAAHLirMncOYQv2pUs4wtiPKfd2aKB--%>
//<%--                secret key : 6Lc4L0ErAAAAACs0n5SjHksm6KTNvwgX-QGwMEyf--%>
    public static boolean verifyRecaptcha(String gRecaptchaResponse) throws IOException {
        String secretKey = "6Lc4L0ErAAAAACs0n5SjHksm6KTNvwgX-QGwMEyf"; // lấy từ Google reCAPTCHA dashboard
        String url = "https://www.google.com/recaptcha/api/siteverify";

        String postData = "secret=" + URLEncoder.encode(secretKey, "UTF-8") +
                "&response=" + URLEncoder.encode(gRecaptchaResponse, "UTF-8");

        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(postData.getBytes(StandardCharsets.UTF_8));
        }

        StringBuilder response = new StringBuilder();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
        }

        return response.toString().contains("\"success\": true");
    }

    private void processCartItems(Cart cart, Order order) {
        for (CartProduct cartProduct : cart.getList()) {
            int productId = cartProduct.getId();
            int amount = cartProduct.getQuantity();
            System.out.println("Inserting/updating OrderItem with orderId: " + order.getId() + ", productId: " + productId + ", amount: " + amount);

            OrderItem orderItem = orderItemService.findOrderItemByProductId(new OrderItem(order.getId(), productId));

//            if (orderItem != null) {
//
//                orderItem.setAmount(orderItem.getAmount() + amount);
//                orderItemService.updateOrderItem(orderItem.getId(), orderItem.getProductID(), orderItem.getAmount());
//            } else {
            orderItem = new OrderItem(order.getId(), productId, amount);
            orderItemService.addOrderItem(orderItem);
//            }
        }
    }

}
