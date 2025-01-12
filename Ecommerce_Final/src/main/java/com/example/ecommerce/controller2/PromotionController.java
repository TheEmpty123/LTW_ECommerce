package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.Bean.CodeString;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.PromotionService;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Promotion", value = "/PromotionController")
public class PromotionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PromotionService service = PromotionService.getInstance();

        HttpSession session = req.getSession(true);
        User u = (User) session.getAttribute("auth");
        Cart cart = (Cart) session.getAttribute("cart");

        String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        Gson gson = new Gson();
        System.out.println(json);
        CodeString code = gson.fromJson(json, CodeString.class);

        double value = 0;
        String notification = "";
        System.out.println(u);

        if (u != null) {
            if (!cart.getList().isEmpty()) {
                if (!code.getCode().equals("null")) {
                    Promotion promotion = service.getPromotionByCode(code.getCode());
                    if (promotion != null) {
                        value = promotion.getValueOfPro();
                        notification = "Đã áp dụng mã giảm giá.";
                    } else {
                        value = 0;
                        notification = "Mã giảm giá không hợp lệ.";
                    }
                } else {
                    value = 0;
                    notification = "Vui lòng nhập mã giảm giá.";
                }
            }else {
                value = 0;
                notification = "Giỏ hàng của bạn đang trống.";
            }
        }

        double result = cart.getTotal() - value;

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(new PromotionResponse(result, notification)));
    }

    private static class PromotionResponse {
        private final double valueAfterPromotion;
        private final String notificationOfPromotion;

        public PromotionResponse(double valueAfterPromotion, String notification) {
            this.valueAfterPromotion = valueAfterPromotion;
            this.notificationOfPromotion = notification;
        }
    }
}
