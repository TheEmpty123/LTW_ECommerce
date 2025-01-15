package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.Payment;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "PaymentManagerServlet", value = "/admin/payment")
public class PaymentManager extends HttpServlet implements ControllerBase{
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading payments management page ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (MC.instance.userService.hasPermission(user, RolePermission.ORDER_MANAGEMENT, true)) {
            log.warn("User management not permitted, redirecting to 404 page");
            response.sendRedirect("/404");
            return;
        }

        log.info("User has access to this resource");
        request.setAttribute("CMD", "payment");

        try{
            log.info("Preparing for payment page");

            var payments = MC.instance.orderService.getAllOrderDto();
            request.setAttribute("payments", payments);

            int total = payments.size();
            request.setAttribute("total", total);

            log.info("Ready for payment page");
        }
        catch(Exception e){
            log.error("Unknown error occurred while loading permission management page");
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unknown error occurred while loading permission management page, please try again later");
        }

        request.getRequestDispatcher("/views/admin/product-management.jsp").forward(request, response);
    }

    public void destroy() {
    }
}