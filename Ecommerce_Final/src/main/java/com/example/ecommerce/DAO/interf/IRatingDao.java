package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Rating;

import java.util.List;

public interface IRatingDao {
    List<Rating> getAllRating();
    List<Rating> getRatingByProductId(int id);
    boolean addRating(int userId, int productId, int stars, String commentRate);
    boolean deleteRating(int userId, int productId);
}
