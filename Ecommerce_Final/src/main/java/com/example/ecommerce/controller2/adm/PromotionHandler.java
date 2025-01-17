package com.example.ecommerce.controller2.adm;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.example.ecommerce.Bean.Order;
import com.example.ecommerce.Bean.Promotion;
import com.example.ecommerce.Bean.User;
import com.example.ecommerce.Common.Enum.DiscountType;
import com.example.ecommerce.Common.Enum.PromotionStatus;
import com.example.ecommerce.Common.Enum.RolePermission;
import com.example.ecommerce.Dto.OrderDto;
import com.example.ecommerce.controller2.MC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(urlPatterns = {"/admin/edit-discount", "/admin/add-discount"})
public class PromotionHandler extends HttpServlet implements ControllerBase {
    public void init() {
        initialize();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        initialize();
        log.warn("============ Loading promotion modifier page ============");

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
        request.setAttribute("CMD", "order");


        request.getRequestDispatcher("/views/admin/add-discount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code = req.getParameter("code");
        String type = req.getParameter("type");
        String limits = req.getParameter("limits");
        String value = req.getParameter("value");
        String start = req.getParameter("trip-start");
        String end = req.getParameter("trip-end");

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime startD = LocalDateTime
                .parse(start + "T00:00:00", DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        LocalDateTime endD = LocalDateTime
                .parse(end + "T00:00:00", DateTimeFormatter.ISO_LOCAL_DATE_TIME);

        DiscountType dt;
        if (type.equals("percentage")){
            dt = DiscountType.PERCENTAGE;
        }
        else
            dt = DiscountType.FIX_VALUE;

        Promotion promotion = new Promotion(0, code, dt, Integer.parseInt(limits), Double.parseDouble(value), PromotionStatus.AVAILABLE, startD, endD);
        if(MC.instance.promotionService.createPromotion(promotion)){
            resp.sendRedirect("/admin/discount");
        }
        else {
            resp.sendRedirect("/admin/add-discount");
        }
    }

    public void destroy() {
    }
}