package com.example.ecommerce.controller;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.DAO.iml.ProductDao;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProduct", value = "/list-product")
public class ListProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService service = new ProductService();
        List<Product> data = null;
        try{
            data = service.getAllProducts();
        }catch (Exception e){
            throw new RuntimeException(e);
        }
        int itemsPerPage = 20;
        int currentPage = 1;

        // Lấy tham số "page" từ URL
        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
        }
        // Xác định phạm vi sản phẩm
        int start = (currentPage - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, data.size());

        List<Product> pageProducts = data.subList(start, end);

        // Tổng số trang
        int totalPages = (int) Math.ceil((double) data.size() / itemsPerPage);
        // Gửi dữ liệu tới JSP
        req.setAttribute("products", pageProducts);
        req.setAttribute("currentPage", (Integer) currentPage);
        req.setAttribute("totalPages", (Integer) totalPages);
        req.getRequestDispatcher("/views/web/product/All-products.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
