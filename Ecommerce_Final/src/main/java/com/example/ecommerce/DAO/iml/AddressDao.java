package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.Address;
import com.example.ecommerce.DAO.interf.IAddressDao;
import com.example.ecommerce.Database.JDBIConnect;

import java.util.List;

public class AddressDao implements IAddressDao {
    JDBIConnect conn = JDBIConnect.getInstance();

    public AddressDao() {
        super();
    }
    @Override
    public List<Address> getAllAddress() {
        return conn.jdbi.withHandle(handle ->
                handle.createQuery("select * from address")
                        .mapToBean(Address.class)
                        .list());
    }

    @Override
    public Address getAddressById(int id) {
        return conn.jdbi.withHandle(handle ->
                handle.createQuery("select * from address where id in (select addressID from own_address where userID = :id)")
                        .bind("id", id)
                        .mapToBean(Address.class)
                        .findOne().orElse(null));
    }
}
