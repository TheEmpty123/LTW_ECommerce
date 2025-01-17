package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Rating;
import com.example.ecommerce.DAO.iml.RatingDao;

import java.time.LocalDateTime;
import java.util.List;

public class RatingService extends ServiceBase {
    private static RatingService instance;
    private RatingDao ratingDao = new RatingDao();
    @Override
    public void init() {
        log.info("RatingService init...");
    }
    public static RatingService getInstance() {
        if (instance == null) {
            instance = new RatingService();
            instance.ratingDao = new RatingDao();
        }
        return instance;
    }
    public List<Rating> getAllRating() {
        return ratingDao.getAllRating();
    }
    public List<Rating> getRatingByProductID(int productID) {
        return ratingDao.getRatingByProductId(productID);
    }
    public boolean addRating(int userId, int productId, int stars, String commentRate, LocalDateTime dateRate) {
        return ratingDao.addRating(userId ,productId, stars, commentRate,dateRate);
    }
    public boolean deleteRating(int userId, int productId){
        return ratingDao.deleteRating(userId, productId);
    }
    public int countStars(int numberStars, int productID){
        return ratingDao.countStars(numberStars, productID);
    }

}
