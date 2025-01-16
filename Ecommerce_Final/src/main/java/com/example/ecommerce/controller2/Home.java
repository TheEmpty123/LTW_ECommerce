package com.example.ecommerce.controller2;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "home", value = "/kenes")
public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = null;
        HttpSession session = request.getSession(true);

        Cart c = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("auth");

        if (c == null) {
            c = new Cart();
            session.setAttribute("cart", c);
        }

        try {
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
        }

        if (user != null) {
            String idParam = request.getParameter("id");
            System.out.println("id cccccccc " + idParam);
            if (idParam != null && !idParam.isEmpty()) {
                try {
                    int productId = Integer.parseInt(idParam);
                    Product product = ProductService.getInstance().getProductById(productId);
                    this.updateRecentlyViewedProducts(session, product);
                } catch (NumberFormatException e) {
                    log("Invalid product ID format", e);
                    request.setAttribute("error", "Invalid product ID.");
                }
            }else {
                System.out.println("Không có tham số 'id' được truyền.");
            }

        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    private void updateRecentlyViewedProducts(HttpSession session, Product product) {
        System.out.println("dcccccc");
        if (product != null) {
            List<Product> recentlyViewed = (List<Product>) session.getAttribute("recentlyView");
            System.out.println("recently view" + recentlyViewed);
            if (recentlyViewed == null) {
                recentlyViewed = new ArrayList<>();
            }

            if (recentlyViewed.stream().noneMatch(p -> p.getId() == product.getId())) {
                recentlyViewed.add(0, product);
                if (recentlyViewed.size() > 8) {
                    recentlyViewed.remove(recentlyViewed.size() - 1);
                }
            }

            session.setAttribute("recentlyView", recentlyViewed);
        }
        System.out.println("khong co san pham nao ow day");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
