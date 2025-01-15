package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.util.List;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "UserManagerServlet", value = "/admin/users")
public class UserManager extends HttpServlet implements ControllerBase {

    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading user management page ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (MC.instance.userService.hasPermission(user, RolePermission.USER_MANAGEMENT, true)) {
            log.warn("User management not permitted, redirecting to 404 page");
            response.sendRedirect("/404");
            return;
        }

        log.info("User has access to this resource");
        request.setAttribute("CMD", "users");

        try{
            log.info("Getting user list...");
            List<User> allUserList = MC.instance.userService.getAllUser(true);
            request.setAttribute("users", allUserList);

            var roles = MC.instance.userService.getRolesMap(false);
            request.setAttribute("roles", roles);

            int totalUserWithModerator = MC.instance.userService.getTotalUsersWithModerator(false, RolePermission.USER_MANAGEMENT);
            request.setAttribute("totalUserWithModerator", totalUserWithModerator);

            int totalUsers = allUserList.size();
            request.setAttribute("totalUsers", totalUsers);

            int availableUsers = MC.instance.userService.getTotalAvailableUsers(false);
            request.setAttribute("availableUsers", availableUsers);

            int disabledUsers = allUserList.size() - availableUsers;
            request.setAttribute("disabledUsers", disabledUsers);

            int totalWarehouse = MC.instance.warehouseService.getTotalWarehouse(false);
            request.setAttribute("agencies", totalWarehouse);

            log.info("Ready for user management page");
        }
        catch (Exception e){
            log.error("Error getting resource");
            e.printStackTrace();
        }

        request.getRequestDispatcher("/views/admin/user-management.jsp").forward(request, response);
    }

    public void destroy() {
    }
}