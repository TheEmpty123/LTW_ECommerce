package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Role;
import com.example.ecommerce.DAO.interf.IRoleDao;

import java.util.ArrayList;
import java.util.List;

public class RoleDao extends ImplementBase implements IRoleDao {
    List<Role> roles = new ArrayList<>();

    public RoleDao() {
        super();
    }
    @Override
    public List<Role> getAllRoles() {
        return List.of();
    }

    @Override
    public Role getRoleById(int id) {
        return null;
    }

    @Override
    public boolean addRole(Role role) {
        return false;
    }

    @Override
    public boolean updateName(int id, String newName) {
        return false;
    }

    @Override
    public boolean deleteRole(int id) {
        return false;
    }
}
