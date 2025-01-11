package com.example.ecommerce.service;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.Accessibility;
import com.example.ecommerce.DAO.iml.UserDao;
import com.example.ecommerce.DAO.interf.IJavaMail;
import com.example.ecommerce.mail.MailProperties;
import jakarta.servlet.http.HttpSession;

import javax.mail.internet.InternetAddress;
import java.util.List;
import java.util.Objects;
import java.util.Properties;

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

    public void verifyAccount(String email, String hash) {
        IJavaMail emailService = new EmailService();
        var listUser = userDao.getAllUsers();
        for (var list : listUser) {
            if (list.getEmail().equals(email)) {
                log.warn("Email does not exist!");
            }
            try {
                String to = String.valueOf(new InternetAddress(MailProperties.APP_EMAIL));
                String subject = "Xac thuc tai khoan. Thoi han 30 phut.";
                String messageContent = "Chon vao day : " + "http://localhost:8080/views/auth/Change-password.jsp"
                        + email + "&key2=" + hash;
                emailService.send(to, subject, messageContent);
            } catch (Exception e) {
                log.error("Error! Can not send email");
                e.printStackTrace();
            }
        }
    }
}
