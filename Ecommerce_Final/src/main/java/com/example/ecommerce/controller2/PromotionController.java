package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.service.PromotionService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Promotion", value = "/promotion")
public class PromotionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PromotionService service = new PromotionService();
        String code = req.getParameter("codePro");
        Promotion promotion = service.getPromotionByCode(code);
        double valueOfPro = 0;
        if(promotion != null) {
            valueOfPro = promotion.getValueOfPro();
            req.setAttribute("code", code);
            req.setAttribute("valueOfPro", valueOfPro);
        }else {
            req.setAttribute("error", "Mã giảm giá không hợp lệ.");
        }
    }
}
