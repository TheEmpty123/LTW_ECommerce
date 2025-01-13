package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.DAO.interf.IOrderItemDao;

import java.util.List;

public class OrderItemDao extends ImplementBase implements IOrderItemDao {
//    JDBIConnect db;
//
//    public OrderItemDao(JDBIConnect db) {
//        this.db = db;
//    }

    public OrderItemDao() {
    }

    @Override
    public int recordSize() {
        return 0;
    }

    @Override
    public int countAmount(Order order) {
        return db.getJdbi().withHandle(handle -> handle.createQuery("select sum(*) from orderItem"))
                .mapTo(Integer.class).one();
    }

    @Override
    public List<OrderItem> getOrderItem() {
        return db.getJdbi().withHandle(handle ->
                handle.createQuery("SELECT order_item.id AS order_item_id, order_item.orderID, order_item.productID AS order_item_productID, " +
                                "order_item.amount, products.proName, products.price, products.thumb " +
                                "FROM order_item " +
                                "JOIN products ON order_item.productID = products.id")
                        .map((rs, ctx) -> {
                            OrderItem orderItem = new OrderItem();
                            orderItem.setId(rs.getInt("order_item_id"));
                            orderItem.setOrderID(rs.getInt("orderID"));
                            orderItem.setProductID(rs.getInt("order_item_productID"));
                            orderItem.setAmount(rs.getInt("amount"));
                            // Gán các thuộc tính từ bảng `products` vào OrderItem
                            orderItem.setProName(rs.getString("proName"));
                            orderItem.setPrice(rs.getDouble("price"));
                            orderItem.setThumb(rs.getString("thumb"));
                            return orderItem;
                        })
                        .list());
    }



    public static void main(String[] args) {
        OrderItemDao dao = new OrderItemDao();
        dao.log.info("test");
        System.out.println(dao.getOrderItem());
    }

}
