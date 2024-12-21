package com.example.ecommerce.controller;

import com.example.ecommerce.Common.IInitializable;
import com.example.ecommerce.Common.LogObj;
import com.example.ecommerce.Database.JDBIConnect;
import com.example.ecommerce.service.ProductService;
import com.example.ecommerce.service.ServiceBase;

import java.util.ArrayList;

public class MC {

    public ProductService productService;
    public LogObj log = new LogObj();

    private boolean initialized = false;
    private final IInitializable conn;
    private final ArrayList<ServiceBase> serviceList;

    public static MC instance = new MC();

    public static MC getInstance() {
        if (instance == null) {
            instance = new MC();
        }
        return instance;
    }

    public MC() {
        instance = this;

        conn = JDBIConnect.getInstance();

        serviceList = new ArrayList<>();

        serviceList.add(productService = ProductService.getInstance());

        init();
    }

    public void init() {
        if (initialized) return;

        log.setName(getClass().getName());

        conn.Initialize();
        serviceList.forEach(ServiceBase::init);

        initialized = true;
    }

}
