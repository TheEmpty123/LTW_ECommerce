package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.DAO.iml.OrderDao;

import java.util.ArrayList;
import java.util.List;

public class OrderService extends ServiceBase{

    OrderDao orderDao;

    private static OrderService instance;

    public static OrderService getInstance(){
        if(instance == null){
            instance = new OrderService();
        }
        return instance;
    }

    @Override
    public void init() {
        log.info("UserService init...");
        if (orderDao == null) {
            orderDao = new OrderDao();
        }
    }

    OrderService(){
        super();
    }

    public List<Order> get5RecentOrders(){
        return orderDao.get5Order();
    }

}
