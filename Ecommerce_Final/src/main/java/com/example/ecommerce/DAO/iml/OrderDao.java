package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.Bean.Payment;
import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.Common.Enum.ShippingStatus;
import com.example.ecommerce.DAO.interf.IOrderDao;
import com.example.ecommerce.Database.JDBIConnect;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class    OrderDao extends ImplementBase implements IOrderDao {

    List<Order> allOrders = new ArrayList<>();

    public OrderDao() {
        super();
    }

    public List<Order> getAllOrders() {
        if (allOrders.isEmpty()) {
            allOrders = handle
                    .createQuery("SELECT * FROM orders")
                    .mapToBean(Order.class)
                    .list();
        }
        return allOrders;
    }

    public List<Order> getAllOrders(boolean force) {
        log.info("Query all orders with force: " + force);

        if (!force) allOrders = getAllOrders();
        else
            allOrders = handle
                    .createQuery("SELECT * FROM orders")
                    .mapToBean(Order.class)
                    .list();
        return allOrders;
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
    public List<Order> get5Order(boolean force) {
        log.info("Query 5 recent order with force: " + force);
        var a = db.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders ORDER BY createDate DESC LIMIT ?;")
                        .bind(0, 5)
                        .mapToBean(Order.class).list());

        NumberFormat formatter = NumberFormat.getInstance(Locale.ENGLISH);

        for (Order order : a) {
            order.setTotal(handle
                    .createQuery("SELECT SUM(p.price * oi.amount) FROM orders AS o JOIN order_item AS oi ON o.id = oi.orderID JOIN products AS p ON p.id = oi.productID WHERE o.id = ?; ")
                    .bind(0, order.getId())
                    .mapTo(Double.class)
                    .first());
            order.setTotalS(formatter.format(order.getTotal()));
        }

        return a;
    }

    @Override
    public double getTotalRevenue(boolean force) {
        log.info("Query total revenue with force: " + force);

        Double totalRevenue = handle
                .createQuery("SELECT SUM(p.price * oi.amount) FROM orders AS o JOIN order_item AS oi ON o.id = oi.orderID JOIN products AS p ON p.id = oi.productID; ")
                .mapTo(Double.class)
                .first();

        return totalRevenue;
    }

    @Override
    public double getTotalProcessing(boolean force) {
        log.info("Query total processing order with force: " + force);

        Double totalProcessing = handle
                .createQuery("SELECT SUM(p.price * oi.amount) FROM orders AS o JOIN order_item AS oi ON o.id = oi.orderID JOIN products AS p ON p.id = oi.productID WHERE o.shippingStatus != 'completed' AND o.shippingStatus != 'cancelled';")
                .mapTo(Double.class)
                .first();

        return totalProcessing;
    }

    @Override
    public double getTotalShipped(boolean force) {
        log.info("Query total shipped order with force: " + force);

        Double totalShipped;
        totalShipped = handle
                .createQuery("SELECT SUM(p.price * oi.amount) FROM orders AS o JOIN order_item AS oi ON o.id = oi.orderID JOIN products AS p ON p.id = oi.productID WHERE o.shippingStatus = 'completed';")
                .mapTo(Double.class)
                .first();

        return totalShipped;
    }

    public static void main(String[] args) {
        OrderDao orderDao = new OrderDao();
        orderDao.log.info("test");
        System.out.println(orderDao.handle.createQuery("SELECT * FROM orders ORDER BY createDate DESC LIMIT ?;"));
    }
}
