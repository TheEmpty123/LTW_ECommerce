package com.example.ecommerce.DAO;

import com.example.ecommerce.Bean.DateTime;
import com.example.ecommerce.Bean.Promotion;

import java.util.List;

public interface IPromotionDao {
    // Lay ra tat ca cac promotion
    List<Promotion> getAll();
    //lay promotion theo id
    Promotion getById(int id);
    //Them mot promotion moi
    boolean add(Promotion promotion);
    // cap nhat gioi han su dung cua promotion
    boolean updateLimit(int newLimit);
    //Cap nhat gia tri cua promotion
    boolean updateValue(double newValue);
    //Cap nhat trang thai cua promotion
    boolean updateStatus(String newStatus);
    //Cap nhat ngay bat dau cua promotion
    boolean updateStartDate(DateTime newStartDate);
    //Cap nhat ngay ket thuc cua promotion
    boolean updateEndDate(DateTime newEndDate);
    //xoa promotion theo id
    boolean delete(int id);
}
