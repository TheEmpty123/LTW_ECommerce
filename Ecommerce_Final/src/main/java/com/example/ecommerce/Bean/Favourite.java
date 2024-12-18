package com.example.ecommerce.Bean;

import com.example.ecommerce.DAO.interf.IFavouriteDAO;
import com.example.ecommerce.Database.JDBIConnect;

import java.util.Collections;
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
        return Collections.singletonList(JDBIConnect.getInstance().getJdbi().withHandle(handle -> {
            return handle.createQuery(" SELECT * FROM favourite WHERE productID = :productID")
                    .bind("productID", productID)
                    .mapTo(Favourite.class)
                    .findOne()
                    .orElse(null);
        }));
    }

    @Override
    public Favourite addFavouriteProduct(Favourite favourite) {
        JDBIConnect.getInstance().getJdbi().withHandle(handle -> {
            int rowsAffected = handle.createUpdate("INSERT INTO favourite (productID, userID) VALUES (:productID, :userID)")
                    .bind("productID", favourite.productID)
                    .bind("userID", favourite.userID)
                    .execute();

            if (rowsAffected > 0) {
                return favourite;
            } else {
                return null;
            }
        });
        return favourite;
    }

    @Override
    public boolean deleteFavouriteProduct(int pID) {
        return JDBIConnect.getInstance().getJdbi().withHandle(handle -> {
            int rowsAffected = handle.createQuery("delete from favourite where productID = :productID")
                    .bind("productID", pID)
                    .mapTo(Favourite.class)
                    .findOne().orElse(null);
            return rowsAffected > 0;
        });

    }
}
