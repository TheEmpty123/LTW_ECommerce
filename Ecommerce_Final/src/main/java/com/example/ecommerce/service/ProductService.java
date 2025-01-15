package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.DAO.iml.ProductDao;
import com.example.ecommerce.DAO.interf.IProductDTO;
import com.example.ecommerce.Dto.ProductDto;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;
import org.json.JSONObject;

import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.*;

public class ProductService extends ServiceBase {
    private static ProductService instance;
    static Map<String, String> data = new HashMap<>();
    private ProductDao productDao = new ProductDao();

    public ProductService() {
        super();
        instance = this;
    }

    @Override
    public void init() {
        log.info("ProductService init...");
        productDao = new ProductDao();
        try {
            var j = productDao.getJdbi();
            j.installPlugin(new SqlObjectPlugin());
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
            instance.productDao = new ProductDao();
        }
        return instance;
    }

    public void addNewProduct(int id, String name, int price, String description, String thumb, LocalDateTime create_at, int cateID, int attributeID) {
        productDao.addNewProduct(id, name, price, description, thumb, create_at, cateID, attributeID);
    }

    public Product getProductById(int id) {
        return productDao.getProductById(id);
    }

    public List<Product> getProductByCategory(int cateID) {
        return productDao.getProductByCategory(cateID);
    }

    public List<Product> getNew4Products() {
        return productDao.get4NewProducts();
    }

    public List<Product> getSearch(String name) {
        return productDao.search(name);
    }

    public List<ProductDto> getAllProductsDto() {
        return productDao.getJdbi().withExtension(IProductDTO.class, IProductDTO::getAllProducts);
    }

    public List<JSONObject> convertToJson(List<ProductDto> products) {
        List<JSONObject> li = new ArrayList<>();

        NumberFormat formater = NumberFormat.getInstance(Locale.ENGLISH);


        products.forEach(p -> {
            JSONObject j = new JSONObject();
            JSONObject product = new JSONObject();
            product.put("id", p.getId());
            product.put("name", p.getName());
            var fullPrice = formater.format(p.getPrice());
            product.put("price", fullPrice);
            product.put("thumb", p.getThumb());
            product.put("stock", p.getStock());
            product.put("category", p.getCategory());
            product.put("averageRating", p.getAverageRating());
            product.put("totalReviews", p.getTotalReviews());
            li.add(product);
        });

        return li;
    }

    public static void main(String[] args) {
        var a = new ProductService();
        a.init();

        var b = a.getAllProductsDto();
        var c = a.convertToJson(b);

        c.forEach(System.out::println);
    }
}

