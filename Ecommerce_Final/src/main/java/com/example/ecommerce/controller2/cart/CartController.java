package com.example.ecommerce.controller2.cart;

import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Cart.CartProduct;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Cart" , value = "/CartController")
public class CartController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

//        List<CartProduct> listCart = cart.getList();

        // Nhận dữ liệu từ AJAXd
        String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        Gson gson = new Gson();
        CartProduct newItem = gson.fromJson(json, CartProduct.class);

        // Kiểm tra sản phẩm có tồn tại trong giỏ chưa
        boolean exists = false;
        for (CartProduct item : cart.getList()) {
            if (item.getId() == (newItem.getId())) {
                cart.update(item.getId(), item.getQuantity()+1);
                exists = true;
                break;
            }
        }

        // Nếu chưa tồn tại, thêm sản phẩm mới
        if (!exists) {
            newItem.setQuantity(1);
            cart.add(newItem);
        }
        double total = cart.getTotal();

        session.setAttribute("cart", cart);
        // Tạo JSON trả về
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(new CartResponse(cart.getList(), total)));

    }
    private static class CartResponse {
        private final List<CartProduct> items;
        private final double totalPrice;

        public CartResponse(List<CartProduct> items, double totalPrice) {
            this.items = items;
            this.totalPrice = totalPrice;
        }
    }
}
