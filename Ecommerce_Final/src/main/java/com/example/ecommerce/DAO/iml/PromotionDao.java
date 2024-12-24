package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.DAO.interf.IPromotionDao;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class PromotionDao extends ImplementBase implements IPromotionDao {
    List<Promotion> promotionList = new ArrayList<>();

    public PromotionDao() {
        super();
    }

    @Override
    public List<Promotion> getAll() {
        return List.of();
    }

    @Override
    public Promotion getById(int id) {
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
