package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.DAO.iml.UserDao;
import com.example.ecommerce.InsertData;
import com.example.ecommerce.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "register", value = "/register")
public class RegisterController extends HttpServlet {
    private UserDao userDao;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/auth/Register.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        userDao = new UserDao();
        UserService userService = new UserService();
        String email = req.getParameter("email");
        String name = req.getParameter("uname");
        String pass = req.getParameter("pass");
//        String hash = InsertData.hashPassword(pass);
        User user = new User(name,pass,email);
        this.userDao.addUser(user);

        req.setAttribute("success", "Register successfully!");
        req.getRequestDispatcher("/views/auth/Success-register.jsp").forward(req,resp);
    }

}
