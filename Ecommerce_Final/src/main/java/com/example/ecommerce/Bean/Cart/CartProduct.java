package com.example.ecommerce.Bean.Cart;

import com.example.ecommerce.Bean.Product;

public class CartProduct {
    private int quantity;
    private Product product;
    private double price;

    public CartProduct(int quantity, Product product, double price) {
        this.quantity = quantity;
        this.product = product;
        this.price = product.getPrice() * price;
    }
    public CartProduct(){

    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
