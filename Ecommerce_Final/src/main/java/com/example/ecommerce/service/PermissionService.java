package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Permission;
import com.example.ecommerce.DAO.iml.PermissionDao;

import java.util.List;

public class PermissionService extends ServiceBase{

    private PermissionDao perDao;

    private static PermissionService instance;

    PermissionService(){
        super();
    }

    public static PermissionService getInstance(){
        if(instance == null){
            instance = new PermissionService();
        }
        return instance;
    }

    @Override
    public void init() {
        log.info("PermissionService init...");
        perDao = PermissionDao.getInstance();
    }

    public List<Permission> getAllPermissions(boolean forceUpdate) {
        log.info("PermissionService getAllPermissions...");
        return perDao.getAllPermissions(forceUpdate);
    }
}
