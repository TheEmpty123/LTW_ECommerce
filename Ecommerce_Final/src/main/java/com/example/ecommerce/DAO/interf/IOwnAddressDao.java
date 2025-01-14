package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.OwnAddress;

import java.util.List;

public interface IOwnAddressDao {
    int recordSize();

    List<OwnAddress> getOwnAddress(int id);

    void update(String fullName, String phoneNum, String princible, String fullAddress, int userId, int addressId);
}
