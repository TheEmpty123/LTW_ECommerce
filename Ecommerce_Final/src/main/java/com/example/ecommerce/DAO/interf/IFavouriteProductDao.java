package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.FavouriteProduct;

import java.util.List;

public interface IFavouriteProductDao {
    List<FavouriteProduct> getAllProduct();
    List<Integer> getByUserId(int id);
    boolean addFavouriteProduct(int productId, int userId);
    boolean deleteFavouriteProduct(int productId, int userId);
}
