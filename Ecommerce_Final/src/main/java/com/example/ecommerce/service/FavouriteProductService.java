package com.example.ecommerce.service;

import com.example.ecommerce.Bean.FavouriteProduct;
import com.example.ecommerce.DAO.iml.FavouriteProductDao;

import java.util.List;

public class FavouriteProductService extends ServiceBase {
    private static FavouriteProductService instance;
    private FavouriteProductDao favouriteProductDao = new FavouriteProductDao();

    @Override
    public void init() {
        log.info("FavouriteProductService init...");
    }

    public static FavouriteProductService getInstance() {
        if (instance == null) {
            instance = new FavouriteProductService();
            instance.favouriteProductDao = new FavouriteProductDao();
        }
        return instance;
    }

    public List<FavouriteProduct> getAllFavouriteProducts() {
        return favouriteProductDao.getAllProduct();
    }

    public List<FavouriteProduct> getFavouriteProductByUserId(int id) {
        return favouriteProductDao.getByUserId(id);
    }

    public boolean addFavouriteProduct(int productID, int userID) {
        return favouriteProductDao.addFavouriteProduct(productID, userID);
    }

    public boolean deleteFavouriteProduct(int productID, int userID) {
        return favouriteProductDao.deleteFavouriteProduct(productID, userID);
    }
}
