package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Dto.OrderDto;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
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
}
