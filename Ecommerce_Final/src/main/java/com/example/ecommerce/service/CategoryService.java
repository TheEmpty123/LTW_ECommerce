package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Category;
import com.example.ecommerce.DAO.iml.CategoryDao;
import com.example.ecommerce.DAO.iml.ProductAttributeDao;
import com.example.ecommerce.DAO.interf.ICategoryDTO;
import com.example.ecommerce.Dto.CategoryDto;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import java.util.List;

public class CategoryService extends ServiceBase{
    private static CategoryService instance;
    CategoryDao categoryDao = new CategoryDao();

    @Override
    public void init() {
        log.info("CategoryService init...");
    }

    public CategoryService(){
        instance = this;
    }
    public static CategoryService getInstance() {
        if (instance == null) {
            instance = new CategoryService();
            instance.categoryDao = new CategoryDao();
        }
        return instance;
    }
    public List<Category> getAllCategory(){
        return categoryDao.getAllCategory();
    }
    public Category getCategoryById(int id){
        return categoryDao.getCategoryById(id);
    }
    public boolean addCategory(int id, String cateName){
        return categoryDao.addCategory(id, cateName);
    }
    public boolean updateName(int id, String newName){
        return categoryDao.updateName(id, newName);
    }
    public boolean deleteCategory(int id){
        return categoryDao.deleteCategory(id);
    }

    public List<CategoryDto> getAllCategoryDto(){
        var j = categoryDao.getJdbi();
        j.installPlugin(new SqlObjectPlugin());
        var li = j.withExtension(ICategoryDTO.class, ICategoryDTO::getCategories);
        return li;
    }

    public static void main(String[] args) {
        var a = new CategoryService();
        a.init();
        var b = a.getAllCategoryDto();
        b.forEach(System.out::println);
    }
}
