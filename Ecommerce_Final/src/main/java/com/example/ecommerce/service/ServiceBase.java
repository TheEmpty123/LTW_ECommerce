package com.example.ecommerce.service;

import com.example.ecommerce.Common.LogObj;

public abstract class ServiceBase{
    LogObj log;
    String logName = getClass().getName();;

    public ServiceBase() {
        log.setName(logName);
    }

    public abstract void init();

}
