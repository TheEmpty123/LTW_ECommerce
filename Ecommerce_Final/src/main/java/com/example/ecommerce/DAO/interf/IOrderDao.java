package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.OrderItem;
import com.example.ecommerce.Bean.Payment;
import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.Common.Enum.ShippingStatus;

import java.time.LocalDateTime;

public interface IOrderDao {
    int recordSize();

    public Order addOrder(int id, int orderID, int productID, int amount);

    Order updateOrderByID(int id, int orderID, int productID, int amount);

    public boolean deleteOrder(int id);

    //    public ShippingStatus getShippingStatus(int id);
    public Order getOrderById(int id);

    public Promotion addPromotion(int id);

    public Payment getMethodPayment(int id);

}
