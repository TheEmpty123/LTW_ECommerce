<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/11/2024
  Time: 5:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng nhập</title>
  <link rel="stylesheet" type="text/css" href="../../login-register.css">
</head>
<body>
<div id="container">
  <div class="logo">
    <div class="logobox">
    </div>
  </div>
  <div class="content">
    <div class="box">
      <p>Tên người dùng hoặc địa chỉ email:</p>
      <input type="text" id="username-l" class = "styled-input">
      <p>Mật khẩu:</p>
      <input type="text" id="password-l" class="styled-input">
      <div class="rememberBox">
        <input type="checkbox" id="remember" name="remember">
        <label for="remember">Ghi nhớ tôi</label>
      </div>
      <label class="loginButton"><a href="../common/home.html" style="color: white !important;">Đăng nhập</a></label>
    </div>
  </div>
  <div class="footer">
    <div class="subfooter">
      <div class="row">
        <div class="col-md-6 mb-10"><a href="forgot-password.html">Quên mật khẩu?</a></div>
        <div class="col-md-6 mb-10"> <span style="color: black;">Bạn chưa có tài khoản? <a href="../auth/register.html" style="color: green !important;">Đăng ký</a></span></div>
        <div class="col-md-6 mb-10"><a href="../common/home.html"><i class="bi bi-arrow-left"></i>Đi đến cửa hàng</a> </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
