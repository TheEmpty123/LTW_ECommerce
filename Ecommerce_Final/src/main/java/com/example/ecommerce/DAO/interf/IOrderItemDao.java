package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Order;

public interface IOrderItemDao {
    int recordSize();
    public int countAmount(Order order);


}
