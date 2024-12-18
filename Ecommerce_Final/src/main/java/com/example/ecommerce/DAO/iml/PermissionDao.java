package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Permission;
import com.example.ecommerce.DAO.interf.IPermissionDao;

import java.util.ArrayList;
import java.util.List;

public class PermissionDao implements IPermissionDao {
    List<Permission> permissions = new ArrayList<>();

    @Override
    public List<Permission> getAllPermissions() {
        return List.of();
    }

    @Override
    public Permission getPermissionById(int id) {
        return null;
    }

    @Override
    public boolean addPermission(Permission permission) {
        return false;
    }

    @Override
    public boolean updateName(int id, String newName) {
        return false;
    }

    @Override
    public boolean deletePermission(int id) {
        return false;
    }
}
