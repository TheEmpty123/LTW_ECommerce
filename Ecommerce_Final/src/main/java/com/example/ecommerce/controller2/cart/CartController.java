package com.example.ecommerce.controller2.cart;

import com.example.ecommerce.Bean.Cart.Cart;
import com.example.ecommerce.Bean.Cart.CartProduct;
import com.example.ecommerce.Bean.Category;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.CategoryService;
import com.example.ecommerce.service.ProductService;
import com.google.gson.Gson;
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

@WebServlet(name = "Cart", value = "/CartController")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Lay du lieu category de hien thi len giao dien
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

        req.setAttribute("mapCate", mapCate);
        req.getRequestDispatcher("/views/web/cart/Cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        //Lấy trên người dùng
        User u = (User) session.getAttribute("auth");
        String uName;
        if (u == null) uName = null;
        else uName = u.getUsername();


        // Nhận dữ liệu từ AJAX
        String json = req.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);
        Gson gson = new Gson();
        CartProduct newItem = gson.fromJson(json, CartProduct.class);

        double total = 0;
        if (u != null) {
            //lấy ra action cần thực hiện
            String action = req.getParameter("action");
            if ("remove".equals(action)) {
                cart.remove(newItem.getId());
            } else {
                // Kiểm tra sản phẩm có tồn tại trong giỏ chưa
                boolean exists = false;
                for (CartProduct item : cart.getList()) {
                    if (item.getId() == (newItem.getId())) {
                        cart.update(item.getId(), item.getQuantity() + 1);
                        exists = true;
                        break;
                    }
                }

                // Nếu chưa tồn tại, thêm sản phẩm mới
                if (!exists) {
                    newItem.setQuantity(1);
                    cart.add(newItem);
                }
            }
            total = cart.getTotal();

            session.setAttribute("cart", cart);
        }
        // Tạo JSON trả về
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        resp.getWriter().write(gson.toJson(new CartResponse(cart.getList(), total, uName)));

    }

    private static class CartResponse {
        private final List<CartProduct> items;
        private final double totalPrice;
        private final String userName;

        public CartResponse(List<CartProduct> items, double totalPrice, String userName) {
            this.items = items;
            this.totalPrice = totalPrice;
            this.userName = userName;
        }
    }
}
