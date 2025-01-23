package com.example.ecommerce.Bean;

public class assignPers {
    private int permissionID;
    private int roleID;

    public assignPers() {}
    public assignPers(int permissionID, int roleID) {
        this.permissionID = permissionID;
        this.roleID = roleID;
    }

    public int getPermissionID() {
        return permissionID;
    }

    public void setPermissionID(int permissionID) {
        this.permissionID = permissionID;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }
}
