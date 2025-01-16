package com.example.ecommerce.service;

import com.example.ecommerce.DAO.iml.WarehouseDao;
import com.example.ecommerce.DAO.interf.IWarehouseDTO;
import com.example.ecommerce.DAO.interf.IWarehouseDao;
import com.example.ecommerce.Dto.WarehouseDto;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import java.util.List;

public class WarehouseService extends ServiceBase {

    WarehouseDao warehouseDao;

    public static WarehouseService instance;

    public static WarehouseService getInstance() {
        if (instance == null) {
            instance = new WarehouseService();
        }
        return instance;
    }

    WarehouseService() {
        super();
    }

    @Override
    public void init() {
        log.info("WarehouseService init...");
        warehouseDao = new WarehouseDao();
    }

    public int getTotalWarehouse(boolean forceUpdate) {
        log.info("WarehouseService getTotalWarehouse...");
        var wh = warehouseDao.getAllWarehouse(forceUpdate);

        return wh.size();
    }

    public List<WarehouseDto> getAllWarehouse() {
        log.info("WarehouseService getAllWarehouse...");
        var j = warehouseDao.getJdbi();
        j.installPlugin(new SqlObjectPlugin());
        var li = j.withExtension(IWarehouseDTO.class, IWarehouseDTO::getWarehouse);
        return li;
    }

    public int totalProductItems() {
        return warehouseDao.totalProductItems();
    }

    public int totalInStock() {
        return warehouseDao.totalInStock();
    }

    public int totalOutOfStock() {
        return warehouseDao.totalOutOfStock();
    }

    public static void main(String[] args) {
        var a = new WarehouseService();
        a.init();
        var b = a.getAllWarehouse();
        b.forEach(System.out::println);
    }
}
