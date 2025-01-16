package com.example.ecommerce.controller2.adm;

import java.io.*;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.Common.Enum.StatusUser;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.ConnectionException;

@WebServlet(name = "ProfileManagerServlet", value = "/admin/profile")
public class ProfileManager extends HttpServlet implements ControllerBase {
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading profile page ============");

        HttpSession session = request.getSession();
        User user = session == null ? null : (User) session.getAttribute("auth");

        // Supreme permission only
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
            log.info("Preparing for profile page");

            request.setAttribute("user", user);

            log.info("Ready for profile page");
        } catch (Exception e) {
            log.error("Unknown error occurred while loading permission management page");
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unknown error occurred while loading permission management page, please try again later");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/profile-management.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        log.info("Performing edit profile action");

        HttpSession session = request.getSession();
        User users = session == null ? null : (User) session.getAttribute("auth");
        // Supreme permission only
        if (MC.instance.userService.hasPermission(users, RolePermission.SUPREME, true)) {
            request.setAttribute("role", RolePermission.SUPREME);
        } else if (MC.instance.userService.hasPermission(users, RolePermission.USER_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.USER_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(users, RolePermission.ORDER_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.ORDER_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(users, RolePermission.PRODUCT_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.PRODUCT_MANAGEMENT);
        } else if (MC.instance.userService.hasPermission(users, RolePermission.REPORTS_MANAGEMENT, false)) {
            request.setAttribute("role", RolePermission.REPORTS_MANAGEMENT);
        } else
            request.setAttribute("role", RolePermission.REPORTS_MANAGEMENT);

        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phoneNo = request.getParameter("phone");
        User user = (User) request.getSession().getAttribute("auth");

        if (MC.instance.userService.checkUserExists(username)) {
            request.setAttribute("errorMessage", "Username already exists. Please choose a different one.");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/admin/profile-management.jsp")
                    .forward(request, resp);
            return;
        }

        {
            user.setUsername(username.equals("") ? user.getUsername() : username);
            user.setFullName(fullName.equals("") ? user.getFullName() : fullName);
            user.setEmail(email.equals("") ? user.getEmail() : email);
            user.setPass(password == null || password.equals("") ? "" : password);
            user.setPhoneNum(phoneNo.equals("") ? user.getPhoneNum() : phoneNo);
        }

        boolean success = MC.instance.userService.updateUser(user);

        if (success) {
            log.warn("Updated user successfully");

            request.setAttribute("successMessage", "User has been updated");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/admin/profile-management.jsp")
                    .forward(request, resp);
            return;
        } else {
            log.warn("Updated user failed");

            request.setAttribute("errorMessage", "Some error occurred. Please try again.");
            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/admin/profile-management.jsp")
                    .forward(request, resp);
            return;
        }
    }

    public void destroy() {
    }
}