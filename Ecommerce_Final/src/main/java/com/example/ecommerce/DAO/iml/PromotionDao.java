package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.DAO.interf.IPromotionDao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PromotionDao extends ImplementBase implements IPromotionDao {
    List<Promotion> promotionList;

    public static PromotionDao instance;
    public PromotionDao() {
        super();
        promotionList = getAll();
    }

    public static PromotionDao getInstance() {
        if (instance == null) {
            instance = new PromotionDao();
        }
        return instance;
    }
    public List<Promotion> getList(){
        return promotionList;
    }

    @Override
    public List<Promotion> getAll() {
        return db.jdbi.withHandle(handle1 ->
                handle.createQuery("select * from promotions")
                        .mapToBean(Promotion.class).list());
    }

    @Override
    public Promotion getById(int id) {
        for (Promotion promotion : promotionList) {
            if (promotion.getId() == id) {
                return promotion;
            }
        }
        return null;
    }

    @Override
    public Promotion getByCode(String code) {
        for (Promotion promotion : promotionList) {
            if (promotion.getCodes().equals(code)) {
                return promotion;
            }
        }
        return null;
    }


    @Override
    public Promotion add(Promotion promotion) {
        return null;
    }

    @Override
    public boolean updateLimit(int newLimit) {
        return false;
    }

    @Override
    public boolean updateValue(double newValue) {
        return false;
    }

    @Override
    public boolean updateStatus(String newStatus) {
        return false;
    }

    @Override
    public boolean updateStartDate(LocalDateTime newStartDate) {
        return false;
    }

    @Override
    public boolean updateEndDate(LocalDateTime newEndDate) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}
