package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Common.Enum.ShippingStatus;
import com.example.ecommerce.Common.Enum.Statuss;
import com.example.ecommerce.DAO.iml.OrderDao;
import com.example.ecommerce.DAO.interf.IOrderDto;
import com.example.ecommerce.Dto.OrderDto;
import com.example.ecommerce.Dto.ProductDto;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

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
        orderDao.getJdbi().installPlugin(new SqlObjectPlugin());
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

    public List<Order> getAllOrder(boolean forceUpdate) {
        log.info("User Service getAllOrder...");
        return orderDao.getAllOrders(forceUpdate);
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

    public int getTotalShippedOrder(boolean forceUpdate) {
        log.info("UserService getTotalShippedOrder...");
        return orderDao.getTotalOrderWithStatus(forceUpdate, ShippingStatus.Completed);
    }

    public int getTotalOnProgressOrder(boolean forceUpdate) {
        log.info("UserService getTotalDeliveringOrder...");
        return orderDao.getTotalOrderWithStatus(forceUpdate, ShippingStatus.Delivering) + orderDao.getTotalOrderWithStatus(forceUpdate, ShippingStatus.Packaging);
    }

    public int getTotalCancelledOrder(boolean forceUpdate) {
        log.info("UserService getTotalCancelledOrder...");
        return orderDao.getTotalOrderWithStatus(forceUpdate, ShippingStatus.Cancelled);
    }

    public int getTotalPendingOrder(boolean forceUpdate) {
        return orderDao.getTotalOrdersWithPaymentStatus(forceUpdate, Statuss.PENDING);
    }

    public int getTotalRefundedOrder(boolean forceUpdate) {
        return orderDao.getTotalOrdersWithPaymentStatus(forceUpdate, Statuss.CANCELLED);
    }

    public List<OrderDto> getAllOrderDto(){
        var j = orderDao.getJdbi();
        var li = j.withExtension(IOrderDto.class, IOrderDto::getAllOrders);
        return li;
    }

    public static void main(String[] args) {
        var a = OrderService.getInstance();
        a.init();
        var b = a.getAllOrderDto();
        b.forEach(System.out::println);
    }
}
