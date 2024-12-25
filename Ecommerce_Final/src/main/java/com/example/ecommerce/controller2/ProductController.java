package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "products", value = "/products")
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService service = new ProductService();
        String categoryId = req.getParameter("cateID");
        try{
            int cateID = Integer.parseInt(categoryId);
            List<Product> products = service.getProductyByCategory(cateID);
            req.setAttribute("products", products);
        }catch (Exception e){
            e.printStackTrace();
        }
        req.getRequestDispatcher("/views/web/product/Products.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
