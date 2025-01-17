package com.example.ecommerce.Bean;

public class FavouriteProductJson {
    private int productID;
    private int userID;

    public FavouriteProductJson(int productID, int userID) {
        this.productID = productID;
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public int getUserID() {
        return userID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    @Override
    public String toString() {
        return this.productID + "\t" + this.userID;
    }
}
