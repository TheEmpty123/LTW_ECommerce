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

    public OrderDao() {
        super();
    }

    @Override
    public int recordSize() {
        return 0;
    }

    @Override
    public Order addOrder(int id, int orderID, int productID, int amount) {
        return db.getJdbi().withHandle(handle -> {
            handle.createUpdate("INSERT INTO orderItem (orderID, productID, amount) " +
                            "VALUES (:orderID, :productID, :amount)")
                    .bind("orderID", orderID)
                    .bind("productID", productID)
                    .bind("amount", amount)
                    .execute();
            return getOrderById(orderID);
        });
    }


    @Override
    public Order updateOrderByID(int id, int orderID, int productID, int amount) {
        return db.getJdbi().withHandle(handle ->
                handle.createUpdate("UPDATE orderItem SET orderID = :orderID, productID = :productID, amount = :amount  WHERE id = :id")
                        .bind("id", id)
                        .bind("orderID", orderID)
                        .bind("productID", orderID)
                        .bind("amount", amount)
                        .executeAndReturnGeneratedKeys("id")
                        .mapToBean(Order.class)
                        .findOne()
                        .orElseThrow(() -> new IllegalArgumentException("Order not found"))
        );
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
        PromotionDao promotionDao = new PromotionDao();
        return promotionDao.getById(id);
    }

    @Override
    public Payment getMethodPayment(int id) {
        return null;
    }


    // Admin
    // Get 5 recent orders
    @Override
    public List<Order> get5Order() {

        return  db.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders ORDER BY createDate DESC LIMIT ?;")
                        .bind(0, 5)
                        .mapToBean(Order.class).list());
    }

    public static void main(String[] args) {
        OrderDao orderDao = new OrderDao();
        orderDao.log.info("test");
        System.out.println(orderDao.handle.createQuery("SELECT * FROM orders ORDER BY createDate DESC LIMIT ?;" ));
    }
}
