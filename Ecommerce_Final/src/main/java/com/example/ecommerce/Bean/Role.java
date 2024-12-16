package com.example.ecommerce.Bean;

import java.io.Serializable;

public class Role implements Serializable {
    private int id;
    private String nameRole;

    public Role() {}
    public Role(int id, String nameRole) {
        this.id = id;
        this.nameRole = nameRole;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameRole() {
        return nameRole;
    }

    public void setNameRole(String nameRole) {
        this.nameRole = nameRole;
    }

    @Override
    public String toString() {
        return "Role{" + "id=" + id + ", nameRole=" + nameRole + '}';
    }
}
