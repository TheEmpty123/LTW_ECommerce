<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 5/19/2025
  Time: 9:46 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/public/css/order-detail.css?v=${System.currentTimeMillis()}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/public/js/OrderDetail.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

</head>
<body>
<div id="mask">
    <div id="order-detail-box">
        <strong style="font-size: 30px; margin-top: 20px">Xác thực đơn hàng</strong>
        <%--        <div class="authentic">--%>
        <%--            <div class="check-captcha">--%>
        <%--                <input type="checkbox" class="captcha-checkbox">--%>
        <%--                <label class="register-button" style="font-size: 16px">Tôi không phải là người máy</label>--%>
        <%--            </div>--%>
        <%--            <div class="image-box">--%>
        <%--                <img src="${pageContext.request.contextPath}/public/images/captcha.png" alt="" class="image-captcha">--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <form id="form-verify" action="${pageContext.request.contextPath}/verify" method="post" class="signature-area">
<%--            <div class="signature-area">--%>
                <div class="hash-code">
                    <p style="display: inline; padding-right: 10px">Mã hash: </p>
                    <p id="hash-code">0x034g35h3i352bjfsux2425325</p>
                    <button style="width: 25px; height: 25px; padding: 1px; border: none" onclick="copyText()">
                        <i class="bi bi-copy"></i>
                    </button>
                </div>
                <div class="signature-box">
                    <div class="row">
                        <div class="col-3">
                            <p>Public key: </p>
                        </div>
                        <div class="col-9">
                            <input id="public-key-input" name="public-key-input" type="text">
                        </div>
                        <div class="col-3">
                            <p>Signature: </p>
                        </div>
                        <div class="col-9">
                            <input id="signature-input" name="signature-input" type="text">
                        </div>
                    </div>
                </div>
                <p>Tải tool<a href="#"> tại đây</a> và dùng mã hash bên trên để phát sinh public key và signature.</p>
                <!-- Các input khác -->
                <div class="g-recaptcha" data-sitekey="6Lc4L0ErAAAAAHLirMncOYQv2pUs4wtiPKfd2aKB"></div>
                <div class="submit-div">
                    <button type="submit" id="submit-order">Xác thực</button>
                </div>
<%--            </div>--%>
        </form>
    </div>
</div>
</body>
</html>
