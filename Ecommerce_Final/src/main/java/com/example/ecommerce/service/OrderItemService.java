package com.example.ecommerce.service;

import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.DAO.iml.OrderDao;
import com.example.ecommerce.DAO.iml.OrderItemDao;

import java.util.List;

public class OrderItemService extends ServiceBase {
    private OrderItemDao dao = new OrderItemDao();
    private static OrderItemService instance;

    public static OrderItemService getInstance() {
        if (instance == null) {
            instance = new OrderItemService();
        }
        return instance;
    }

    @Override
    public void init() {
        log.info("UserService init...");
        if (dao == null) {
            dao = new OrderItemDao();
        }
    }

    public List<OrderItem> getOrderItem(int id) {
        log.info("getOrderItem...");
        return dao.getOrderItem(id);
    }

    public OrderItem addOrderItem(OrderItem orderItem) {
        log.info("addOrderItem...");
        return dao.addOrderItem(orderItem);
    }

    public void updateOrderItem(int id, int productID, int amount) {
        log.info("update orderitem...");
        this.dao.updateOrderItem(id, productID, amount);
    }

    public OrderItem findOrderItemByProductId(OrderItem orderItem) {
        log.info("find orderitem...");
        return this.dao.findByOrderAndProduct(orderItem);
    }

    public List<OrderItem> getAllOrderItemByOrderId(int orderId){
        log.info("get all orderitem by orderId...");
        var listOrderItem = this.dao.getAllOrderItemByOrderId(orderId);

        for(OrderItem orderItem : listOrderItem){
            orderItem.setProduct(ProductService.getInstance().getProductById(orderItem.getProductID()));
        }

        return listOrderItem;
    }
}
