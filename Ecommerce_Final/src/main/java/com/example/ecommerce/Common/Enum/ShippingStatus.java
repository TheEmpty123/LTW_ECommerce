package com.example.ecommerce.Common.Enum;

public enum ShippingStatus {
    Pending("pending"),
    Shipped("shipped"),
    Delivered("delivered"),
    Canceled("canceled");

    private String status;

    ShippingStatus(String status) {
        this.status = status;
    }

    // this method transfer string to enum
    public static ShippingStatus fromString(String status) {
        for (ShippingStatus shippingStatus : ShippingStatus.values()) {
            if (shippingStatus.status.equalsIgnoreCase(status)) {
                return shippingStatus;
            }
        }
        throw new IllegalArgumentException("Invalid ShippingStatus");
    }

    @Override
    public String toString() {
        return this.status;
    }
}