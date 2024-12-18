package com.example.ecommerce.Database;

import com.example.ecommerce.Bean.*;
import com.example.ecommerce.Common.IInitializable;
import com.example.ecommerce.Common.ManagerBase;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

public class JDBIConnect extends ManagerBase {
    private boolean status;
    private Jdbi jdbi;
    private MysqlDataSource src;

    private final IInitializable[] primaryManager;
    private final DBProperties properties = new DBProperties();

    public static JDBIConnect Instance;

    public static JDBIConnect getInstance() {
        if (Instance == null) {
            return Instance = new JDBIConnect();
        }
        return Instance;
    }

    JDBIConnect(){
        primaryManager = new IInitializable[] {
                properties
        };
        Initialize();
    }
    public Jdbi getJdbi() {
        return jdbi;
    }
    @Override
    protected void startInitializeBehavior() {
        status = false;
        Arrays.stream(primaryManager).forEach(IInitializable::Initialize);

        log.info("Prepare for connection");
        String url = "jdbc:mysql://" +
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
            endInitialize(false);
            return;
        }

        status = true;
        endInitialize(true);
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

        Random rd = new Random();
        rd.setSeed(2);

        int stock = 0;

        System.out.println("[");

        for (int i = 1; i <= 2; i++) {
            int sum = 0;

            for (int j = 1; j <= 152; j++) {
                if(j == 1 && i == 1) stock = 5000;
                else {
                    if (j == 1 && i == 2) stock = 3500;
                }

                int amount = 0;

                if (i == 1)
                    amount = rd.nextInt(67);
                else amount = rd.nextInt(50);

                if (sum + amount > stock) {
                    amount = stock - sum;
                }
                sum += amount;

                System.out.println("{\"warehouseID\":" + i + ",\"productID\":" + j + ", \"amount\":" + amount + "},");
            }
        }
        System.out.println("]");

//        Map<Integer, Product> products = db.jdbi.withHandle(handle -> handle
//                        .createQuery("select * from products")
//                        .mapToBean(Product.class)
//                        .stream()
//                        .collect(Collectors.toMap(Product::getId, product -> product)));
//
//        products.forEach((integer, product) -> System.out.println(product));

//        Map<Integer, User> users = db.jdbi.withHandle(handle -> handle
//                .createQuery("SELECT * FROM users")
//                .mapToBean(User.class)
//                .stream()
//                .collect(Collectors.toMap(User::getId, user -> user)));
//        users.forEach((id, user) -> System.out.println(user));

//        Map<Integer, Role> roles = db.jdbi.withHandle(handle -> handle
//                .createQuery("SELECT * FROM role")
//                .mapToBean(Role.class)
//                .stream()
//                .collect(Collectors.toMap(Role::getId, user -> user)));
//        roles.forEach((id, role) -> System.out.println(role));

//        Map<Integer, Permission> roles = db.jdbi.withHandle(handle -> handle
//                .createQuery("SELECT * FROM permission")
//                .mapToBean(Permission.class)
//                .stream()
//                .collect(Collectors.toMap(Permission::getId, per -> per)));
//        roles.forEach((id, per) -> System.out.println(per));

//        Map<Integer, Warehouse> wh = db.jdbi.withHandle(handle -> handle
//                .createQuery("SELECT * FROM warehouse")
//                .mapToBean(Warehouse.class)
//                .stream()
//                .collect(Collectors.toMap(Warehouse::getId, w -> w)));
//        wh.forEach((id, w) -> System.out.println(w));


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