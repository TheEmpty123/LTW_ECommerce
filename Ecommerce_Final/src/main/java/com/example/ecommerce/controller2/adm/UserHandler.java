package com.example.ecommerce.controller2.adm;

import java.io.*;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns = {"/admin/edit-user","/admin/add-user"})
public class UserHandler extends HttpServlet implements ControllerBase{
    public void init() {initialize();}

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        log.info("Loading add/edit user form");

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

        if(uri.endsWith("add-user")) {
            request.setAttribute("method", "add");
            flag = false;
        }
        else if(uri.endsWith("edit-user")) {
            request.setAttribute("method", "edit");
            flag = true;
        }

        if (flag){
            if (MC.instance.savedID == null){
                if (request.getParameter("id") == null) {
                    response.sendRedirect("/admin/add-user");
                    return;
                }
                Integer id = Integer.parseInt(request.getParameter("id"));
                MC.instance.savedID = id;

                log.info("Saved ID: " + id);
                response.sendRedirect("/admin/edit-user");
                return;
            }

            User u = MC.instance.userService.getUserByID(MC.instance.savedID);
            request.setAttribute("user", u);

            MC.instance.savedID = null;
        }

        request.getRequestDispatcher("/views/admin/add-user.jsp")
                .forward(request, response);
    }

    public void destroy() {
    }
}