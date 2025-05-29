<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 5/27/2025
  Time: 4:19 PM
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
    <script src="${pageContext.request.contextPath}/public/js/updatePublicKey.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

    <style>
        .tooltip-container {
            position: relative;
            display: inline-block;
        }
        .tooltip-text {
            visibility: hidden;
            background-color: black;
            color: #fff;
            text-align: center;
            padding: 5px 10px;
            border-radius: 5px;

            position: absolute;
            bottom: 125%; /* Vị trí tooltip */
            left: 50%;
            transform: translateX(-50%);
            z-index: 1;
            white-space: nowrap;
        }
        .show-tooltip {
            visibility: visible;
        }
    </style>
</head>
<body>
<div id="mask">
    <div id="order-detail-box">
        <div id="title-pop-up">
            <strong style="font-size: 30px; margin-bottom: 20px">Cập nhật Public key</strong>
            <i class="bi bi-x-circle" id="close-pop-up"  onclick="cancelUpdate()"></i>
        </div>
        <div id="update-public_key" class="signature-area">
            <div class="signature-box" style="margin: 20px 0">
                <div class="row">
                    <div class="col-3">
                        <p>Public key: </p>
                    </div>
                    <div class="col-9 tooltip-container ">
                        <input id="public-key-input" name="signature-input" type="text">
                        <span id="tooltipText" class="tooltip-text">Vui lòng nhập public key!</span>
                    </div>
                </div>
            </div>
            <div class="submit-div">
                <button type="button" id="cancel-btn" class="cancel" onclick="cancelUpdate()">Hủy</button>
                <button type="button" id="submit-order" onclick="updatePublicKey()">Xác nhận</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>

