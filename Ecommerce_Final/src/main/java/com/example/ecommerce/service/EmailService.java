package com.example.ecommerce.service;

import com.example.ecommerce.DAO.interf.IJavaMail;

public class EmailService implements IJavaMail {
    @Override
    public boolean send(String to, String subject, String message) {
        return false;
    }
}
