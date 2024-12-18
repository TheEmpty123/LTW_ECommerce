package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Role;

import java.util.List;

public interface IRoleDao {
// Lay tat ca ca role
    List<Role> getAllRoles();
// Lay role theo id
    Role getRoleById(int id);
// Them mot role moi
    boolean addRole(Role role);
// Cap nhat  ten role theo id
    boolean updateName(int id, String newName);
// xoa mot role
    boolean deleteRole(int id);
}
