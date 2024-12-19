package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.Bean.Payment;
import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.Common.Enum.ShippingStatus;

import java.time.LocalDateTime;

public interface IOrderDao {
    public Order addOrder(OrderItem orderItem);

    public Order updateOrder(OrderItem orderItem);

    public boolean deleteOrder(int id);

    //    public ShippingStatus getShippingStatus(int id);
    public Order getOrderById(int id);

    public Promotion addPromotion(int id);

    public Payment getMethodPayment(int id);

}
