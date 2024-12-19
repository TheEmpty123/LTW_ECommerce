package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Common.Enum.ProductFilter;

import java.util.*;

public interface IProductDAO {
    // Total records size in database
    int recordSize();

    // Get product by id
    Product getProductById(int id);

    // Get all product
    List<Product> getAllProducts();

    // Get 20 product for each page
    List<Product> get20ProductEach(int index);

    // Get product by category
    List<Product> getProductByCategory(int cateId);

    // Get product using Search
    List<Product> Search(String txt);

    // get about 8 new products
    List<Product> get8NewProducts();

    //    Filter
//    Sắp xếp theo điều kiện filter (option: tên, giá, ngày nhập khẩu, filter:asc,desc)
    List<Product> getProductByFilter(ProductFilter filter);

//   Admin page section

}
