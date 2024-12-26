package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Category;
import com.example.ecommerce.DAO.interf.ICategoryDao;
import com.example.ecommerce.Database.JDBIConnect;

import java.lang.ref.PhantomReference;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao extends ImplementBase implements ICategoryDao {
    List<Category> categories = new ArrayList<>();
    JDBIConnect conn = JDBIConnect.getInstance();

    public CategoryDao() {
        super();
    }

    @Override
    public List<Category> getAllCategory() {
        return conn.jdbi.withHandle(handle ->
                handle.createQuery("select * from category")
                    .mapToBean(Category.class).list());
    }

    @Override
    public Category getCategoryById(int id) {
        return conn.jdbi.withHandle(handle ->
                handle.createQuery("select * from category where id = :id")
                    .bind("id", id)
                    .mapToBean(Category.class).findOne().orElse(null));
    }

    @Override
    public boolean addCategory(int id, String cateName) {
        return conn.jdbi.withHandle(handle ->
                handle.createUpdate("insert into category(id, cateName) values (:id, :cateName)")
                    .bind("id", id)
                    .bind("cateName", cateName)
                    .execute() > 0);
    }

    @Override
    public boolean updateName(int id, String newName) {
        return conn.jdbi.withHandle(handle ->
                handle.createUpdate("update category set cateName = :newName where id = :id")
                    .bind("newName", newName)
                    .bind("id", id)
                    .execute() > 0);
    }

    @Override
    public boolean deleteCategory(int id) {
        return conn.jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM category WHERE id = :id")
                        .bind("id", id)
                        .execute() > 0
        );
    }


    public static void main(String[] args) {
        CategoryDao dao = new CategoryDao();
        dao.log.info("test");
    }
}
