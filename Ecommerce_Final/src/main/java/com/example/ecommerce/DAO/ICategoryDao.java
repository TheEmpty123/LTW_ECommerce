package com.example.ecommerce.DAO;

import com.example.ecommerce.Bean.Category;

import java.util.List;

public interface ICategoryDao {
    //lấy tất cả các category
    List<Category> getAllCategory();
    //Lấy category theo id
    Category getCategoryById(int id);
    //Thêm một category mới
    boolean addCategory(Category category);
    //cập nhật ten cua catagory theo id
    boolean updateName(int id, String newName);
    //Xóa một category
    boolean deleteCategory(int id);


}
