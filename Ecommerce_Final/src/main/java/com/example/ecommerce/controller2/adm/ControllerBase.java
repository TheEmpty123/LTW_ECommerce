package com.example.ecommerce.controller2.adm;

import com.example.ecommerce.controller2.MC;

public interface ControllerBase {
    default void initialize(){
        MC.createInstance();
    }
}
