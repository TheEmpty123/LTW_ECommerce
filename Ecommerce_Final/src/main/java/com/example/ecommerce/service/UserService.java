package com.example.ecommerce.service;

import com.example.ecommerce.Bean.Role;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.Accessible;
import com.example.ecommerce.DAO.iml.RoleDao;
import com.example.ecommerce.DAO.iml.UserDao;

import com.example.ecommerce.DAO.interf.IJavaMail;
import com.example.ecommerce.mail.MailProperties;
import jakarta.servlet.http.HttpSession;

import javax.mail.internet.InternetAddress;
import java.util.List;
import java.util.Objects;
import java.util.Properties;

import com.example.ecommerce.controller2.MC;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;


public class UserService extends ServiceBase {

    private UserDao userDao = new UserDao();
    private RoleDao roleDao = new RoleDao();

    public static UserService Instance;

    public UserService() {
        super();
    }

    public static UserService getInstance() {
        if (Instance == null) {
            Instance = new UserService();
            Instance.userDao = new UserDao();
            Instance.roleDao = new RoleDao();
        }
        return Instance;
    }

    @Override
    public void init() {
        log.info("UserService init...");
        if (userDao == null) {
            userDao = new UserDao();
            roleDao = new RoleDao();
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


    public void addUser(User user) {
        log.info("UserService adding user...");
        userDao.addUser(user);

    }


    public User checkLogin(String username, String pass) {
        User u = userDao.findUser(username);
        if (u != null && pass != null && pass.equals(u.getPass())) {
            u.setPass(null);
            return u;
        }
        return null;
    }


    public void verifyAccount(String email) {
        IJavaMail emailService = new EmailService();
        boolean emailFound = false;
        var listUser = userDao.getAllUsers();
        for (var list : listUser) {
            if (list.getEmail().equals(email)) {
                emailFound = true;
                try {
//                    String to = String.valueOf(new InternetAddress(MailProperties.APP_EMAIL));
                    String subject = "Xac thuc tai khoan. Thoi han 30 phut.";
                    String messageContent = "Chon vao day : " + "http://localhost:8080/views/auth/Change-password.jsp";
                    log.info("Password reset email send to " + email);
                    emailService.send(email, subject, messageContent);
                } catch (Exception e) {
                    log.error("Error! Can not send email");
                    e.printStackTrace();
                }
            }
        }
        if (emailFound) {
            log.warn("Email does not exist in the system!" + email);
        }
    }

    // Get all user
    // @param : forceUpdate -> force update query
    public List<User> getAllUser(boolean forceUpdate) {
        log.info("UserService getAllUser...");
        return userDao.getAllUsers(forceUpdate);
    }

    // Get total user count
    // @param : forceUpdate -> force update query
    public int getTotalUsers(boolean forceUpdate) {
        log.info("UserService getTotalUsers...");
        return userDao.getTotalUsers(forceUpdate);
    }

    // Get total user with role employee
    // @param : forceUpdate -> force update query
    public int getTotalEmployee(boolean forceUpdate) {
        log.info("UserService getTotalEmployee...");
        return userDao.getTotalEmployee(forceUpdate);
    }

    public int getTotalAdmin(boolean forceUpdate) {
        log.info("UserService getTotalAdmin...");
        return userDao.getTotalAdmin(forceUpdate);
    }

    public List<User> getAllAdmin(boolean forceUpdate) {
        log.info("UserService getAllAdmin");
        return userDao.getAllAdmin(forceUpdate);
    }

    public Map<Integer, Role> getRolesMap(boolean forceUpdate) {
        log.info("UserService getRolesMap...");
        return roleDao.getAllRoles(forceUpdate);
    }

    public boolean hasPermission(User user, String permission) {
        log.info("UserService hasPermission...");

        if (user == null || permission.equals("")) return false;

        var roles = MC.instance.userService.getRolesMap(true);
        Role userRole = roles.get(user.getRoleID());

        return userRole.equals(permission);

    }
}
