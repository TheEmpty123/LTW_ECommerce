package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Warehouse;
import com.example.ecommerce.DAO.interf.IWarehouseDao;

import java.util.ArrayList;
import java.util.List;

public class WarehouseDao extends ImplementBase implements IWarehouseDao {
    List<Warehouse> warehouses = new ArrayList<>();

    public WarehouseDao() {
        super();
    }
    @Override
    public List<Warehouse> getAllWarehouse() {
        return List.of();
    }

    @Override
    public Warehouse getWarehouseById(int id) {
        return null;
    }

    @Override
    public boolean addWarehouse(Warehouse warehouse) {
        return false;
    }

    @Override
    public boolean updateNameById(int id, String name) {
        return false;
    }

    @Override
    public boolean updateManagerbyId(int id, int managerid) {
        return false;
    }

    @Override
    public boolean updateAddressById(int id, String address) {
        return false;
    }

    @Override
    public boolean updateStockById(int id, int stock) {
        return false;
    }

    @Override
    public boolean updateAvailableById(int id, String state) {
        return false;
    }

    @Override
    public boolean deleteWarehouseById(int id) {
        return false;
    }
}
