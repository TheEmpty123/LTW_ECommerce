package com.example.ecommerce.Bean;

import java.io.Serializable;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.Locale;

public class Product implements Serializable {
    private int id;
    private String proName;
    private String description;
    private double price;
    private String thumb;
    private LocalDateTime created_at;
    private int attributeId;
    private int cateId;

    private String fullPrice;

    public Product() {}

    public Product(int id, String proName, String description, double price, String thumb, LocalDateTime created_at, int attributeId, int cateId) {
        this.id = id;
        this.proName = proName;
        this.description = description;
        this.price = price;
        this.thumb = thumb;
        this.created_at = created_at;
        this.attributeId = attributeId;
        this.cateId = cateId;
        NumberFormat formater = NumberFormat.getInstance(Locale.ENGLISH);
        fullPrice = formater.format(price);
    }

    public int getId() {
        return id;
    }

    public String getProName() {
        return proName;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public String getThumb() {
        return thumb;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public int getAttributeId() {
        return attributeId;
    }

    public int getCateId() {
        return cateId;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public void setAttributeId(int attributeId) {
        this.attributeId = attributeId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", proName=" + proName +
                ", description=" + description +
                ", price=" + fullPrice +
                ", thumb=" + thumb +
                ", created_at=" + created_at +
                "}";
    }
}
