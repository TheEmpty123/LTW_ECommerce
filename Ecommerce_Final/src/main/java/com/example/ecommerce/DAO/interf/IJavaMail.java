package com.example.ecommerce.DAO.interf;

public interface IJavaMail {
    public boolean send(String to, String subject, String message);
}
