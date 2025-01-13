package com.example.ecommerce.service;

import com.example.ecommerce.DAO.iml.WarehouseDao;
import com.example.ecommerce.DAO.interf.IWarehouseDao;

public class WarehouseService extends ServiceBase{

    IWarehouseDao warehouseDao;

    public static WarehouseService instance;

    public static WarehouseService getInstance(){
        if(instance == null){
            instance = new WarehouseService();
        }
        return instance;
    }

    WarehouseService(){
        super();
    }

    @Override
    public void init() {
        warehouseDao = new WarehouseDao();
    }

    public int getTotalWarehouse(boolean forceUpdate) {
        log.info("WarehouseService getTotalWarehouse...");
        var wh = warehouseDao.getAllWarehouse(forceUpdate);

        return wh.size();
    }
}
