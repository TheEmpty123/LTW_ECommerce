package com.example.ecommerce.Bean.Cart;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.service.ProductService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
    private Map<Integer, CartProduct> data = new HashMap<Integer, CartProduct>();

    public String add(int add) {
        return add(add, 1);
    }

    public Map<Integer, CartProduct> getData() {
        return data;
    }

    public String add(int add, int quantity) {
        Product p = ProductService.getInstance().getProductById(add);
        if (p == null) {
            return "Product does not exist!";
        }
        CartProduct cp = new CartProduct();
        if (data.containsKey(add)) {
            cp = data.get(add);
//            if (cp.getQuantity() + quantity < cp.getProduct().get)
        }
        return "";
    }

    public String remove(int id, int quantity) {
        return "";
    }

    public void deleteProduct(int id) {
        if (data.containsKey(id)) {
            data.remove(id);
        }
    }

    public int getTotal() {
        return data.size();
    }

    public List<CartProduct> getSelectedProducts(List<String> selectedProductIds) {
        return null;
    }

}
