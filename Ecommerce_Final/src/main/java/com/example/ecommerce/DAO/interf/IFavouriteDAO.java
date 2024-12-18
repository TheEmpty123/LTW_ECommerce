package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Favourite;

import java.util.List;

public interface IFavouriteDAO {
    public Favourite getFavouriteProduct(int pID);

    public List<Favourite> getAllFavourite();

    public Favourite addFavouriteProduct(Favourite favourite);

    public boolean deleteFavouriteProduct(int pID);

}
