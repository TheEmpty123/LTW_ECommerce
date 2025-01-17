package com.example.ecommerce.Bean;

public class Rating {
    private int userID;
    private String username;
    private int productID;
    private int stars;
    private String commentRate;

    public Rating() {}

    public Rating(int userID,String username, int productID, int stars, String commentRate) {
        this.userID = userID;
        this.username = username;
        this.productID = productID;
        this.stars = stars;
        this.commentRate = commentRate;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
    public String getUsername(){return username;}
    public void setUsername(String username){this.username = username;}

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public String getCommentRate() {
        return commentRate;
    }

    public void setCommentRate(String commentRate) {
        this.commentRate = commentRate;
    }

    @Override
    public String toString() {
        return "Rating{" +
                "userID=" + userID +
                ", username=" + username +
                ", productID=" + productID +
                ", stars=" + stars +
                ", commentRate='" + commentRate + '\'' +
                '}';
    }
}
