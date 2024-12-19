package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.Bean.Payment;
import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.DAO.interf.IOrderDao;
import com.example.ecommerce.Database.JDBIConnect;

import java.util.ArrayList;
import java.util.List;

public class OrderDao extends ImplementBase implements IOrderDao {
    List<Order> orders;
    JDBIConnect db;

    public OrderDao(List<Order> orders, JDBIConnect db) {
        this.orders = new ArrayList<>();
        this.db = JDBIConnect.getInstance();
    }

    @Override
    public Order addOrder(OrderItem orderItem) {
        return db.getJdbi().withHandle(handle -> {
            handle.createQuery("insert into orderItem(id, orderID, productID, amount) values(null, ?, ?, ?)")
                    .bind("id", orderItem.getId())
                    .bind("orderID", orderItem.getOrderID())
                    .bind("productID", orderItem.getProductID())
                    .bind("amount", orderItem.getAmount())
                    .mapToBean(Order.class).one();
            orderItem.setId(orderItem.getId());
            return getOrderById(orderItem.getId());
        });
    }

    @Override
    public Order updateOrder(OrderItem orderItem) {
        return db.getJdbi().withHandle(handle -> {
            handle.createQuery("UPDATE orderItem SET id , orderID = ?, productID = ?, amount = ? WHERE id = ?\" ")
                    .bind("id", orderItem.getId())
                    .bind("orderID", orderItem.getOrderID())
                    .bind("productID", orderItem.getProductID())
                    .bind("amount", orderItem.getAmount())
                    .mapToBean(Order.class).one();
            orderItem.setId(orderItem.getId());
            return getOrderById(orderItem.getId());
        });
    }

    @Override
    public boolean deleteOrder(int id) {
        return db.getJdbi().withHandle(handle ->
                handle.createUpdate("DELETE FROM orderItem WHERE id = ?")
                        .bind(0, id)
                        .execute() > 0
        );
    }

    @Override
    public Order getOrderById(int id) {
        return db.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM orderItem WHERE id = ?")
                        .bind(0, id)
                        .mapToBean(Order.class).one()
        );
    }

    @Override
    public Promotion addPromotion(int id) {
        return null;
    }

    @Override
    public Payment getMethodPayment(int id) {
        return null;
    }
}
