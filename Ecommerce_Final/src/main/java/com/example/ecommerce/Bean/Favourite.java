package com.example.ecommerce.Bean;

import com.example.ecommerce.DAO.interf.IFavouriteDAO;

import java.util.List;

public class Favourite implements IFavouriteDAO {
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

    @Override
    public Favourite getFavouriteProduct(int pID) {
        return null;
    }

    @Override
    public List<Favourite> getAllFavourite() {
        return List.of();
    }

    @Override
    public Favourite addFavouriteProduct(Favourite favourite) {
        return null;
    }

    @Override
    public boolean deleteFavouriteProduct(int pID) {
        return false;
    }
}
