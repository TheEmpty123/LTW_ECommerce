package com.example.ecommerce.DAO;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Common.Enum.ProductFilter;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductDao implements IProductDAO{
    List<Product> productList = new ArrayList<>();
    @Override
    public int recordSize() {
        return 0;
    }

    @Override
    public Product getProductById(int id) {
        return null;
    }

    @Override
    public Map<Integer, Product> getAllProducts() {
        return Map.of();
    }

    @Override
    public Map<Integer, Product> get4Product() {
        return Map.of();
    }

    @Override
    public Map<Integer, Product> getRecentProduct() {
        return Map.of();
    }

    @Override
    public Product getProductDescription(int productId) {
        return null;
    }

    @Override
    public Map<Integer, Product> get20ProductEach(int index) {
        return Map.of();
    }

    @Override
    public Map<Integer, Product> getProductByCategory(int cateId) {
        return Map.of();
    }

    @Override
    public Map<Integer, Product> Search(String txt) {
        return Map.of();
    }

    @Override
    public Map<Integer, Product> getProductByFilter(ProductFilter filter) {
        return Map.of();
    }
}
