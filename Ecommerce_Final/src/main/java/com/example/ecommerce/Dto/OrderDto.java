package com.example.ecommerce.Dto;

import com.example.ecommerce.Common.Enum.ShippingStatus;

import java.sql.Timestamp;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.Formatter;
import java.util.Locale;

public class OrderDto {
    private int id;
    private String customer;
    private double total;
    private String totalF;
    private ShippingStatus status;
    private LocalDateTime createDate;
    private Timestamp timestamp;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
        NumberFormat formatter = NumberFormat.getInstance(Locale.ENGLISH);
        this.totalF = formatter.format(total);
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getTotalF() {
        return totalF;
    }

    public void setTotalF(String totalF) {
        this.totalF = totalF;
    }

    public ShippingStatus getStatus() {
        return status;
    }

    public void setStatus(ShippingStatus status) {
        this.status = status;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
        this.timestamp = Timestamp.valueOf(createDate);
    }

    @Override
    public String toString() {
        return "OrderDto{" +
               "id=" + id +
               ", customer='" + customer + '\'' +
               ", total=" + total +
               ", totalF='" + totalF + '\'' +
               ", status=" + status +
               ", createDate=" + createDate +
               ", timestamp=" + timestamp +
               '}';
    }
}
