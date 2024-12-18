package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.DateTime;
import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.DAO.interf.IPromotionDao;

import java.util.ArrayList;
import java.util.List;

public class PromotionDao implements IPromotionDao {
    List<Promotion> promotionList = new ArrayList<>();
    @Override
    public List<Promotion> getAll() {
        return List.of();
    }

    @Override
    public Promotion getById(int id) {
        return null;
    }

    @Override
    public boolean add(Promotion promotion) {
        return false;
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
    public boolean updateStartDate(DateTime newStartDate) {
        return false;
    }

    @Override
    public boolean updateEndDate(DateTime newEndDate) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }
}
