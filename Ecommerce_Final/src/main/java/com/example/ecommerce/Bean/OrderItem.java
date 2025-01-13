package com.example.ecommerce.Bean;

import java.io.Serializable;

public class OrderItem implements Serializable {
    private int id;
    private int orderID;
    private int productID;
    private int amount;
    // Các thuộc tính mới
    private String proName;
    private double price;
    private String thumb;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    // Phương thức toString
    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", orderID=" + orderID +
                ", productID=" + productID +
                ", amount=" + amount +
                ", proName='" + proName + '\'' +
                ", price=" + price +
                ", thumb='" + thumb + '\'' +
                '}';
    }
}

