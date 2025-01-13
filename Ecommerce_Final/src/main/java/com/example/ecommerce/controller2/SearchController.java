package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Category;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.DAO.iml.ProductDao;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.*;
import java.io.IOException;

@WebServlet(name = "search", value = "/search")
public class SearchController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService service = new ProductService();
        CategoryService cateService = new CategoryService();
        List<Product> data;
        List<Category> categories;

        try {
            String value = req.getParameter("search-input");
            data = service.getSearch(value);
            categories = cateService.getAllCategory();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        int itemsPerPage = 32;
        int currentPage = 1;

        int catePerCol = 5;
        HashMap<Integer, List<Category>> mapCate = new HashMap<>();

        req.getRequestDispatcher("/views/web/product/All-products.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
