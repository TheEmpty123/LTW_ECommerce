    <%--
      Created by IntelliJ IDEA.
      User: dttan
      Date: 12/11/2024
      Time: 5:55 PM
      To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/login-register.css">
        <link href="..\..\..\..\public\bootstrap-5.3.3-dist\css\bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <script src="..\..\..\..\public\bootstrap-5.3.3-dist\js/bootstrap.bundle.min.js"></script></head>
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
    <%--            <label for="login" class="loginButton"><a href="../common/home.html" style="color: white !important;">Đăng nhập</a></label>--%>
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
