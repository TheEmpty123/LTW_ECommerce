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
        log.warn("============ Loading admin management page ============");

        HttpSession session = request.getSession();
        User user = session == null ? null : (User) session.getAttribute("auth");

        // !
        // Supreme permission only
        if (!MC.instance.userService.hasPermission(user, RolePermission.SUPREME, true)){
            log.warn("User management not permitted, redirecting to 404 page");
            response.sendRedirect("/404");
            return;
        }

        log.info("User has access to this resource");
        if (MC.instance.userService.hasPermission(user, RolePermission.SUPREME, true)) {
            request.setAttribute("role", RolePermission.SUPREME);
        } else if (MC.instance.userService.hasPermission(user, RolePermission.USER_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.USER_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(user, RolePermission.ORDER_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.ORDER_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(user, RolePermission.PRODUCT_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.PRODUCT_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(user, RolePermission.REPORTS_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.REPORTS_MANAGEMENT);
        } else
            request.setAttribute("role", RolePermission.REPORTS_MANAGEMENT);

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