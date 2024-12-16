package com.example.ecommerce.Database;

import com.example.ecommerce.Bean.Product;
import com.example.ecommerce.Common.IInitializable;
import com.example.ecommerce.Common.ManagerBase;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import java.sql.SQLException;
import java.util.*;

public class JDBIConnect extends ManagerBase {
    private boolean status = false;
    private String url;
    private Jdbi jdbi;
    private MysqlDataSource src;

    private IInitializable[] primaryManager;
    private DBProperties properties = new DBProperties();

    public static JDBIConnect getInstance() {
        return new JDBIConnect();
    }

    JDBIConnect(){
        primaryManager = new IInitializable[] {
                properties
        };
        Initialize();
    }

    @Override
    protected void startInitializeBehavior() {
        Arrays.stream(primaryManager).forEach(o -> o.Initialize());

        log.info("Prepare for connection");
        url = "jdbc:mysql://" +
                properties.host + ":" +
                properties.port + "/" +
                properties.dbname + "?" +
                properties.option;

        src = new MysqlDataSource();
        src.setUrl(url);
        src.setUser(properties.username);
        src.setPassword(properties.password);

        log.info("Ready to connect to database: [" + properties.dbname + "]");
        log.info("setting up database connection");
        try {
            src.setUseCompression(true);
            src.setAutoReconnect(true);
        }
        catch (SQLException e) {
            log.error("Error setting up database connection");
            log.error(new RuntimeException(e));
            status = false;
            endInitialize(status);
        }

        status = true;
        endInitialize(status);
    }

    @Override
    protected void endInitializeBehavior() {
        if(!status){
            log.error("Unable to correctly initialize database connection");
            return;
        }
        log.info("Connecting to database");
        createConnect();
    }

    private void createConnect() {
        jdbi = Jdbi.create(src);
    }

    public static void main(String[] args) {
        JDBIConnect db = new JDBIConnect();

        List<Product> products = db.jdbi.withHandle(handle -> {
            return handle.createQuery("select * from products").mapToBean(Product.class).list();
        });
        products.forEach(System.out::println);

//        Logging.log("Message");
//        Logging.warn("Warn message");
//        Logging.error("Error message");

//        LogObj log = LogObj.defaultLog;
//        String logName = JDBIConnect.class.getName();
//        log.setName(logName);
//
//        log.info("Message");
//        log.warn("Warn message");
//        log.error("Error message");
    }
}