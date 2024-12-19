package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.ProductAttribute;
import com.example.ecommerce.DAO.interf.IProductAttributeDao;

import java.util.ArrayList;
import java.util.List;

public class ProductAttributeDao extends ImplementBase implements IProductAttributeDao {
    List<ProductAttribute> productAttributeList = new ArrayList<>();

    public ProductAttributeDao() {
        super();
    }

    @Override
    public List<ProductAttribute> getAll() {
        return List.of();
    }

    @Override
    public ProductAttribute getById(int id) {
        return null;
    }

    @Override
    public ProductAttribute addAttribute(ProductAttribute attribute) {
        return null;
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
