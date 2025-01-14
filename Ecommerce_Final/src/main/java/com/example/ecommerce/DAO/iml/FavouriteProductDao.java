package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.FavouriteProduct;
import com.example.ecommerce.DAO.interf.IFavouriteProductDao;

import java.util.ArrayList;
import java.util.List;

public class FavouriteProductDao extends ImplementBase implements IFavouriteProductDao {
    List<FavouriteProduct> favouriteProductList;
    public static FavouriteProductDao instance;

    public FavouriteProductDao(){
//        favouriteProductList = getAllProduct();

    }
    public static FavouriteProductDao getInstance(){
        if(instance == null){
            instance = new FavouriteProductDao();
        }
        return instance;
    }
    public List<FavouriteProduct> getList(){
        return favouriteProductList;
    }
    @Override
    public List<FavouriteProduct> getAllProduct() {
        return db.jdbi.withHandle(handle ->
                handle.createQuery("select * from favourite_products")
                        .mapToBean(FavouriteProduct.class)
                        .list());
    }

    @Override
    public List<Integer> getByUserId(int id) {
        List<Integer> rs = new ArrayList<>();
        List<FavouriteProduct> list;
        list = db.jdbi.withHandle(handle ->
                handle.createQuery("select * from favourite_products where userID = :userId")
                        .bind("userId", id)
                        .mapToBean(FavouriteProduct.class)
                        .list());
        for (FavouriteProduct favouriteProduct : list) {
           rs.add(favouriteProduct.getProductID());
        }
        return rs;
    }

    @Override
    public boolean addFavouriteProduct(int productId, int userId) {
        int rowsAffected = db.jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO favourite_products (productID, userID) VALUES (:productId, :userId)")
                        .bind("productId", productId)
                        .bind("userId", userId)
                        .execute()
        );
        handle.close();
        return rowsAffected > 0; // Trả về true nếu thêm thành công.
    }

    @Override
    public boolean deleteFavouriteProduct(int productId, int userId) {
        int rowsAffected = db.jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM favourite_products WHERE productID = :productId AND userID = :userId")
                        .bind("productId", productId)
                        .bind("userId", userId)
                        .execute()
        );
        handle.close();
        return rowsAffected > 0; // Trả về true nếu có ít nhất một dòng bị xóa
    }
}
