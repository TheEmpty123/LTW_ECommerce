package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.DAO.iml.ProductDao;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService extends ServiceBase {
    private static ProductService instance;
    static Map<String, String> data = new HashMap<>();
    private ProductDao productDao;

    public ProductService() {
        super();
        instance = this;
    }

    @Override
    public void init() {
        productDao = new ProductDao();
    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
        return instance;
    }

    public void addNewProduct(int id, String name, int price, String description, String thumb, LocalDateTime create_at, int cateID, int attributeID) {
        productDao.addNewProduct(id, name, price, description, thumb, create_at, cateID, attributeID);
    }

    public Product getProductById(int id) {
        return productDao.getProductById(id);
    }

    public List<Product> getNew4Products() {
        return productDao.get4NewProducts();
    }
//    public void
}

