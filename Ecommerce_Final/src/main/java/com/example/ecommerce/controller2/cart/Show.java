package com.example.ecommerce.controller2.cart;

import com.example.ecommerce.Bean.Category;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "Show", value = "/showCart")
public class Show extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Lay du lieu category de hien thi len giao dien
        ProductService service = new ProductService();
        CategoryService cateService = new CategoryService();

        List<Product> data;
        List<Category> categories;
        try{
            data = service.getAllProducts();
            categories = cateService.getAllCategory();
        }catch (Exception e){
            throw new RuntimeException(e);
        }

        int catePerCol = 5;
        HashMap<Integer, List<Category>> mapCate = new HashMap<>();

        int countCol = categories.size()%catePerCol == 0 ?categories.size()/catePerCol : categories.size()/catePerCol+1;

        for (int i =0; i< countCol; i++){
            int index = i*catePerCol;
            for (int j = index; j< index+catePerCol; j++){
                if(!mapCate.containsKey(i)){
                    List<Category> list = new ArrayList<>();
                    list.add(categories.get(j));
                    mapCate.put(i,list);
                }
                else {
                    if(j < categories.size()) mapCate.get(i).add(categories.get(j));
                    else break;
                }
            }
        }
        req.setAttribute("mapCate", mapCate);
        req.getRequestDispatcher("/views/web/cart/Cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
