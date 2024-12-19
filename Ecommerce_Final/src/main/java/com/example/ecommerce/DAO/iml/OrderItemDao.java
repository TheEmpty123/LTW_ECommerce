package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.DAO.interf.IOrderItemDao;
import com.example.ecommerce.Database.JDBIConnect;

public class OrderItemDao extends ImplementBase implements IOrderItemDao {
    JDBIConnect db;

    public OrderItemDao(JDBIConnect db) {
        this.db = db;
    }

    public OrderItemDao() {
    }

    @Override
    public int recordSize() {
        return 0;
    }

    @Override
    public int countAmount(Order order) {
        return db.getJdbi().withHandle(handle -> handle.createQuery("select count(*) from orderItem"))
                .mapToBean(Integer.class).one();
    }

    public static void main(String[] args) {
        OrderItemDao dao = new OrderItemDao();
        dao.log.info("test");
    }

}
