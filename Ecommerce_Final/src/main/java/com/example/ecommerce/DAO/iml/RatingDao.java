package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Rating;
import com.example.ecommerce.DAO.interf.IRatingDao;

import java.util.List;

public class RatingDao extends ImplementBase implements IRatingDao {
    public static RatingDao instance;
    public RatingDao() {
    }

    public static RatingDao getInstance() {
        if (instance == null) {
            instance = new RatingDao();
        }
        return instance;
    }
    @Override
    public List<Rating> getAllRating() {
        return db.jdbi.withHandle(handle ->
                handle.createQuery("select * from ratings")
                        .mapToBean(Rating.class).list());
    }

    @Override
    public List<Rating> getRatingByUserId(int id) {
        return db.jdbi.withHandle(handle ->
                handle.createQuery("select * from rating where userID= ?")
                        .bind(0, id)
                        .mapToBean(Rating.class).list());
    }

    @Override
    public boolean addRating(int userId, int productId, int stars, String commentRate) {
        int rowsAffected=  db.jdbi.withHandle(handle ->
                handle.createUpdate("insert into rating values (?,?,?,?)")
                        .bind(0, userId)
                        .bind(1, productId)
                        .bind(2,stars)
                        .bind(3, commentRate)
                        .execute());
        handle.close();
        return rowsAffected>0;
    }

    @Override
    public boolean deleteRating(int userId, int productId) {
        int rowsAffected = db.jdbi.withHandle(handle ->
                handle.createUpdate("delete from rating where userID = ? AND productID = ?")
                        .bind(0, userId)
                        .bind(1, productId)
                        .execute());
        handle.close();
        return rowsAffected >0;
    }
}
