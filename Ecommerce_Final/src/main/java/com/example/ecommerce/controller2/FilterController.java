package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Cart.CartProduct;
import com.example.ecommerce.Bean.FilterInput;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.controller2.cart.CartController;
import com.example.ecommerce.service.ProductService;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FillerProduct", value = "/FilterProduct")
public class FilterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService productService = new ProductService();

        // Nhận dữ liệu từ AJAX
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

        // Tạo JSON trả về
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(new MakeResponse(pageProducts, currentPage, totalPages)));

    }
    private static class MakeResponse {
        private final List<Product> pageProducts;
        private final int currentPage;
        private final int totalPages;

        public MakeResponse(List<Product> pageProducts, int currentPage, int totalPages) {
            this.pageProducts = pageProducts;
            this.currentPage = currentPage;
            this.totalPages = totalPages;
        }
    }
}
