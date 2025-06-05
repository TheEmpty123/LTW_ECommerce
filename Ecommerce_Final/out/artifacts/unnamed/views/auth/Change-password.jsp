<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/13/2024
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thay đổi mật khẩu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/password.css">
</head>
<body>
<div id="container">
    <div class="logo">
        <div class="logobox"></div>
    </div>
    <div id="change-password" class="content">
        <div class="box">
            <div class="title-change-password">
                <h2>Thay đổi mật khẩu</h2>
            </div>
            <div class="change-password">
                <p>Mật khẩu mới</p>
                <input type="text" id="username-r" class = "styled-input">
                <p>Xác nhận lại mật khẩu</p>
                <input type="text" id="password-r" class="styled-input">
            </div>
            <div class="authentic">
                <div class="check-capcha">
                    <input type="checkbox" class="capcha-checkbox">
                    <label  class="register-button">Tôi không phải là người máy</label>
                </div>
                <div class="image-box">
                    <img src="${pageContext.request.contextPath}/public/images/captcha.png" alt="" class="image-capcha">
                </div>
            </div>
            <div class="next submit2">
                <a href="${pageContext.request.contextPath}/views/auth/Notificaiton-success.jsp" class="btn">Xác nhận</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
