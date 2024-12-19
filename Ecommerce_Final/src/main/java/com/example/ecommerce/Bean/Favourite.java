package com.example.ecommerce.Bean;

import com.example.ecommerce.DAO.interf.IFavouriteDAO;
import com.example.ecommerce.Database.JDBIConnect;

import java.io.Serializable;

public class Favourite implements Serializable {
    //productID
    private int productID;
    //userID
    private int userID;

    public Favourite() {
    }

    public Favourite(int productID, int userID) {
        this.productID = productID;
        this.userID = userID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    @Override
    public String toString() {
        return "Favourite{" +
                "productID=" + productID +
                ", userID=" + userID +
                '}';
    }


}
