package com.example.ecommerce.controller2.adm;

import java.io.*;

import com.example.ecommerce.Bean.Role;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.Gender;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.Common.Enum.StatusUser;
import com.example.ecommerce.Common.UserNotFoundException;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns = {"/admin/edit-user", "/admin/add-user"})
public class UserHandler extends HttpServlet implements ControllerBase {
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading add/edit user form ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (MC.instance.userService.hasPermission(user, RolePermission.USER_MANAGEMENT, true)) {
            log.warn("User management not permitted, redirecting to 404 page");
            response.sendRedirect("/404");
            return;
        }

        log.info("User has access to this resource");

        String uri = request.getRequestURI();
        boolean flag = false;

        if (uri.endsWith("add-user")) {
            request.setAttribute("method", "add");
            flag = false;
        } else if (uri.endsWith("edit-user")) {
            request.setAttribute("method", "edit");
            flag = true;
        }

        if (flag) {
            if (MC.instance.savedID == null) {
                if (request.getParameter("id") == null) {
                    response.sendRedirect("/admin/add-user");
                    return;
                }
                Integer id = Integer.parseInt(request.getParameter("id"));
                MC.instance.savedID = id;
                MC.instance.backupID = id;

                log.info("Saved ID: " + id);
                response.sendRedirect("/admin/edit-user");
                return;
            }

            int id = MC.instance.savedID;

            User u = MC.instance.userService.getUserByID(id);

            request.setAttribute("user", u);
            MC.instance.savedID = null;
        }

        log.info("Form is ready");
        request.getRequestDispatcher("/views/admin/add-user.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        log.warn("============ Request to update user received ============");

        String uri = request.getRequestURI();
        boolean flag = false;

        if (uri.endsWith("add-user")) {
            flag = false;
        } else if (uri.endsWith("edit-user")) {
            flag = true;
        }

        try {

            if (flag) {
                log.info("Performing edit user action");
                String username = request.getParameter("username");
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String phoneNo = request.getParameter("phone");
                int roleID = Integer.parseInt(request.getParameter("role"));
                StatusUser status = request.getParameter("status").equalsIgnoreCase("enable") ? StatusUser.ENABLE : StatusUser.DISABLE;
                int id = MC.instance.backupID;
                User user = MC.instance.userService.getUserByID(id);

                if (MC.instance.userService.checkUserExists(username)) {
                    request.setAttribute("errorMessage", "Username already exists. Please choose a different one.");
                    request.setAttribute("user", user);
                    request.setAttribute("method", "edit");
                    request.getRequestDispatcher("/views/admin/add-user.jsp")
                            .forward(request, resp);
                    return;
                }

                {
                    user.setUsername(username.equals("") ? user.getUsername() : username);
                    user.setFullName(fullName.equals("") ? user.getFullName() : fullName);
                    user.setEmail(email.equals("") ? user.getEmail() : email);
                    user.setPass(password.equals("") ? user.getPass() : password);
                    user.setPhoneNum(phoneNo.equals("") ? user.getPhoneNum() : phoneNo);
                    user.setRoleID(roleID);
                    user.setStatusUser(status);
                }

                boolean success = MC.instance.userService.updateUser(user);

                if (success) {
                    log.warn("Updated user successfully");

                    request.setAttribute("successMessage", "User has been updated");
                    request.setAttribute("user", user);
                    request.setAttribute("method", "edit");
                    request.getRequestDispatcher("/views/admin/add-user.jsp")
                            .forward(request, resp);
                    return;
                } else {
                    log.warn("Updated user failed");

                    request.setAttribute("errorMessage", "Some error occurred. Please try again.");
                    request.setAttribute("user", user);
                    request.setAttribute("method", "edit");
                    request.getRequestDispatcher("/views/admin/add-user.jsp")
                            .forward(request, resp);
                    return;
                }
            } else {
                log.info("Performing add user action");

                String username = request.getParameter("username");
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                int roleID = Integer.parseInt(request.getParameter("role"));
                Gender gender = request.getParameter("gender").equals("0") ? Gender.MALE : Gender.FEMALE;

                if (MC.instance.userService.checkUserExists(username)) {
                    request.setAttribute("errorMessage", "Username already exists. Please choose a different one.");
                    request.setAttribute("method", "add");
                    request.getRequestDispatcher("/views/admin/add-user.jsp")
                            .forward(request, resp);
                    return;
                }

                User user = new User(username, fullName, email, password, roleID, gender);

                MC.instance.userService.addUser(user);
            }

        } catch (Exception e) {
            log.error("Unknown error occurred while performing add/edit user action");
            e.printStackTrace();
        }


        resp.sendRedirect("/admin/users");
    }

    public void destroy() {
    }
}