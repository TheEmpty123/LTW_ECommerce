package com.example.ecommerce.Bean;

import java.util.Date;

public class Promotion {
    private int id;
    private String codes;
    private String type;
    private int limitePro;
    private double valueOfPro;
    private String status;
    private DateTime startDate;
    private DateTime endDate;

    public Promotion(int id, String codes, String type, int limitePro, double valueOfPro, String status, DateTime startDate, DateTime endDate) {
        this.id = id;
        this.codes = codes;
        this.type = type;
        this.limitePro = limitePro;
        this.valueOfPro = valueOfPro;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public String getCodes() {
        return codes;
    }

    public String getType() {
        return type;
    }

    public int getLimitePro() {
        return limitePro;
    }

    public double getValueOfPro() {
        return valueOfPro;
    }

    public String getStatus() {
        return status;
    }

    public DateTime getStartDate() {
        return startDate;
    }

    public DateTime getEndDate() {
        return endDate;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCodes(String codes) {
        this.codes = codes;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setLimitePro(int limitePro) {
        this.limitePro = limitePro;
    }

    public void setValueOfPro(double valueOfPro) {
        this.valueOfPro = valueOfPro;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setStartDate(DateTime startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(DateTime endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "Promotion {id =" + id +
                ", code = " + codes +
                ", type = " + type + ", " +
                "limit = " + limitePro +
                ", value = " + valueOfPro +
                ", status = " + status +
                ", startDate = " + startDate +
                ", endDate = " + endDate +
                '}';
    }
}
