package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.FavouriteProduct;
import com.example.ecommerce.Bean.FavouriteProductJson;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.FavouriteProductService;
import com.example.ecommerce.service.ProductService;
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
        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("auth");
        FavouriteProductService service = FavouriteProductService.getInstance();

        List<Integer> listId = new ArrayList<>();
        if (user != null) {
            List<Integer> favouriteProductIds = service.getFavouriteProductByUserId(user.getId());

            req.setAttribute("favorites", favouriteProductIds);

            listId = service.getFavouriteProductByUserId(user.getId());
        }
        Gson gson = new Gson();
        String json = gson.toJson(listId.toArray(new Integer[0]));
        // Thiết lập response
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FavouriteProductService favouriteProductService = FavouriteProductService.getInstance();
        HttpSession session = req.getSession(true);

        User u = (User) session.getAttribute("auth");
        // Lấy dữ liệu từ AJAX gửi qua
        String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        Gson gson = new Gson();
        FavouriteProductJson newProduct = gson.fromJson(json, FavouriteProductJson.class);
        FavouriteProduct productConvert = new FavouriteProduct(newProduct.getProductID(), newProduct.getUserID());
        List<Integer> list2 = new ArrayList<>();
        int userId;
        if (u != null) {
            list2 = favouriteProductService.getFavouriteProductByUserId(u.getId());
            if (!list2.contains(productConvert.getProductID())) {
                favouriteProductService.addFavouriteProduct(productConvert.getProductID(), u.getId());
                list2 = favouriteProductService.getFavouriteProductByUserId(u.getId());
                System.out.println("favourite product added");
                System.out.println(list2);
            } else {
                favouriteProductService.deleteFavouriteProduct(productConvert.getProductID(), u.getId());
                list2 = favouriteProductService.getFavouriteProductByUserId(u.getId());
                System.out.println("favourite product removed");
                System.out.println(list2);
            }

//            for (FavouriteProduct favouriteProduct : list2) {
//                list.add(favouriteProduct.getProductID());
//            }

            userId = u.getId();
        } else userId = -1;
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(new ResultResponse(list2.toArray(new Integer[0]), userId)));
    }

    private static class ResultResponse {
        private final Integer[] listProduct;
        private final int userId;

        public ResultResponse(Integer[] list, int userId) {
            this.listProduct = list;
            this.userId = userId;
        }
    }
}
