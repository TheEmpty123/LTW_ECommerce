package com.example.ecommerce.Bean.Cart;

import jakarta.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.Map;

public class UserCart {
    private static Map<Integer,Cart> userCarts = new HashMap<Integer,Cart>();

    public static Cart getUserCart(int userId) {
        if (userCarts.containsKey(userId)) {
            return userCarts.get(userId);
        }else{
            return null;
        }
    }

    public static void updateCart(int userId, HttpSession session) {
        Cart cart = null;
        if (UserCart.getUserCart(userId)!= null) {
        }
    }
}
