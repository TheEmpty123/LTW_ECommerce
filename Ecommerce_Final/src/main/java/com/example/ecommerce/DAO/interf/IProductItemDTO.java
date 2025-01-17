package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Dto.OrderItemDto;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;

import java.util.List;

@RegisterBeanMapper(OrderItemDto.class)
public interface IProductItemDTO {

    @SqlQuery("""
        SELECT 
            p.proName AS productName, 
            oi.amount AS amount, 
            p.price AS price
        FROM 
            order_item AS oi
        JOIN 
            products AS p ON oi.productID = p.ID
        WHERE 
            oi.orderID = :id
    """)
    List<OrderItemDto> getOrderItemsFromOrder(@Bind("id") int id);

}
