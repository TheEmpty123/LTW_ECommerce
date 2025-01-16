package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.util.List;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "InventoryManagerServlet", value = "/admin/inv")
public class InventoryManager extends HttpServlet implements ControllerBase{
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading inventory management page ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (!MC.instance.userService.hasPermission(user, RolePermission.USER_MANAGEMENT, true)) {
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
        request.setAttribute("CMD", "inventory");

        try{
            log.info("Preparing for inventory page");

            var wh = MC.instance.warehouseService.getAllWarehouse();
            request.setAttribute("wh", wh);

            int totalProductItems = MC.instance.warehouseService.totalProductItems();
            int totalInStock = MC.instance.warehouseService.totalInStock();
            int totalOutOfStock = MC.instance.warehouseService.totalOutOfStock();
            request.setAttribute("totalProductItems", totalProductItems);
            request.setAttribute("totalInStock", totalInStock);
            request.setAttribute("totalOutOfStock", totalOutOfStock);

            log.info("Ready for user management page");
        }
        catch (Exception e){
            log.error("Error getting resource");
            e.printStackTrace();
        }

        request.getRequestDispatcher("/views/admin/inventory-management.jsp").forward(request, response);
    }

    public void destroy() {
    }
}