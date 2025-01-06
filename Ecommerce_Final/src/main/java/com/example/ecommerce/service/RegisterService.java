package com.example.ecommerce.service;
import com.example.ecommerce.DAO.iml;

public class RegisterService {
    private static RegisterService instance;
    private UsersDao usersDao;

    public RegisterService() {
        usersDao = new UsersDaoImpl();
    }

    public static RegisterService getInstance() {
        if (instance == null) {
            instance = new RegisterService();
        }
        return instance;
    }

}
