package com.example.ecommerce.Common.Enum;

public enum StatusUser {
    ENABLE("enable"),
    DISABLE("disable");

    public final String status;

    StatusUser(String status) {
        this.status = status;
    }

    public String getStatus() {
        return this.status;
    }

    @Override
    public String toString() {
        return this.status;
    }

    // this method transfer string to enum
    public static StatusUser fromString(String status) {
        for (StatusUser s : StatusUser.values()) {
            if (s.status.equalsIgnoreCase(status)) {
                return s;
            }
        }
        throw new IllegalArgumentException("Unknown status: " + status);
    }
}
