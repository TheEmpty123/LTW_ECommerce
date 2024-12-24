package com.example.ecommerce.controller.adm;

import com.example.ecommerce.controller.MC;

public interface ControllerBase {
    default void initialize(){
        MC.createInstance();
    }
}
