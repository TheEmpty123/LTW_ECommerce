package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.util.List;
import java.util.Map;

import com.example.ecommerce.Bean.Role;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.DAO.iml.UserDao;
import com.example.ecommerce.controller2.MC;
import com.example.ecommerce.service.UserService;
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
        initialize();
        log.warn("Loading admin management page");

        HttpSession session = request.getSession();
        User user = session == null ? null : (User) session.getAttribute("auth");

        log.info(session);
        log.info(user);

        // !
        // Supreme permission only
        if (MC.instance.userService.hasPermission(user, RolePermission.SUPREME, true)){
            log.warn("User does not have access to this resource");
            response.sendRedirect("/404");
            return;
        }

        log.info("User has access to this resource");

        try {
            log.info("Getting admin list...");
            List<User> adminList = MC.instance.userService.getAllAdmin(true);
            request.setAttribute("adminList", adminList);

            log.info("Getting total admin...");
            int totalAdmin = MC.instance.userService.getTotalAdmin(false);
            request.setAttribute("totalAdmin", totalAdmin);

            log.info("Ready for admin management page");
        }
        catch (ConnectionException e){
            log.error("Error connecting to the database");
        }

        request.getRequestDispatcher("/views/admin/admin-management.jsp").forward(request,response);
    }

    public void destroy() {
    }
}