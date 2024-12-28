<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/11/2024
  Time: 5:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/login-register.css">
</head>
<body>
<div id="container">
    <div class="logo">
        <div class="logobox">
        </div>
    </div>
    <div class="content">
        <p>
            <% String error = (String) request.getAttribute("error");
                String uname = request.getParameter("uname");
                if (error == null) error = "";
                if (uname == null) uname = "";
            %>
            <%= error  %>
        </p>

        <div class="box" style="height: 70%">
            <form method="post" action="login" style="height: 90%">
                <label for="username-l" style="margin-top: 10px">Tên người dùng hoặc địa chỉ email:</label>
                <input type="text" id="username-l" class="styled-input" style="width: 92%; padding: 5px; margin-top: 10px; margin-bottom: 30px">
                <label for="password-l" style="margin-top: 10px">Mật khẩu:</label>
                <input type="text" id="password-l" class="styled-input" style="width: 92%; padding: 5px; margin-top: 10px; margin-bottom: 30px">
                <div class="rememberBox">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Ghi nhớ tôi</label>
                </div>
                <label class="loginButton" style="align-content: center"><a href="${pageContext.request.contextPath}common/home.html"
                                              style="color: white !important">Đăng nhập</a></label>
            </form>
        </div>

    </div>
    <div class="footer">
        <div class="subfooter">
            <div class="row">
                <div class="col-md-6 mb-10"><a href="${pageContext.request.contextPath}forgot-password.html">Quên mật
                    khẩu?</a></div>
                <div class="col-md-6 mb-10"><span style="color: black;">Bạn chưa có tài khoản? <a
                        href="${pageContext.request.contextPath}auth/register.html" style="color: green !important;">Đăng ký</a></span>
                </div>
                <div class="col-md-6 mb-10"><a href="${pageContext.request.contextPath}common/home.html"><i
                        class="bi bi-arrow-left"></i>Đi đến cửa hàng</a></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
