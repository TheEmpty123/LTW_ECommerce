package com.example.ecommerce.DAO.iml;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.DAO.interf.IUsersDao;

import java.util.ArrayList;
import java.util.List;

public class UserDao extends ImplementBase implements IUsersDao {
    List<User> users = new ArrayList<>();

    public UserDao() {
        super();
    }
    @Override
    public List<User> getAllUsers() {
        return List.of();
    }

    @Override
    public User getUserById(int id) {
        return null;
    }

    @Override
    public boolean addUser(User user) {
        return false;
    }

    @Override
    public boolean updateInfoUserNameById(int id, String userName, String fullName, String gender, String email, String phone) {
        return false;
    }

    @Override
    public boolean updateAvatarById(int id, String avatar) {
        return false;
    }

    @Override
    public boolean updatePasswordById(int id, String password) {
        return false;
    }

    @Override
    public boolean deleteUserById(int id) {
        return false;
    }

    @Override
    public User findUser(String username) {
        return null;
    }
}