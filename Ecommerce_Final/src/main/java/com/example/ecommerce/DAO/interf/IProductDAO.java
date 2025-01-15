package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Common.Enum.ProductFilter;

import java.time.LocalDateTime;
import java.util.*;

public interface IProductDAO {
    // Total records size in database
    int recordSize();

    public Product addNewProduct(int id, String name, int price, String description, String thumb, LocalDateTime create_at, int cateID, int attributeID);

    // Get product by id
    Product getProductById(int id);

    // Get all product
    List<Product> getAllProducts();

    // Get 20 product for each page
    List<Product> get20ProductEach(int index);

    // Get product by category
    List<Product> getProductByCategory(int cateId);

    // Get product using Search
    List<Product> search(String name);

    // get about 8 new products
    List<Product> get4NewProducts();

    //    Filter
//    Sắp xếp theo điều kiện filter (option: tên, giá, ngày nhập khẩu, filter:asc,desc)
    List<Product> getProductByFilter(ProductFilter filter);
    List<Product> getProductByFilter(String sort, String material);
}
