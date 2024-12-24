package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Common.LogObj;
import com.example.ecommerce.Database.JDBIConnect;

public abstract class ImplementBase {
    protected final LogObj log = LogObj.defaultLog;
    protected String logName = getClass().getName();
    protected JDBIConnect db;

    protected  ImplementBase(){
        log.setName(logName);
        db = JDBIConnect.getInstance();
    }

}
