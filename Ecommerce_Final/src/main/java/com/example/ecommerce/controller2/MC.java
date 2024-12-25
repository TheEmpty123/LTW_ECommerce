package com.example.ecommerce.controller2;

import com.example.ecommerce.Common.IInitializable;
import com.example.ecommerce.Common.LogObj;
import com.example.ecommerce.Database.JDBIConnect;
import com.example.ecommerce.service.ProductService;
import com.example.ecommerce.service.ServiceBase;
import com.example.ecommerce.service.UserService;

import java.util.ArrayList;

public class MC {

    public ProductService productService;
    public UserService userService;
    public LogObj log = new LogObj();

    private boolean initialized;
    private final IInitializable conn;
    private final ArrayList<ServiceBase> serviceList;

    public static MC instance;

    public static MC createInstance() {
        if (instance == null) {
            instance = new MC();
            instance.init();
        }
        return instance;
    }

    public MC() {
        initialized = false;
        conn = JDBIConnect.getInstance();
        serviceList = new ArrayList<>();
        serviceList.add(productService = ProductService.getInstance());
        serviceList.add(userService = UserService.getInstance());
    }

    private void init() {
        if (initialized) return;

        log.setName(getClass().getName());

        conn.Initialize();
        serviceList.forEach(ServiceBase::init);

        initialized = true;
    }

    public static void main(String[] args) {
//        System.out.println(" ee địt mẹ");
    }

}
