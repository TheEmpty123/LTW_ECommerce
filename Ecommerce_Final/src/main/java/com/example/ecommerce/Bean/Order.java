package com.example.ecommerce.Bean;

import com.example.ecommerce.Common.Enum.ShippingStatus;
import com.example.ecommerce.DAO.interf.IOrderDao;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Order implements Serializable {
    private int id;
    private int userID;
    private int paymentID;
    private ShippingStatus shippingStatus;
    private LocalDateTime createDate;
    private String promotion_id;
    private int sdt;

    public Order() {
    }


    public Order(int id, int userID, int paymentID, ShippingStatus shippingStatus, LocalDateTime createDate, String promotion_id, int sdt) {
        this.id = id;
        this.userID = userID;
        this.paymentID = paymentID;
        this.shippingStatus = shippingStatus;
        this.createDate = createDate;
        this.promotion_id = promotion_id;
        this.sdt = sdt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public ShippingStatus getShippingStatus() {
        return shippingStatus;
    }

    public void setShippingStatus(ShippingStatus shippingStatus) {
        this.shippingStatus = shippingStatus;
    }


    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public String getPromotion_id() {
        return promotion_id;
    }

    public void setPromotion_id(String promotion_id) {
        this.promotion_id = promotion_id;
    }

    public int getSdt() {
        return sdt;
    }

    public void setSdt(int sdt) {
        this.sdt = sdt;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", userID=" + userID +
                ", paymentID=" + paymentID +
                ", shippingStatus=" + shippingStatus +
                ", createDate=" + createDate +
                ", promotion_id='" + promotion_id + '\'' +
                ", sdt=" + sdt +
                '}';
    }
}
