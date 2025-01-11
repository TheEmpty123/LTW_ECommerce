<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/13/2024
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css/login-register.css">
    <link href="${pageContext.request.contextPath}/public/bootstrap-5.3.3-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="${pageContext.request.contextPath}/public/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .styled-input {
            margin-top: 0;
            margin-bottom: 0;
        }

        .box p {
            margin-top: 0;
        }
    </style>
</head>
<body>
<div id="container">
    <div class="logo">
        <div class="logobox"></div>
    </div>
    <div class="content-register">
        <div class="box register">
            <p style="margin-top: -20px; color: red">
                <% String error = (String) request.getAttribute("error");
                    String uname = request.getParameter("uname");
                    if (error == null) error = "";
                    if (uname == null) uname = "";

                %>
                <%= error  %>
            </p>
            <form method="post" action="/register" style="height: 90%">
                <label for="username-r" style="margin-top: 10px; margin-bottom: 3px">Tên người dùng hoặc địa chỉ email:</label>
                <input type="text" id="username-r" class="styled-input" name="uname" value="<%=uname%>" required>
                <label for="password-r" style="margin-top: 10px; margin-bottom: 3px">Mật khẩu:</label>
                <input type="text" id="password-r" class="styled-input" name="pass" required>
                <label for="password-rr" style="margin-top: 10px; margin-bottom: 3px">Nhập lại mật khẩu:</label>
                <input type="text" id="password-rr" class="styled-input" name="pass" required>
                <%--                <div class="register-button">--%>
                <%--                    <a href="${pageContext.request.contextPath}/views/auth/Success-register.jsp">Đăng ký</a>--%>
                <button type="submit" class="register-button">Đăng ký</button>
                <%--                </div>--%>
            </form>
        </div>
    </div>
    <div class="footer footer-register">
        <div class="footer-left">
            <a href="${pageContext.request.contextPath}/kenes"><i class="bi bi-arrow-left"></i>Đi đến cửa hàng</a>
        </div>
        <div class="footer-right">
            <a href="#">Bạn đã có tài khoản? </a>
            <a href="${pageContext.request.contextPath}/login" style="color: green !important;">Đăng nhập</a>
        </div>
    </div>
</div>
</body>
</html>
