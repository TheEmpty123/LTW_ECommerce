package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Category;
import com.example.ecommerce.DAO.interf.ICategoryDao;

import java.util.ArrayList;
import java.util.List;

public class CategoryDao implements ICategoryDao {
    List<Category> categories = new ArrayList<>();
    @Override
    public List<Category> getAllCategory() {
        return List.of();
    }

    @Override
    public Category getCategoryById(int id) {
        return null;
    }

    @Override
    public boolean addCategory(Category category) {
        return false;
    }

    @Override
    public boolean updateName(int id, String newName) {
        return false;
    }

    @Override
    public boolean deleteCategory(int id) {
        return false;
    }
}
