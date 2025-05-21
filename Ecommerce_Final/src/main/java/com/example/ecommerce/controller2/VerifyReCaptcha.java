package com.example.ecommerce.controller2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "Verify", value = "/verify")
public class VerifyReCaptcha extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.sendRedirect("/views/web/order/order-detail.jsp"); // sửa đường dẫn phù hợp
        resp.setHeader("Content-Security-Policy",
                "script-src 'self' https://www.google.com https://www.gstatic.com; " +
                        "frame-src https://www.google.com https://www.gstatic.com; " +
                        "style-src 'self' 'unsafe-inline';");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String gRecaptchaResponse = req.getParameter("g-recaptcha-response");
        boolean isVerified = verifyRecaptcha(gRecaptchaResponse);

        if (isVerified) {
            // Xử lý tiếp theo
            System.out.println("Xác thực thành công ");

        } else {
            resp.getWriter().println("Xác minh thất bại!");
        }
    }

//<%--                site-key: 6Lc4L0ErAAAAAHLirMncOYQv2pUs4wtiPKfd2aKB--%>
//<%--                secret key : 6Lc4L0ErAAAAACs0n5SjHksm6KTNvwgX-QGwMEyf--%>
    public static boolean verifyRecaptcha(String gRecaptchaResponse) throws IOException {
        String secretKey = "6Lc4L0ErAAAAACs0n5SjHksm6KTNvwgX-QGwMEyf"; // lấy từ Google reCAPTCHA dashboard
        String url = "https://www.google.com/recaptcha/api/siteverify";

        String postData = "secret=" + URLEncoder.encode(secretKey, "UTF-8") +
                "&response=" + URLEncoder.encode(gRecaptchaResponse, "UTF-8");

        HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(postData.getBytes(StandardCharsets.UTF_8));
        }

        StringBuilder response = new StringBuilder();
        try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
        }

        return response.toString().contains("\"success\": true");
    }

}
