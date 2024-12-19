package com.example.ecommerce.Bean;

import java.io.Serializable;

public class Address implements Serializable {
    private int id;
    private String Princible;
    private String Street;
    private String FullAddress;

    public Address(int id, String princible, String street, String fullAddress) {
        this.id = id;
        this.Princible = princible;
        this.Street = street;
        this.FullAddress = fullAddress;
    }

    public int getId() {
        return id;
    }

    public String getPrincible() {
        return Princible;
    }

    public String getStreet() {
        return Street;
    }

    public String getFullAddress() {
        return FullAddress;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPrincible(String princible) {
        this.Princible = princible;
    }

    public void setStreet(String street) {
        this.Street = street;
    }

    public void setFullAddress(String fullAddress) {
        this.FullAddress = fullAddress;
    }

    @Override
    public String toString() {
        return "Address{" +
                "fullAddress='" + FullAddress +
                ", street='" + Street +
                ", princible='" + Princible +
                ", id=" + id +
                '}';
    }
}
