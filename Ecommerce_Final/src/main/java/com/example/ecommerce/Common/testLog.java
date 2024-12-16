package com.example.ecommerce.Common;

public class testLog {

    LogObj log;

    testLog(){
        log = new LogObj();
        log.setName(this.getClass().getName());
    }

    public static void main(String[] args) {
        testLog testLog = new testLog();
        testLog.log.info("test INFO");
        testLog.log.warn("test WARN");
        testLog.log.error("test ERROR");
    }

}
