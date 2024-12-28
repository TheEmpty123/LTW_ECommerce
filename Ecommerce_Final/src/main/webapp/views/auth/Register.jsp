<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/13/2024
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css/login-register.css">
    <link href="${pageContext.request.contextPath}\public\bootstrap-5.3.3-dist\css\bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="${pageContext.request.contextPath}\public\bootstrap-5.3.3-dist\js\bootstrap.bundle.min.js"></script>
</head>
<body>
<div id="container">
    <div class="logo">
        <div class="logobox"></div>
    </div>
    <div class="content-register">
        <div class="box register">
            <p>Tên người dùng hoặc địa chỉ email:</p>
            <input type="text" id="username-r" class = "styled-input">
            <p>Mật khẩu:</p>
            <input type="text" id="password-r" class="styled-input">
            <p>Nhập lại mật khẩu:</p>
            <input type="text" class="styled-input">
            <div for="login" class="register-button">
                <a href="${pageContext.request.contextPath}auth/success-register.jsp">Đăng ký</a>
            </div>
        </div>
    </div>
    <div class="footer footer-register">
        <div class="footer-left">
            <a href="${pageContext.request.contextPath}common/home.jsp"><i class="bi bi-arrow-left"></i>Đi đến cửa hàng</a>
        </div>
        <div class="footer-right">
            <a href="#">Bạn đã có tài khoản? </a>
            <a href="${pageContext.request.contextPath}login.jsp" style="color: green !important;">Đăng nhập</a>
        </div>
    </div>
</div>
</body>
</html>
