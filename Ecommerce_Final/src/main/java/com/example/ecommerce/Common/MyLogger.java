package com.example.ecommerce.Common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyLogger {
    public static boolean shouldLog = true;

    public static void log(Object msg) {
        if (shouldLog) {
            System.out.println(msg);
        }
    }

    public static void log(Object log, Object context) {
        if (shouldLog) {
            System.out.print(log + " ");
            System.out.println(context);
        }
    }

    public static void warn(Object msg) {
        if (shouldLog) {
            System.err.println(msg);
        }
    }

    public static void warn(Object log, Object context) {
        if (shouldLog) {
            System.err.print(log + " ");
            System.out.println(context);
        }
    }

    public static void error(Object msg) {
        if (shouldLog) {
            System.err.println(msg);
        }
    }

    public static void error(Object log, Object context) {
        if (shouldLog) {
            System.err.print(log + " ");
            System.out.println(context);
        }
    }
}

class LogObj{

    public static final LogObj defaultLog = new LogObj();

    private String _name;

    LogObj(){
        this._name = null;
    }

    LogObj(String name){
        this._name = name;
    }

    public void setName(String name) {
        this._name = name;
    }

    public void info(Object msg){
        MyLogger.log(getLog("INFO", "", msg));
    }

    public void info(String extraName, Object msg){
        MyLogger.log(getLog("INFO", extraName, msg));
    }

    public void warn(Object msg){
        MyLogger.warn(getLog("WARN", "", msg));
    }

    public void warn(String extraName, Object msg){
        MyLogger.warn(getLog("WARN", extraName, msg));
    }

    public void error(Object msg){
        MyLogger.error(getLog("ERROR", "", msg));
    }

    public void error(String extraName, Object msg){
        MyLogger.error(getLog("ERROR", extraName, msg));
    }

    private String getLog(String pad, String extraName, Object msg){
        var l = String.format("[%s] %s", pad, extraName);
        return String.format(
                "(GL)[%s]%s " + "%s" + "%s" + "%s"
                , pad
                , FormateDate(new Date())
                , (_name != null ? "[" + _name + "]" : "")
                , (extraName != "" ? "[" + extraName + "]" : "")
                , msg);
    }

    private String FormateDate(Date date){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        String formattedDate = formatter.format(date);
        return formattedDate;
    }
}
