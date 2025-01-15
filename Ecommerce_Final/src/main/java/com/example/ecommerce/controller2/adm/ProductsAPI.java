package com.example.ecommerce.controller2.adm;

import java.io.*;

import com.example.ecommerce.controller2.MC;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "productApi", value = "/api/products")
public class ProductsAPI extends HttpServlet implements ControllerBase{

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        initialize();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        var p = MC.instance.productService.getAllProductsDto();
        var json = MC.instance.productService.convertToJson(p);

        response.getWriter().write(json.toString());
    }

    public void destroy() {
    }
}