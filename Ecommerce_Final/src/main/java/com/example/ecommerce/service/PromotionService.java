package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.DAO.iml.ProductDao;
import com.example.ecommerce.DAO.iml.PromotionDao;

import java.util.List;

public class PromotionService extends ServiceBase{
    private static PromotionService instance;
    private PromotionDao promotionDao = new PromotionDao();
    @Override
    public void init() {
        log.info("PromotionService init...");
    }
    public static PromotionService getInstance() {
        if (instance == null) {
            instance = new PromotionService();
            instance.promotionDao = new PromotionDao();
        }
        return instance;
    }
    public List<Promotion> getAllPromotion() {
        return promotionDao.getList();
    }
    public Promotion getPromotionById(int id) {
        return promotionDao.getById(id);
    }
    public Promotion getPromotionByCode(String  code) {
        return promotionDao.getByCode(code);
    }

}
