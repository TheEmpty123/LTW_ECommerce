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
        }
        return instance;
    }
    public List<FavouriteProduct> getAllFavouriteProducts() {
        return favouriteProductDao.getAll();
    }
    public List<FavouriteProduct> getFavouriteProductByUserId(int id){
        return favouriteProductDao.getByUserId(id);
    }
}
