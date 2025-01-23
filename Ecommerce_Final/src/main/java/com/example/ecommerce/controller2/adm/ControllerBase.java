package com.example.ecommerce.controller2.adm;

import com.example.ecommerce.Common.LogObj;
import com.example.ecommerce.controller2.MC;

public interface ControllerBase {
    public LogObj log = new LogObj();
    default void initialize(){
        MC.createInstance();
        log.setName(getClass().getSimpleName());
    }
}
