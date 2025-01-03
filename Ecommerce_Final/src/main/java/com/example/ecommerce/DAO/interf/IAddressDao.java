package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.Address;

import java.util.List;

public interface IAddressDao {
    List<Address> getAllAddress();
    Address getAddressById(int id);
}
