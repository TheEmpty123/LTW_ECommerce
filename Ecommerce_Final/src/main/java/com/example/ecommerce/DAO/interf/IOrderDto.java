package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Dto.OrderDto;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.List;

@RegisterBeanMapper(OrderDto.class)
public interface IOrderDto {

    @SqlQuery("""
                        SELECT o.id, u.username as customer, SUM(oi.amount * p.price) as total, o.shippingStatus as status, pa.statuss, o.createDate, pa.method
                FROM orders AS o
                JOIN payment AS pa ON o.paymentID = pa.id
                JOIN users AS u ON o.userID = u.ID
                JOIN order_item AS oi ON o.id = oi.orderID
                JOIN products AS p ON oi.productID = p.ID
                GROUP BY o.id
            """)
    List<OrderDto> getAllOrders();

    @SqlQuery("""
                SELECT 
                    o.id AS id, 
                    u.username AS customer, 
                    SUM(oi.amount * p.price) AS total, 
                    o.shippingStatus AS status, 
                    pa.statuss AS statuss, 
                    o.createDate AS createDate, 
                    pa.method AS paymentMethod
                FROM orders AS o
                JOIN payment AS pa ON o.paymentID = pa.id
                JOIN users AS u ON o.userID = u.ID
                JOIN order_item AS oi ON o.id = oi.orderID
                JOIN products AS p ON oi.productID = p.ID
                WHERE o.id = :id
                GROUP BY o.id, u.username, o.shippingStatus, pa.statuss, o.createDate, pa.method
            """)
    OrderDto getOrderById(@Bind("id") int id);

}
