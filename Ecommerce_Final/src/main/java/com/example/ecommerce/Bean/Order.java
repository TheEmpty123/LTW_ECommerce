package com.example.ecommerce.Bean;

import com.example.ecommerce.Common.Enum.ShippingStatus;
import com.example.ecommerce.DAO.interf.IOrderDao;
import com.example.ecommerce.Utils.CipherUtils;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order implements Serializable {
    private int id;
    private int userID;
    private int paymentID;
    private ShippingStatus shippingStatus;
    private LocalDateTime createDate;
    private Timestamp timeStamp;
    private String promotion_id;
    private String sdt;
    private boolean sign;
    private String signature;
    private double total;
    private String totalS;
    private List<OrderItem> listOrderItem;
    
    public Order() {
    }

    public Order(int id, int userID, int paymentID, ShippingStatus shippingStatus, LocalDateTime createDate, String promotion_id, String sdt) {
        this.id = id;
        this.userID = userID;
        this.paymentID = 0;
        this.shippingStatus = ShippingStatus.Packaging;
        this.createDate = LocalDateTime.now();
        this.promotion_id = "";
        this.sdt = "";
    }

    public Order(int userID) {
        this.userID = userID;
        this.paymentID = paymentID;
        this.shippingStatus = shippingStatus;
        this.createDate = createDate;
        this.promotion_id = promotion_id;
        this.sdt = sdt;
        this.listOrderItem = new ArrayList<>();
    }

    public Timestamp getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(Timestamp timeStamp) {
        this.timeStamp = timeStamp;
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
        this.timeStamp = Timestamp.valueOf(createDate);
    }

    public boolean getSign() {
        return sign;
    }

    public void setSign(boolean sign) {
        this.sign = sign;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public List<OrderItem> getListOrderItem() {
        return listOrderItem;
    }

    public void setListOrderItem(List<OrderItem> listOrderItem) {
        this.listOrderItem = listOrderItem;
    }

    public String getPromotion_id() {
        return promotion_id;
    }

    public void setPromotion_id(String promotion_id) {
        this.promotion_id = promotion_id;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getTotalS() {
        return totalS;
    }

    public void setTotalS(String totalS) {
        this.totalS = totalS;
    }

    public void updateVerifyStatus(User user) {
        if (signature == null || signature.isEmpty() || user == null || user.getPublic_key() == null || user.getPublic_key().isEmpty()) {
            sign = false;
        } else {
            String publicKey = user.getPublic_key();
            String hash = hashOrder();
            String sign = this.signature;

            this.sign = CipherUtils.verify(hash, sign, publicKey);
        }
    }

    public String hashOrder(){
        StringBuilder sb = new StringBuilder();
        sb.append(id);
        sb.append(userID);
        sb.append(paymentID);
        sb.append(createDate);
        sb.append(promotion_id);
        sb.append(sdt);

        for(OrderItem item : listOrderItem) {
            sb.append(item.getProductID());
            sb.append(item.getAmount());
            var p = item.getProduct();
            sb.append(p.getProName());
            sb.append(p.getPrice());
            sb.append(p.getDescription());
        }

        String hash = "";

        try {
            hash = CipherUtils.hashText(sb.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return hash;
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
