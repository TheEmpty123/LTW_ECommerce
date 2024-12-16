package com.example.ecommerce.Bean;

import java.io.Serializable;
import java.sql.Date;

public class Product implements Serializable {
    private int id;
    private String proName;
    private String description;
    private float price;
    private String thumb;
    private Date create_at;
    private int attributeId;
    private int cateId;

    public Product() {}

    public Product(int id, String proName, String description, float price, String thumb, Date create_at, int attributeId, int cateId) {
        this.id = id;
        this.proName = proName;
        this.description = description;
        this.price = price;
        this.thumb = thumb;
        this.create_at = create_at;
        this.attributeId = attributeId;
        this.cateId = cateId;
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

    public float getPrice() {
        return price;
    }

    public String getThumb() {
        return thumb;
    }

    public Date getCreate_at() {
        return create_at;
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

    public void setPrice(float price) {
        this.price = price;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    @Override
    public String toString() {
        return "id=" + id +
                ", proName=" + proName +
                ", description=" + description +
                ", price=" + price +
                ", thumb=" + thumb +
                ", create_at=" + create_at;
    }
}
