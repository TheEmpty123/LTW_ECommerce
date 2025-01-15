package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.DAO.iml.OrderDao;

import java.util.ArrayList;
import java.util.List;

public class OrderService extends ServiceBase {

    OrderDao orderDao = new OrderDao();

    private static OrderService instance;

    public static OrderService getInstance() {
        if (instance == null) {
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

    public OrderService() {
        super();
    }

    // Get 5 recent orders
    // @param : forceUpdate -> force update query
    public List<Order> get5RecentOrders(boolean forceUpdate) {
        log.info("UserService get5RecentOrders...");
        return orderDao.get5Order(forceUpdate);
    }

    public Order addOrder(Order order) {
        log.info("User Service add Order");
        return orderDao.addOrder(order);
    }

    public List<Order> getAllOrder() {

        log.info("User Service getAllOrder...");
        return orderDao.getAllOrders();
    }


    // Get total revenue
    // @param : forceUpdate -> force update query
    public double getTotalRevenue(boolean forceUpdate) {
        log.info("UserService getTotalRevenue...");
        return orderDao.getTotalRevenue(forceUpdate);
    }

    // Get total processing money
    // @param : forceUpdate -> force update query
    public double getTotalProcessing(boolean forceUpdate) {
        log.info("UserService getTotalProcessing...");
        return orderDao.getTotalProcessing(forceUpdate);
    }

    // Get total shipped order's money
    // @param : forceUpdate -> force update query
    public double getTotalShipped(boolean forceUpdate) {
        log.info("UserService getTotalShipped...");
        return orderDao.getTotalShipped(forceUpdate);
    }

    public static void main(String[] args) {
        OrderService service = new OrderService();
        System.out.println(service.getAllOrder());

    }
}
