package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Category;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.ProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "listProduct", value = "/list-product")
public class ListProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        ProductService service = new ProductService();
        CategoryService cateService = new CategoryService();

        List<Product> data;
        List<Category> categories;
        try {
            data = service.getAllProducts();
            categories = cateService.getAllCategory();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        int itemsPerPage = 32;
        int currentPage = 1;

        //Lay du lieu category de hien thi len giao dien
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
        HttpSession session = req.getSession(true);
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) {
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
