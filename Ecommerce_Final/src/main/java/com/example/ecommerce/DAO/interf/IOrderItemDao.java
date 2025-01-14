package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;

import java.util.List;

public interface IOrderItemDao {
    int recordSize();

    OrderItem addOrderItem(int orderID, int productID);

    int countAmount(Order order);

    List<OrderItem> getOrderItem(int id);

}
