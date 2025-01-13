package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.FavouriteProduct;
import com.example.ecommerce.Bean.FavouriteProductJson;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FavouriteProduct", value = "/favouriteProducts")
public class FavouriteProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FavouriteProductService favouriteProductService = FavouriteProductService.getInstance();
        HttpSession session = req.getSession(true);

        User u = (User) session.getAttribute("auth");
        // Lấy dữ liệu từ AJAX gửi qua
        String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        Gson gson = new Gson();
        System.out.println(json);
        FavouriteProductJson newProduct = gson.fromJson(json, FavouriteProductJson.class);
        FavouriteProduct productConvert = new FavouriteProduct(newProduct.getProductID(), newProduct.getUserID());
        System.out.println(productConvert);
        List<FavouriteProduct> list = new ArrayList<>();
        if(u != null){
            list = favouriteProductService.getFavouriteProductByUserId(u.getId());
            if(list.contains(productConvert)){
                favouriteProductService.deleteFavouriteProduct(productConvert.getProductID(), u.getId());
                list.remove(productConvert);
            }else{
                favouriteProductService.addFavouriteProduct(productConvert.getProductID(), u.getId());
                list.add(productConvert);
            }
        }
        req.setAttribute("favouriteProducts", list);
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(new ResultResponse(list)));

    }
    private static class ResultResponse{
        private final List<FavouriteProduct> listProduct;
        public ResultResponse(List<FavouriteProduct> list){
            this.listProduct = list;
        }
    }
}
