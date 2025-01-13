package com.example.ecommerce.Bean;

import java.io.Serializable;

public class FavouriteProduct implements Serializable {
    private int productID;
    private int userID;

    public FavouriteProduct(int productID, int userID) {
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
}
