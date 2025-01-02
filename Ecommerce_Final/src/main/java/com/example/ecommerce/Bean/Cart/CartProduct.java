package com.example.ecommerce.Bean.Cart;

import com.example.ecommerce.Bean.Product;

public class CartProduct {
    private String name;
    private String img;
    private double price;
    private int quantity;
    public CartProduct(String name,String img, double price, int quantity) {
        this.name = name;
        this.img = img;
        this.price = price;
        this.quantity = quantity;
    }
    public CartProduct(){

    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getImg() {
        return img;
    }
    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
