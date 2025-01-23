package com.example.ecommerce.Bean;

public class FilterInput {
    private String sort;
    private String material;
    public FilterInput(String sort, String material) {
        this.sort = sort;
        this.material = material;
    }

    public String getSort() {
        return sort;
    }

    public String getMaterial() {
        return material;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    @Override
    public String toString() {
        return this.sort + " " + this.material;
    }
}
