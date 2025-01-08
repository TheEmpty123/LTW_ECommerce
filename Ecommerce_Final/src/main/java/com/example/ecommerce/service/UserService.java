package com.example.ecommerce.service;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.Accessible;
import com.example.ecommerce.DAO.iml.UserDao;
import jakarta.servlet.http.HttpSession;

import java.util.List;

public class UserService extends ServiceBase {

    private UserDao userDao = new UserDao();

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
        User user = (User) session.getAttribute("auth");
        return user;
    }

    // Check if user whether is allowed to access advance feature
    public Accessible isAccessible(HttpSession session) {

        if (session == null) return Accessible.NOT_LOGGED_IN;

        User user = getUser(session);

        if (user == null) {
            log.warn("User not logged in");
            return Accessible.NOT_LOGGED_IN;
        } else if (user.getRoleID() == 0) {
            log.info("A customer logged in!");
            return Accessible.CLIENT;
        } else if (user.getRoleID() == 1) {
            log.info("User: " + user.getUsername() + " logged in!");
            return Accessible.EMPLOYEE;
        } else if (user.getRoleID() == 2) {
            log.info("Manager: " + user.getUsername() + " logged in!");
            return Accessible.MANAGER;
        } else if (user.getRoleID() == 3) {
            log.info("Administrator: " + user.getUsername() + " logged in!");
            return Accessible.ADMINISTRATOR;
        } else return Accessible.NOT_LOGGED_IN;
    }
    public Accessible isAccessible(User user) {
        if (user == null) {
            log.warn("User not logged in");
            return Accessible.NOT_LOGGED_IN;
        } else if (user.getRoleID() == 0) {
            log.info("A customer logged in!");
            return Accessible.CLIENT;
        } else if (user.getRoleID() == 1) {
            log.info("User: " + user.getUsername() + " logged in!");
            return Accessible.EMPLOYEE;
        } else if (user.getRoleID() == 2) {
            log.info("Manager: " + user.getUsername() + " logged in!");
            return Accessible.MANAGER;
        } else if (user.getRoleID() == 3) {
            log.info("Administrator: " + user.getUsername() + " logged in!");
            return Accessible.ADMINISTRATOR;
        } else return Accessible.NOT_LOGGED_IN;
    }

    // Login
    public User checkLogin(String username, String pass) {
        User u = userDao.findUser(username);
        if (u != null && pass != null && pass.equals(u.getPass())) {
            u.setPass(null);
            return u;
        }
        return null;
    }

    // Get all user
    // @param : forceUpdate -> force update query
    public List<User> getAllUser(boolean forceUpdate){
        log.info("UserService getAllUser...");
        return userDao.getAllUsers(forceUpdate);
    }

    // Get total user count
    // @param : forceUpdate -> force update query
    public int getTotalUsers(boolean forceUpdate){
        log.info("UserService getTotalUsers...");
        return userDao.getTotalUsers(forceUpdate);
    }

    // Get total user with role employee
    // @param : forceUpdate -> force update query
    public int getTotalEmployee(boolean forceUpdate) {
        log.info("UserService getTotalEmployee...");
        return userDao.getTotalEmployee(forceUpdate);
    }
}
