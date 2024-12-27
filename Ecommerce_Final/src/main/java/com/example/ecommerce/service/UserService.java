package com.example.ecommerce.service;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.Accessibility;
import com.example.ecommerce.DAO.iml.UserDao;
import jakarta.servlet.http.HttpSession;

public class UserService extends ServiceBase {

    private UserDao userDao;

    public static UserService Instance;

    public UserService() {
        super();
    }

    public static UserService getInstance() {
        if (Instance == null) {
            Instance = new UserService();
            Instance.userDao = new UserDao();
        }
        return Instance;
    }

    @Override
    public void init() {
        log.info("UserService init...");
        if (userDao == null) {
            userDao = new UserDao();
        }
    }

    // Get user by session
    public User getUser(HttpSession session) {
        log.info("UserService getting user using session...");
        User user = (User) session.getAttribute("user");
        return user;
    }

    public Accessibility isAccessible(HttpSession session) {
        User user = getUser(session);

        if (user == null) {
            log.warn("User not logged in");
            return Accessibility.NOT_LOGGED_IN;
        }
        if (user.getRoleID() == 0) {
            log.info("A customer logged in!");
            return Accessibility.CLIENT;
        } else if (user.getRoleID() == 1) {
            log.info("User: " + user.getUsername() + " logged in!");
            return Accessibility.EMPLOYEE;
        } else if (user.getRoleID() == 2) {
            log.info("Manager: " + user.getUsername() + " logged in!");
            return Accessibility.MANAGER;
        } else if (user.getRoleID() == 3) {
            log.info("Administrator: " + user.getUsername() + " logged in!");
            return Accessibility.ADMINISTRATOR;
        } else return Accessibility.NOT_LOGGED_IN;
    }

    public User checkLogin(String username, String pass) {
        User u = userDao.findUser(username);
        if (u!= null && pass != null && pass.equals(u.getPass())) {
            u.setPass(null);
            return u;
        }
        return null;
    }

}
