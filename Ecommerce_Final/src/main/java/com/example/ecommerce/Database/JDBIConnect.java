package com.example.ecommerce.Database;

import com.example.ecommerce.Common.IInitializable;
import com.example.ecommerce.Common.ManagerBase;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;
import java.util.*;

public class JDBIConnect extends ManagerBase {
    private boolean status;
    public Jdbi jdbi;
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

    JDBIConnect() {
        primaryManager = new IInitializable[]{
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
        } catch (SQLException e) {
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
        if (!status) {
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
    }
}