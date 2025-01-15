package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Cart.CartProduct;
import com.example.ecommerce.Bean.FilterInput;
import com.example.ecommerce.Bean.Product;
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
        System.out.println(json);
        FilterInput newFilter = gson.fromJson(json, FilterInput.class);

        List<Product> products = productService.getProductByFilter(newFilter.getSort(), newFilter.getMaterial());
        System.out.println(products);
        int itemsPerPage = 20;
        int currentPage = 1;

        // Lấy tham số "page" từ URL
        String pageParam = req.getParameter("page");
        System.out.println(pageParam);

        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
        }
        // Xác định phạm vi sản phẩm
        int start = (currentPage - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, products.size());

        List<Product> pageProducts = products.subList(start, end);
        // Tổng số trang
        int totalPages = (int) Math.ceil((double) products.size() / itemsPerPage);
        System.out.println(totalPages);
        HttpSession session = req.getSession(true);
        User u = (User) session.getAttribute("auth");
        int userId = -1;
        if (u != null) {
            userId = u.getId();
        }
        // Tạo JSON trả về
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(new MakeResponse(pageProducts, currentPage, totalPages, userId)));
    }

    private static class MakeResponse {
        private final List<Product> pageProducts;
        private final int currentPage;
        private final int totalPages;
        private final int userId;

        public MakeResponse(List<Product> pageProducts, int currentPage, int totalPages, int userId) {
            this.pageProducts = pageProducts;
            this.currentPage = currentPage;
            this.totalPages = totalPages;
            this.userId = userId;
        }
    }
}
