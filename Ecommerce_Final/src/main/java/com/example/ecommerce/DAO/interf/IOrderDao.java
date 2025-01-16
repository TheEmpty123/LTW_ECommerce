package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.Payment;
import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.Common.Enum.ShippingStatus;
import com.example.ecommerce.Common.Enum.Statuss;

import java.util.List;

public interface IOrderDao {
    int recordSize();

    List<Order> getAllOrders(boolean force);

    public Order addOrder(Order order);

    Order updateOrderByID(int id, int orderID, int productID, int amount);

    public boolean deleteOrder(int id);

    //    public ShippingStatus getShippingStatus(int id);
    public Order getOrderById(int id);

    public Promotion addPromotion(int id);

    public Payment getMethodPayment(int id);

    public List<Order> get5Order(boolean force);

    public double getTotalRevenue(boolean force);

    public double getTotalProcessing(boolean force);

    public double getTotalShipped(boolean force);

    public int getTotalOrderWithStatus(boolean force, ShippingStatus status);

    public int getTotalOrdersWithPaymentStatus(boolean force, Statuss status);

    int updateOrder(int id, String phone, ShippingStatus status);
    int updatePayment(int id, Statuss statuss);
}
