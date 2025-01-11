<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/13/2024
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng ký thành công</title>
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
            <div class="title-change-password">
                <h2>Đã đăng ký</h2>
                <p>Bạn đã đăng ký tài khoản thành công. Hãy đăng nhập để khám phá cửa hàng của chúng tôi nào.</p>
            </div>
            <div class="next submit2">
                <a href="${pageContext.request.contextPath}Login.jsp" class="btn">Đăng nhập</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
