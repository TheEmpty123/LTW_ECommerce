package com.example.ecommerce.service;

import com.example.ecommerce.Bean.ProductAttribute;
import com.example.ecommerce.DAO.iml.ProductAttributeDao;

import java.util.List;

public class ProductAttributeService extends ServiceBase {
    private static ProductAttributeService instance;
    ProductAttributeDao productAttributeDao = new ProductAttributeDao();

    public ProductAttributeService() {
        super();
        instance = this;
    }

    @Override
    public void init() {
        log.info("ProductDetailServ init... ");
        productAttributeDao = new ProductAttributeDao();
    }

    public static ProductAttributeService getInstance() {
        if (instance == null) {
            instance = new ProductAttributeService();
            instance.productAttributeDao = new ProductAttributeDao();
        }
        return instance;
    }

    public List<ProductAttribute> getAllProductAttribute() {
        return productAttributeDao.getAll();
    }

    public ProductAttribute getProductAttributeById(int id) {
        return productAttributeDao.getById(id);
    }
}
