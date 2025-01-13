package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.FavouriteProduct;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.FavouriteProductService;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FavouriteProduct", value = "/favouriteProducts")
public class FavouriteProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        FavouriteProductService servive = FavouriteProductService.getInstance();

        User u = (User) session.getAttribute("auth");

        // Lấy dữ liệu từ AJAX gửi qua
        String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        Gson gson = new Gson();
        FavouriteProduct product = gson.fromJson(json, FavouriteProduct.class);

        if(u != null){
            List<FavouriteProduct> list = servive.getFavouriteProductByUserId(u.getId());
        }


    }
}
