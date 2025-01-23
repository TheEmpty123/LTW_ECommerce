package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.Common.Enum.DiscountType;
import com.example.ecommerce.DAO.iml.PromotionDao;

import java.time.LocalDateTime;
import java.util.List;

public class PromotionService extends ServiceBase {
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

    public List<Promotion> getAllPromotion(boolean force) {
        log.info("PromotionService getAllPromotion...");
        return promotionDao.getAll(force);
    }

    public Promotion getPromotionById(int id) {
        return promotionDao.getById(id);
    }

    public Promotion getPromotionByCode(String code) {
        return promotionDao.getByCode(code);
    }

    public boolean createPromotion(Promotion promotion) {
        log.info("PromotionService createPromotion...");

        if (promotion.getType() == DiscountType.PERCENTAGE && promotion.getValueOfPro() > 100)
            return false;
        if (promotion.getEndDate().isBefore(LocalDateTime.now()))
            return false;

        int c = 0;

        try {
            c = promotionDao.add(promotion);
        }
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return c > 0;
    }
}
