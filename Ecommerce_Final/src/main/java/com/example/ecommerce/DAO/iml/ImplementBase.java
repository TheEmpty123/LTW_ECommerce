package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Common.LogObj;

public abstract class ImplementBase {
    protected final LogObj log = LogObj.defaultLog;
    protected String logName = getClass().getName();

    protected  ImplementBase(){
        log.setName(logName);
    }

}
