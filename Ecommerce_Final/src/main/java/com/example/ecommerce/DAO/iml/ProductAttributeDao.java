package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.ProductAttribute;
import com.example.ecommerce.DAO.interf.IProductAttributeDao;

import java.util.ArrayList;
import java.util.List;

public class ProductAttributeDao implements IProductAttributeDao {
    List<ProductAttribute> productAttributeList = new ArrayList<>();
    @Override
    public List<ProductAttribute> getAll() {
        return List.of();
    }

    @Override
    public ProductAttribute getById(int id) {
        return null;
    }

    @Override
    public boolean addAttribute(ProductAttribute attribute) {
        return false;
    }

    @Override
    public boolean updateMaterial(int id, String newMaterial) {
        return false;
    }

    @Override
    public boolean updateSize(int id, String newSize) {
        return false;
    }

    @Override
    public boolean deleteAttributeById(int id) {
        return false;
    }
}
