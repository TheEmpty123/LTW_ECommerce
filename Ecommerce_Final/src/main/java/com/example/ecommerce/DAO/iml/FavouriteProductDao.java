package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.FavouriteProduct;
import com.example.ecommerce.DAO.interf.IFavouriteProductDao;

import java.util.ArrayList;
import java.util.List;

public class FavouriteProductDao extends ImplementBase implements IFavouriteProductDao {
    List<FavouriteProduct> favouriteProductList;
    public static FavouriteProductDao instance;

    public FavouriteProductDao(){
        super();
        favouriteProductList = getAll();

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
    public List<FavouriteProduct> getAll() {
        return db.jdbi.withHandle(handle ->
                handle.createQuery("select * from favourite_products")
                        .mapToBean(FavouriteProduct.class)
                        .list());
    }

    @Override
    public List<FavouriteProduct> getByUserId(int id) {
        List<FavouriteProduct> rs = new ArrayList<>();
        for (FavouriteProduct favouriteProduct : favouriteProductList) {
            if (favouriteProduct.getUserID() == id) rs.add(favouriteProduct);
        }
        return rs;
    }

    @Override
    public boolean addFavouriteProduct(int productId, int userId) {
        return false;
    }

    @Override
    public boolean deleteFavouriteProduct(int productId, int userId) {
        return false;
    }
}
