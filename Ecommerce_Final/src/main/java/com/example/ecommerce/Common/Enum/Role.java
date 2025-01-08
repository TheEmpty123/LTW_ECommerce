package com.example.ecommerce.Common.Enum;

public enum Role {
    CLIENT(1),
    MANAGER(2),
    EMPLOYEE(3),
    ADMINISTRATOR(4);

    private final int value;

    Role(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
