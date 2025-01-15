package com.example.ecommerce.controller2.adm;

import java.io.*;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "DiscountManagerServlet", value = "/admin/discount")
public class DiscountManager extends HttpServlet implements ControllerBase {
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading discount management page ============");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (MC.instance.userService.hasPermission(user, RolePermission.USER_MANAGEMENT, true)) {
            log.warn("User management not permitted, redirecting to 404 page");
            response.sendRedirect("/404");
            return;
        }

        log.info("User has access to this resource");
        request.setAttribute("CMD", "discount");

        try {
            log.info("Preparing for orders management page");

            var discounts = MC.instance.promotionService.getAllPromotion(true);
            request.setAttribute("discounts", discounts);

            int total = discounts.size();
            request.setAttribute("total", total);

            int available = 0;
            for (var discount : discounts) {
                if (discount.getStatusOfPro().equals("available")) {
                    available++;
                }
            }
            request.setAttribute("available", available);

            int expired = discounts.size() - available;
            request.setAttribute("expired", expired);

            log.info("Ready for orders management page");
        }
        catch (Exception e) {
            log.error("Unknown error occurred while loading permission management page");
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unknown error occurred while loading permission management page, please try again later");
        }

        request.getRequestDispatcher("/views/admin/product-management.jsp").forward(request, response);
    }

    public void destroy() {
    }
}