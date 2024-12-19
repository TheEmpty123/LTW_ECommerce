package com.example.ecommerce.Bean;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

public class Promotion implements Serializable {
    private int id;
    private String codes;
    private String type;
    private int limitPro;
    private double valueOfPro;
    private String statusOfPro;
    private LocalDateTime startDate;
    private LocalDateTime endDate;

    public Promotion(int id, String codes, String type, int limitePro, double valueOfPro, String status, LocalDateTime startDate, LocalDateTime endDate) {
        this.id = id;
        this.codes = codes;
        this.type = type;
        this.limitPro = limitePro;
        this.valueOfPro = valueOfPro;
        this.statusOfPro = status;
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

    public int getLimitPro() {
        return limitPro;
    }

    public double getValueOfPro() {
        return valueOfPro;
    }

    public String getStatus() {
        return statusOfPro;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public LocalDateTime getEndDate() {
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

    public void setLimitPro(int limitePro) {
        this.limitPro = limitePro;
    }

    public void setValueOfPro(double valueOfPro) {
        this.valueOfPro = valueOfPro;
    }

    public void setStatus(String status) {
        this.statusOfPro = status;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "Promotion {id =" + id +
                ", code = " + codes +
                ", type = " + type + ", " +
                "limit = " + limitPro +
                ", value = " + valueOfPro +
                ", status = " + statusOfPro +
                ", startDate = " + startDate +
                ", endDate = " + endDate +
                '}';
    }
}
