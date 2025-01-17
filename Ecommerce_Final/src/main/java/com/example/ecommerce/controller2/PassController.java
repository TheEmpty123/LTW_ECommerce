package com.example.ecommerce.controller2;

import com.example.ecommerce.Bean.User;
import com.example.ecommerce.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(value = "/changepass")
public class PassController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy ID từ query parameter
        String idParam = req.getParameter("id");
        String email = req.getParameter("email");

        if (idParam == null || idParam.isEmpty() || email == null || email.isEmpty()) {
            resp.getWriter().write("Invalid request. Missing user ID or email.");
            return;
        }

        // Truy vấn người dùng từ email
        User user = userService.findIDUserByEmail(email);
        if (user == null) {
            resp.getWriter().write("No user found with the provided email.");
            return;
        }

        // Nếu ID trong URL khớp với ID trong cơ sở dữ liệu, hiển thị form đổi mật khẩu
        if (user.getId() == Integer.parseInt(idParam)) {
            req.setAttribute("userId", idParam);
            req.getRequestDispatcher("/views/auth/Change-password.jsp").forward(req, resp);
        } else {
            resp.getWriter().write("Invalid user ID.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy thông tin từ form
        String userId = req.getParameter("userId");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (newPassword == null || confirmPassword == null || !newPassword.equals(confirmPassword)) {
            req.setAttribute("error", "Passwords do not match!");
            req.getRequestDispatcher("/views/auth/Change-password   .jsp").forward(req, resp);
            return;
        }

        // Cập nhật mật khẩu
        if (userService.updatePasswordById(Integer.parseInt(userId), newPassword)) {
            resp.getWriter().write("Password updated successfully!");
        } else {
            resp.getWriter().write("Failed to update password.");
        }
    }
}
