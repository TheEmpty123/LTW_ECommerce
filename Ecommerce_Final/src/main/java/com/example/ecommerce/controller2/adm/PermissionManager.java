package com.example.ecommerce.controller2.adm;

import java.io.*;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "PermissionManagerServlet", value = "/admin/permit")
public class PermissionManager extends HttpServlet implements ControllerBase {
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading permission management page ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (!MC.instance.userService.hasPermission(user, RolePermission.SUPREME, true)) {
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
        request.setAttribute("CMD", "permissions");

        try {
            log.info("Preparing resource");

            var rolesMap = MC.instance.userService.getRolesMap(true);
            request.setAttribute("rolesMap", rolesMap);

            var permissions = MC.instance.permissionService.getAllPermissions(false);
            request.setAttribute("permissions", permissions);

            int totalUsers = MC.instance.userService.getTotalUsers(false);
            request.setAttribute("totalUsers", totalUsers);

            int availableUsers = MC.instance.userService.getTotalAvailableUsers(false);
            request.setAttribute("availableUsers", availableUsers);

            int disabledUsers = totalUsers - availableUsers;
            request.setAttribute("disabledUsers", disabledUsers);

            log.info("Ready for permission management page");
        } catch (Exception e) {
            log.error("Unknown error occurred while loading permission management page");
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unknown error occurred while loading permission management page, please try again later");
        }

        request.getRequestDispatcher("/views/admin/user-management.jsp").forward(request, response);
    }

    public void destroy() {
    }
}