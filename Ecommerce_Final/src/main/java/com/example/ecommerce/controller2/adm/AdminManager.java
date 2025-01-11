package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.util.List;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.ConnectionException;

@WebServlet(name = "management", value = "/admin/ad-mana")
public class AdminManager extends HttpServlet implements ControllerBase{

    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        log.info("Loading admin management page");

        try {
            log.info("Getting admin list...");
            List<User> adminList = MC.instance.userService.getAllAdmin(true);
            request.setAttribute("adminList", adminList);

            log.info("Getting total admin...");
            int totalAdmin = MC.instance.userService.getTotalAdmin(false);
            request.setAttribute("totalAdmin", totalAdmin);
        }
        catch (ConnectionException e){
            log.error("Error connecting to the database");
        }

        request.getRequestDispatcher("/views/admin/admin-management.jsp").forward(request,response);
    }

    public void destroy() {
    }
}