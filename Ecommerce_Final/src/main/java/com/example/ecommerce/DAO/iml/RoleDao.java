package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Role;
import com.example.ecommerce.Bean.assignPers;
import com.example.ecommerce.DAO.interf.IRoleDao;

import java.util.*;

public class RoleDao extends ImplementBase implements IRoleDao {
    Map<Integer, Role> roles = new HashMap<>();

    public RoleDao() {
        super();
        init();
    }

    void init(){

        log.info("Initializing...");
        try {
            roles = getAllRoles();
            PermissionDao permissionDao = new PermissionDao();
            var pers = permissionDao.getAllPermissionsMap();
            var assign = getAssignPermissions();

            for (var a : assign) {
                assignRole(roles.get(a.getRoleID()), pers.get(a.getPermissionID()));
            }
        }
        catch (Exception e) {
            log.error("Error in initializing RoleDao");
            e.printStackTrace();
        }
    }

    private List<assignPers> getAssignPermissions() {
        log.info("Querying assign permissions");
        return handle.createQuery("SELECT * FROM asigning_role")
                .mapToBean(assignPers.class)
                .list();
    }

    private void assignRole(Role role, String permission) {
        log.info("Assigning role: " + role.getNameRole() + " with permission: " + permission);
        role.addPermission(permission);
    }

    @Override
    public Map<Integer, Role> getAllRoles() {
        if (roles.isEmpty()) {
            var u = handle.createQuery("SELECT * FROM role")
                    .mapToBean(Role.class)
                    .list();
            u.forEach(role -> roles.put(role.getId(), role));
        }
        return roles;
    }

    @Override
    public Map<Integer, Role> getAllRoles(boolean force) {
        log.info("Querying for all roles with force: " + force);
        if (force) {
            roles.clear();
            init();
        } else
            roles = getAllRoles();
        return roles;
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

    public static void main(String[] args) {
        var a = new RoleDao();

    }
}
