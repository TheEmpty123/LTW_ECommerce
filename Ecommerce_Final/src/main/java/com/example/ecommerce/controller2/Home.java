package com.example.ecommerce.controller2;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Category;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.ConnectionException;

@WebServlet(name = "home", value = "/kenes")
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        MC.createInstance();
        List<Product> products = null;
        HttpSession session = request.getSession(true);
//        ProductService service = new ProductService();
//        CategoryService categoryService = new CategoryService();
//        String categoryId = request.getParameter("cateID");
//        List<Category> categories = new ArrayList<>();
//        Category category = null;

//        try {
//            int cateID = Integer.parseInt(categoryId);
//            products = service.getProductByCategory(cateID);
//            categories = categoryService.getAllCategory();
//            category = categoryService.getCategoryById(cateID);
//        } catch (NumberFormatException e) {
//            System.out.println("khong lay duoc id cua category");
//            request.setAttribute("error", "khong lay duoc id cua category");
//        }
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) {
            c = new Cart();
            session.setAttribute("cart", c);
        }
        try {
//            List<Product> products = MC.instance.productService.getNew4Products();
            products = ProductService.getInstance().getNew4Products();
            if (products == null || products.isEmpty()) {
                request.setAttribute("error", "No product found");
            } else {
                request.setAttribute("success", "ddmmm");
                request.setAttribute("list_product", products);
                System.out.println(products);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "failed to load product");

//            MC.instance.log.error(this.getClass().getName(),"Error connecting to DB");
//            MC.instance.log.error(this.getClass().getName(), new RuntimeException(e));
        }
        int productId = 0;
        try {
            String idParam = request.getParameter("id");
            if (idParam != null && idParam.isEmpty()) {
                productId = Integer.parseInt(idParam);
            }
            System.out.println(products);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid product ID.");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
            return;
        }
        Product product = ProductService.getInstance().getProductById(productId);
        if (product != null) {
            products = (List<Product>) session.getAttribute("recentlyView");
            if (products == null) {
                products = new ArrayList<>();
            }

            boolean alreadyView = products.stream().anyMatch(p -> p.getId() == product.getId());
            if (!alreadyView) {
                products.add(0, product);
                if (products.size() > 8) {
                    products.remove(products.size() - 1);
                }
            }
            session.setAttribute("recentlyView", products);
        }

        String url = "/index.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}