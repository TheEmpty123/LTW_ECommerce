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
    Map<Integer, Product> getAllProducts();

    // Get 4 product for index/home pages
    Map<Integer, Product> get4Product();

    // Get recent product
    Map<Integer, Product> getRecentProduct();

    // Get product description
    Product getProductDescription(int productId);

    // Get 20 product for each page
    Map<Integer, Product> get20ProductEach(int index);

    // Get product by category
    Map<Integer, Product> getProductByCategory(int cateId);

    // Get product using Search
    Map<Integer, Product> Search(String txt);

    //    Filter
//    Sắp xếp theo điều kiện filter (option: tên, giá, ngày nhập khẩu, filter:asc,desc)
    Map<Integer, Product> getProductByFilter(ProductFilter filter);

//   Admin page section

}
