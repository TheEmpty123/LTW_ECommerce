package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Cart.Cart;
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

        int countCol = categories.size() % catePerCol == 0 ? categories.size() / catePerCol : categories.size() / catePerCol + 1;

        for (int i = 0; i < countCol; i++) {
            int index = i * catePerCol;
            for (int j = index; j < index + catePerCol; j++) {
                if (!mapCate.containsKey(i)) {
                    List<Category> list = new ArrayList<>();
                    list.add(categories.get(j));
                    mapCate.put(i, list);
                } else {
                    if (j < categories.size()) mapCate.get(i).add(categories.get(j));
                    else break;
                }
            }
        }
        String pageParam = req.getParameter("page");
        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);

        }
        int start = (currentPage - 1) * itemsPerPage;
        int end = Math.min(start + itemsPerPage, data.size());
        List<Product> pageProducts = data.subList(start, end);

        int totalPages = (int) Math.ceil((double) data.size() / itemsPerPage);

        HttpSession session = req.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if ((c == null)) {
            c = new Cart();
            session.setAttribute("cart", c);
        }
        session.setAttribute("cart", c);
        req.setAttribute("products", pageProducts);
        req.setAttribute("currentPage", (Integer) currentPage);
        req.setAttribute("totalPages", (Integer) totalPages);
        req.setAttribute("mapCate", mapCate);
        req.getRequestDispatcher("/views/web/product/All-products.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
