package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Common.Enum.ProductFilter;
import com.example.ecommerce.DAO.interf.IProductDAO;
import com.example.ecommerce.Database.JDBIConnect;
import com.example.ecommerce.Dto.ProductDto;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;

import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ProductDao extends ImplementBase implements IProductDAO {
    List<Product> productList = new ArrayList<>();

    public ProductDao() {
        super();
    }

    @Override
    public int recordSize() {
        return 0;
    }

    public Jdbi getJdbi(){
        return db.jdbi;
    }

    @Override
    public Product addNewProduct(int id, String name, int price, String description, String thumb, LocalDateTime create_at, int cateID, int attributeID) {
        return db.getJdbi().withHandle(handle ->
                handle.createUpdate("INSERT INTO products (id, name, price, description, thumb, create_at, cateID, attributeID) " +
                                "VALUES (:id, :name, :price, :description, :thumb, :create_at, :cateID, :attributeID)")
                        .bind("id", id)
                        .bind("name", name)
                        .bind("price", price)
                        .bind("description", description)
                        .bind("thumb", thumb)
                        .bind("create_at", create_at)
                        .bind("cateID", cateID)
                        .bind("attributeID", attributeID)
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(Product.class).findOne().orElse(null));

    }

    @Override
    public Product getProductById(int id) {
        db = JDBIConnect.getInstance();
        return db.jdbi.withHandle(handle -> handle.createQuery("select * from products where id = :id")
                .bind("id", id)
                .mapToBean(Product.class).findOne().orElse(null));
    }

    @Override
    public List<Product> getAllProducts() {
        db = JDBIConnect.getInstance();
        return db.jdbi.withHandle(handle -> handle.createQuery("select * from products")
                .mapToBean(Product.class).list());
    }

    @Override
    public List<Product> get20ProductEach(int index) {
        return null;
    }

    @Override
    public List<Product> getProductByCategory(int cateID) {
        db = JDBIConnect.getInstance();
        return db.jdbi.withHandle(handle -> handle.createQuery("select * from products where cateID = :cateID")
                .bind("cateID", cateID)
                .mapToBean(Product.class).list());
    }

    @Override
    public List<Product> search(String name) {
        return handle.createQuery("SELECT p.id, p .proName, p.description, p.price, p.thumb FROM products AS p JOIN product_atribute AS pa ON p.atributeID = pa.id WHERE pa.material LIKE :name")
                .bind("name",  "%" + name + "%")
                .mapToBean(Product.class).list();
    }

    @Override
    public List<Product> get4NewProducts() {
        db = JDBIConnect.getInstance();
        return db.getJdbi().withHandle(handle ->
                handle.createQuery("select * from products limit 4")
                        .mapToBean(Product.class).list());
    }

    @Override
    public List<Product> getProductByFilter(ProductFilter filter) {
        return null;
    }

    public static void main(String[] args) {
        ProductDao dao = new ProductDao();
//        var a = dao.search("kim loại");
        var a = dao.getAllProducts();
        a.forEach(System.out::println);
        System.out.println(a.get(0).getPrice());
    }

}
