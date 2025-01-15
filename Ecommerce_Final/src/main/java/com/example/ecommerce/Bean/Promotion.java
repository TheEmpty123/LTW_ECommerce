package com.example.ecommerce.Bean;

import java.io.Serializable;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Locale;

public class Promotion implements Serializable {
    private int id;
    private String codes;
    private String type;
    private int limitPro;
    private double valueOfPro;
    private String statusOfPro;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private String fullValueOfPro;

    public Promotion() {
    }

    public Promotion(int id, String codes, String type, int limitePro, double valueOfPro, String statusOfPro, LocalDateTime startDate, LocalDateTime endDate) {
        this.id = id;
        this.codes = codes;
        this.type = type;
        this.limitPro = limitePro;
        this.valueOfPro = valueOfPro;
        this.statusOfPro = statusOfPro;
        this.startDate = startDate;
        this.endDate = endDate;

        NumberFormat formatter = NumberFormat.getInstance(Locale.ENGLISH);
        fullValueOfPro = formatter.format(valueOfPro);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodes() {
        return codes;
    }

    public void setCodes(String codes) {
        this.codes = codes;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getLimitPro() {
        return limitPro;
    }

    public void setLimitPro(int limitPro) {
        this.limitPro = limitPro;
    }

    public double getValueOfPro() {
        return valueOfPro;
    }

    public void setValueOfPro(double valueOfPro) {
        this.valueOfPro = valueOfPro;
    }

    public String getStatusOfPro() {
        return statusOfPro;
    }

    public void setStatusOfPro(String statusOfPro) {
        this.statusOfPro = statusOfPro;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }

    public String getFullValueOfPro() {
        return fullValueOfPro;
    }

    public void setFullValueOfPro(String fullValueOfPro) {
        this.fullValueOfPro = fullValueOfPro;
    }

    @Override
    public String toString() {
        return "Promotion {id =" + id +
               ", code = " + codes +
               ", type = " + type + ", " +
               "limit = " + fullValueOfPro +
               ", value = " + valueOfPro +
               ", status = " + statusOfPro +
               ", startDate = " + startDate +
               ", endDate = " + endDate +
               '}';
    }
}
