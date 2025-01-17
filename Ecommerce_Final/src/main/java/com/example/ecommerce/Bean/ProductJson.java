package com.example.ecommerce.Bean;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Locale;

public class ProductJson implements Serializable {
    private int id;
    private String proName;
    private String description;
    private double price;
    private String thumb;
    private int atributeID;
    private int cateID;

    private String fullPrice;

    public ProductJson(int id, String proName, String description, double price, String thumb, int cateID, int atributeID) {
        this.id = id;
        this.proName = proName;
        this.description = description;
        this.price = price;
        this.thumb = thumb;
        this.cateID = cateID;
        this.atributeID = atributeID;
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


    public int getAtributeID() {
        return atributeID;
    }

    public String getFullPrice() {
        return fullPrice;
    }

    //    public void setFullPrice(String fullPrice)
    public int getCateID() {
        return cateID;
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

    public void setAtributeID(int attributeId) {
        this.atributeID = attributeId;
    }

    public void setCateID(int cateId) {
        this.cateID = cateId;
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
                ", created_at=" +
                "}";
    }

}
