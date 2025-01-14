package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.DAO.interf.IOrderItemDao;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
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
                handle.createQuery("SELECT \n" +
                                "    order_item.id AS order_item_id,\n" +
                                "    order_item.orderID AS order_item_orderID,\n" +
                                "    order_item.productID AS order_item_productID,\n" +
                                "    order_item.amount AS order_item_amount,\n" +
                                "    products.id AS product_id,\n" +
                                "    products.proName AS product_proName,\n" +
                                "    products.description AS product_description,\n" +
                                "    products.price AS product_price,\n" +
                                "    products.thumb AS product_thumb,\n" +
                                "    products.created_at AS product_created_at,\n" +
                                "    products.atributeID AS product_atributeID,\n" +
                                "    products.cateID AS product_cateID\n" +
                                "FROM \n" +
                                "    order_item\n" +
                                "JOIN \n" +
                                "    products \n" +
                                "ON \n" +
                                "    order_item.productID = products.id\n")
                        .reduceRows(new LinkedHashMap<Integer, OrderItem>(), (map, rowView) -> {
                            int orderId = rowView.getColumn("order_item_id", Integer.class);
                            OrderItem orderItem = map.computeIfAbsent(orderId, id -> {
                                OrderItem item = new OrderItem();
                                item.setId(rowView.getColumn("order_item_id", Integer.class));
                                item.setOrderID(rowView.getColumn("order_item_orderID", Integer.class));
                                item.setProductID(rowView.getColumn("order_item_productID", Integer.class));
                                item.setAmount(rowView.getColumn("order_item_amount", Integer.class));

                                Product product = new Product();
                                product.setId(rowView.getColumn("product_id", Integer.class));
                                product.setProName(rowView.getColumn("product_proName", String.class));
                                product.setDescription(rowView.getColumn("product_description", String.class));
                                product.setPrice(rowView.getColumn("product_price", Double.class));
                                product.setThumb(rowView.getColumn("product_thumb", String.class));
                                product.setCreated_at(rowView.getColumn("product_created_at", LocalDateTime.class));
                                product.setAtributeID(rowView.getColumn("product_atributeID", Integer.class));
                                product.setCateID(rowView.getColumn("product_cateID", Integer.class));

                                item.setProduct(product);
                                return item;
                            });

                            return map;
                        })
                        .values()
                        .stream()
                        .toList());
    }


    public static void main(String[] args) {
        OrderItemDao dao = new OrderItemDao();
        dao.log.info("test");
        System.out.println(dao.getOrderItem());
    }

}
