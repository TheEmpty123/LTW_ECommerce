package com.example.ecommerce.Bean;

public class OrderItem {
    private int id;
    private int orderID;
    private int productID;
    private int amount;

    public OrderItem(int id, int orderID, int productID, int amount) {
        this.id = id;
        this.orderID = orderID;
        this.productID = productID;
        this.amount = amount;
    }

    public OrderItem() {
    }

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

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", orderID=" + orderID +
                ", productID=" + productID +
                ", amount=" + amount +
                '}';
    }
}
