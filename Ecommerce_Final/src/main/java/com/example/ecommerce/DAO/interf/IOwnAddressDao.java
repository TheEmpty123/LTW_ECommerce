package com.example.ecommerce.DAO.interf;

import com.example.ecommerce.Bean.OwnAddress;

import java.util.List;

public interface IOwnAddressDao {
    public int recordSize();

    public List<OwnAddress> getOwnAddress(int id);
}
