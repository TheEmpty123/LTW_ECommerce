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
    <title>Quên mật khẩu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}public/css/password.css">
</head>
<body>
<div id="container">
    <div class="logo">
        <div class="logobox">
        </div>
    </div>
    <div class="content">
        <div class="box">
            <div class="title-fotgot-password">
                <h2>Quên mật khẩu</h2>
                <p>Điền email gắn với tài khoản của bạn để nhận đường dẫn thay đổi mật khẩu.</p>
            </div>
            <div class="input-email">
                <p>Email : </p>
                <input type="text" id="username-l" class = "styled-input">
            </div>

            <div class="btns">
                <div class="next">
                    <a href="${pageContext.request.contextPath}Notification-password.jsp" class="btn">Tiếp tục</a>
                </div>
                <div class="comeback">
                    <a href="${pageContext.request.contextPath}Login.jsp" class="btn">Quay lại đăng nhập</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
