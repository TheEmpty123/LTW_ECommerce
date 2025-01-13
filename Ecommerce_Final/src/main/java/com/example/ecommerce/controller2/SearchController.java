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
    private ProductService productService = new ProductService();
    private CategoryService categoryService = new CategoryService();
    private List<Product> list;
    private List<Category> categoryList;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        try {
            String value = req.getParameter("search-input");
            System.out.println(value);
            if (value == null || value.isEmpty()) {
                System.out.println(" ");
            }
//            list = dao.search(value);
            if (list == null) {
                System.out.println("ncc");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("products", list);
        req.getRequestDispatcher("/views/web/product/All-products.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
