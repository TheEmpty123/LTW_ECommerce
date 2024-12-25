package com.example.ecommerce.controller;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Bean.ProductAttribute;
import com.example.ecommerce.service.ProductAttributeService;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ProductDetail", value = "/product")
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService service = ProductService.getInstance();
        ProductAttributeService productDetailServ = ProductAttributeService.getInstance();
        String pid = req.getParameter("id");
        String pAttributeID = req.getParameter("atributeID");

        try{
            int id = Integer.parseInt(pid);
            int attributeID = Integer.parseInt(pAttributeID);
            Product p = service.getProductById(id);
            ProductAttribute pat = productDetailServ.getProductAttributeById(attributeID);

            req.setAttribute("p", p);
            req.setAttribute("pat", pat);
        }catch (NumberFormatException e){
            resp.sendError(404,"Product Not Found!");
            return;
        }
        req.getRequestDispatcher("/views/web/product/Product-detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
