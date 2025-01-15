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
        return List.of();
    }

    public List<Product> get4ProductOfCate(int cateID){
        return db.jdbi.withHandle(handle -> handle.createQuery("select * from products where cateID = :cateID limit 4")
                .bind("cateID", cateID)
                .mapToBean(Product.class).list());
    }


    @Override
    public List<Product> getProductByFilter(String sort, String material) {
        String query = "select p.id, p.proName,p.price,p.description, p.thumb,p.created_at,p.cateID,p.atributeID " +
                "from products p join product_atribute pa on p.atributeID = pa.id ";

        if("Tất cả".equals(material)){
            query += "where 1=1 or pa.material like ?";
        }else {
            query += "where pa.material like ? ";
        }
        // Thêm điều kiện sắp xếp
        if ("Thấp đến cao".equals(sort)) {
            query += "order by p.price asc;";
        } else if ("Cao đến thấp".equals(sort)) {
            query += "order by p.price desc;";
        } else if ("Mới nhất".equals(sort)) {
            query += "order by p.created_at desc;";
        } else {
            query += "order by p.id asc;"; // Sắp xếp mặc định
        }

        String finalQuery = query;
        return db.jdbi.withHandle(handle -> handle.createQuery(finalQuery)
                .bind(0, '%'+material+'%')
                .mapToBean(Product.class).list());
    }

//    public static void main(String[] args) {
//        ProductDao dao = new ProductDao();
//        System.out.println("running");
//        List<Product> list = dao.getProductByFilter("Thấp đến cao","Gỗ");
////        List<Product> list = dao.getAllProducts();
//        for(Product p : list) {
//            System.out.println(p);
//        }
//    }
}
