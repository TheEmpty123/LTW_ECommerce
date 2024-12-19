package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.DAO.interf.IOrderItemDao;

public class OrderItemDao extends ImplementBase implements IOrderItemDao {
    @Override
    public int recordSize() {
        return 0;
    }

    @Override
    public int countAmount(Order order) {
        return 0;
    }

}
