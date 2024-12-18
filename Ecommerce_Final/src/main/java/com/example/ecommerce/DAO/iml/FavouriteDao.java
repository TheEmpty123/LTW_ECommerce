package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Favourite;
import com.example.ecommerce.DAO.interf.IFavouriteDAO;

import java.util.List;

public class FavouriteDao implements IFavouriteDAO {
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
