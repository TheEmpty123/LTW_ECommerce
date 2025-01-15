package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Cart.CartProduct;
import com.example.ecommerce.Bean.FilterInput;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Bean.ProductJson;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.controller2.cart.CartController;
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

@WebServlet(name = "FillerProduct", value = "/FilterProduct")
public class FilterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/FilterProduct");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); // Đọc dữ liệu từ client bằng UTF-8
        ProductService productService = new ProductService();

        // Nhận dữ liệu từ fetch
        String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        Gson gson = new Gson();
        FilterInput newFilter = gson.fromJson(json, FilterInput.class);
        List<Product> products = productService.getProductByFilter(newFilter.getSort(), newFilter.getMaterial());
        int itemsPerPage = 20;
        int currentPage = 1;

        // Lấy tham số "page" từ URL
        String pageParam = req.getParameter("page");

        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
        }
        // Xác định phạm vi sản phẩm
        int start = (currentPage - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, products.size());

        List<Product> pageProducts = products.subList(start, end);
        // Tổng số trang
        int totalPages = (int) Math.ceil((double) products.size() / itemsPerPage);
        HttpSession session = req.getSession(true);
        User u = (User) session.getAttribute("auth");
        int userId = -1;
        if (u != null) {
            userId = u.getId();
        }
        List<ProductJson> resProducts = new ArrayList<>();
        for (Product p : pageProducts) {
            resProducts.add(new ProductJson(p.getId(),p.getProName(),p.getDescription(),p.getPrice(),p.getThumb(), p.getCateID(), p.getAtributeID()));
        }

        // Tạo JSON trả về
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(new MakeResponse(resProducts, currentPage, totalPages, userId)));
    }

    private static class MakeResponse{
        private final List<ProductJson> pageProducts;
        private final int currentPage;
        private final int totalPages;
        private final int userId;

        public MakeResponse(List<ProductJson> pageProducts, int currentPage, int totalPages, int userId) {
            this.pageProducts = pageProducts;
            this.currentPage = currentPage;
            this.totalPages = totalPages;
            this.userId = userId;
        }
        public int getUserId(){
            return userId;
        }
        public List<ProductJson> getPageProducts(){
            return pageProducts;
        }
        public int getCurrentPage(){
            return currentPage;
        }
        public int getTotalPages(){
            return totalPages;
        }
    }
}
