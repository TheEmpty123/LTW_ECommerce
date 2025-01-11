package com.example.ecommerce.controller2;

import com.example.ecommerce.service.EmailService;
import com.example.ecommerce.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "forgot", value = "/forgot")
public class ForgotPassController extends HttpServlet {
    UserService userService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userService = new UserService();
        String email = req.getParameter("email");
        if (email.isEmpty() || email == null) {
            resp.getWriter().write("Email does not empty!");
        }
        userService.verifyAccount(email);
        resp.getWriter().write("An email has been sent to your email");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
