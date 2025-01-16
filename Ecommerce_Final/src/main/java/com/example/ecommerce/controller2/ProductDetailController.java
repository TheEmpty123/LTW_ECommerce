package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.*;
import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.ProductAttributeService;
import com.example.ecommerce.service.ProductService;
import com.example.ecommerce.service.RatingService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "ProductDetail", value = "/product")
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductService service = ProductService.getInstance();
        CategoryService cateService = CategoryService.getInstance();
        ProductAttributeService productDetailServ = ProductAttributeService.getInstance();
        RatingService ratingService = RatingService.getInstance();

        Category category = null;
        List<Category> categories = new ArrayList<>();
        String pid = req.getParameter("id");
        String pAttributeID = req.getParameter("atributeID");
        String categoryID = req.getParameter("cateID");
        List<Product> list4Product;
        List<Rating> listRatingOfProduct;
        try{
            int id = Integer.parseInt(pid);
            int attributeID = Integer.parseInt(pAttributeID);
            int cateID = Integer.parseInt(categoryID);
            Product p = service.getProductById(id);
            categories = cateService.getAllCategory();
            category = cateService.getCategoryById(cateID);
            ProductAttribute pat = productDetailServ.getProductAttributeById(attributeID);
            list4Product  = service.get4ProductOfCate(cateID);;
            listRatingOfProduct = ratingService.getRatingByProductID(id);

            req.setAttribute("totalRatings", listRatingOfProduct.size());
            req.setAttribute("ratings", listRatingOfProduct);
            req.setAttribute("productOfCate", list4Product);
            req.setAttribute("p", p);
            req.setAttribute("pat", pat);
        }catch (NumberFormatException e){
            resp.sendError(404,"Product Not Found!");
            return;
        }
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
        HttpSession session = req.getSession(true);
        User u = (User) session.getAttribute("auth");
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null){
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        session.setAttribute("cart", cart);

        req.setAttribute("mapCate", mapCate);
        req.setAttribute("categories", category);
        req.getRequestDispatcher("/views/web/product/Product-detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
