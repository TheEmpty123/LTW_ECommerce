package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.Payment;
import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.Common.Enum.ShippingStatus;

import java.time.LocalDateTime;

public interface IOrderDao {
    public Order addOrder(Order order);

    public Order updateOrder(Order order);

    public Order deleteOrder(int id);

//    public ShippingStatus getShippingStatus(int id);

    public Promotion addPromotion(int id);

    public Payment getMethodPayment(int id);

}
