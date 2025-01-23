<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/13/2024
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đặt lại mật khẩu thành công</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/password.css">
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
                <h2>Thay đổi mật khẩu</h2>
                <p>Bạn đã đặt lại mật khẩu thành công. Hãy tiếp tục quá trình đăng nhập.</p>
            </div>
            <div class="next submit2">
                <a href="${pageContext.request.contextPath}/login" class="btn">Đăng nhập</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
