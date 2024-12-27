package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String uname= req.getParameter("uname");
        String pass= req.getParameter("pass");
        UserService authService=  new UserService();
        User u = authService.checkLogin(uname,pass);
        if(u!=null){
            HttpSession session = req.getSession();
            session.setAttribute("auth",u);
            resp.sendRedirect("");
        }else{
            req.setAttribute("error","Đăng nhập không thành công");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }
}
