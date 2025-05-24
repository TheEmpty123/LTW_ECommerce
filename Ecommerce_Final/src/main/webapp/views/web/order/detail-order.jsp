<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 5/24/2025
  Time: 4:59 PM
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
          href="${pageContext.request.contextPath}/public/css/detail.css?v=${System.currentTimeMillis()}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/public/js/detail.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>

</head>
<body>
<div id="mask">
    <div id="order-detail-box">
        <strong style="font-size: 30px; margin-top: 20px; margin-bottom: 20px">Chi tiết đơn hàng</strong>
        <div id="details">
            <div class="row" id="title-detail">
                <div class="col-3">
                    <strong>Ảnh</strong>
                </div>
                <div class="col-3">
                    <strong>Tên sản phẩm</strong>
                </div>
                <div class="col-3">
                    <strong>Giá (VND)</strong>
                </div>
                <div class="col-3">
                    <strong>Số lượng</strong>
                </div>
            </div>
            <div id="item-details">
                <div class="row">
                    <div class="col-3">
                        <img src="${pageContext.request.contextPath}/public/images/logos/vi.png" alt="Logo">
                    </div>
                    <div class="col-3">
                        <p> Kệ sach</p>
                    </div>
                    <div class="col-3">
                        3.000.000
                    </div>
                    <div class="col-3">
                        2
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

