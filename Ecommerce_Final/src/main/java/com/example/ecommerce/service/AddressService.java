package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Address;
import com.example.ecommerce.DAO.iml.AddressDao;
import com.example.ecommerce.DAO.iml.CategoryDao;

import java.util.List;

public class AddressService extends ServiceBase{
    private static AddressService instance;
    AddressDao addressDao = new AddressDao();
    public AddressService() {
        instance = this;
    }
    @Override
    public void init() {
        log.info("AddressService init...");
    }

    public static AddressService getInstance() {
        if (instance == null) {
            instance = new AddressService();
            instance.addressDao = new AddressDao();
        }
        return instance;
    }
    public List<Address> getAllAddress() {
        return addressDao.getAllAddress();
    }
    public Address getAddressById(int id) {
        return addressDao.getAddressById(id);
    }
}
