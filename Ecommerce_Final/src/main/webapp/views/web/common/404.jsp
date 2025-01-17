<%--
  Created by IntelliJ IDEA.
  User: dttan
  Date: 12/18/2024
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404</title>
    <link rel="stylesheet" href="../../../public/css/header.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../../public/css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body>
<div id="mask-container">
    <div id="mask-cart">
    </div>
    <div id="content-cart">
        <div class="exit-box center-items">
            <h5>Giỏ hàng</h5>
            <i class="bi bi-x-square" id="close-pop-up"></i>
            <div class="block"></div>
        </div>

        <div id="list-product-cart" class="scroll-cart">
            <c:forEach items="${sessionScope.cart.list}" var="cp">
                <div class="row">
                    <div class="col-md-12 col-12 order">
                        <div class="image center-items">
                            <img src="${cp.img}" alt="">
                        </div>
                        <div class="detail-order center-items" style="justify-content: left;">
                            <div>
                                <h6>${cp.name}</h6>
                                <span>${cp.quantity}</span> x <span><f:formatNumber type="currency" currencySymbol="đ"
                                                                                    value="${cp.price}"/></span>
                            </div>
                        </div>
                        <div class="close-orders center-items">
                            <button class="remove-item" data-id="${cp.id}">
                                <i class="bi bi-x-circle"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div id="pay-pal" class="cart-actions">
            <div class="total-price">
                <div class="money-text">
                    <p>Thành tiền: </p>
                </div>
                <div class="money-number">
                    <p class="total-cart"><f:formatNumber type="currency" currencySymbol="đ"
                                                          value="${sessionScope.cart.total}"/></p>
                </div>
            </div>
            <div class="watch-cart center-items">
                <button style="border-color: #0b0b0b;background: #0b0b0b" type="submit"><a
                        href="${pageContext.request.contextPath}/CartController">XEM GIỎ HÀNG</a>
                </button>
            </div>
            <div class="check-out center-items">
                <button style="border-color: white;background: white"
                        href="${pageContext.request.contextPath}/order" type="submit">THANH TOÁN
                </button>
            </div>

        </div>
    </div>
</div>

<!-- HEader-->
<div class="container-hd">
    <header>
        <div class="header-top-hd">
            <div class="language-switcher-hd">
                <a href="#">EN</a> | <a href="#"><Strong>VN</Strong></a>
            </div>
            <div class="contact-info-hd">
                <div class="phone-hd">
                    <a class="fas fa-regular fa-phone"></a>
                </div>

                <a href="">0906 904 114</a>
                <div class="about-hd">
                    <a href="">Giới thiệu</a>
                    <a href="#">Khuyến mãi </a>
                </div>
            </div>

            <div class="header-icons-hd">
                <a href="#" class="fas fa-map-marker-alt"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-shopping-cart" onclick="showCart()"></a>
                <a href="#" class="fas fa-light fa-user"></a>
                <h4 style="font-weight: lighter; margin-left: -15px; font-size: large; margin-top: 10px;">
                    <c:if test="${sessionScope.auth != null}">
                        <a href="${pageContext.request.contextPath}/profile">
                                ${sessionScope.auth.username}
                        </a>
                    </c:if>
                    <c:if test="${sessionScope.auth == null}">
                        <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                    </c:if>
                </h4>
            </div>
        </div>
        <!-- create mobile menu -->
        <div id="background-trans" hidden class="mfp-bg mfp-ready"></div>
        <div class="header-bottom-hd">

            <div class="logo-hd">
                <a href="${pageContext.request.contextPath}/kenes">
                    <img src="${pageContext.request.contextPath}/public/images/logos/logo3.png"
                         alt="Logo">
                </a>
            </div>
            <nav class="main-nav">
                <a style="color: black; border: none;"
                   class="btn dropdown-toggle" href="${pageContext.request.contextPath}/list-product">SẢN PHẨM</a>

                <ul class="dropdown-menu">
                    <div class="row" id="row-873750177">
                        <c:forEach var="cates" items="${mapCate}">
                            <div class="col medium-2 small-6 large-2">
                                <div class="col-inner">
                                    <div class="ux-menu stack stack-col justify-start">
                                            <%--cates.value là danh sách các danh mục trong map--%>
                                        <c:forEach var="c" items="${cates.value}">
                                            <div class="ux-menu-link flex menu-item">
                                                <a class="ux-menu-link__link flex" href="products?cateID=${c.id}">
                                                <span class="ux-menu-link__text">
                                                        ${c.cateName} </span>
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </ul>
                <a style="margin-top: 5px;" href="#">PHÒNG</a>
                <a style="margin-top: 5px;" href="#">BỘ SƯU TẬP</a>

            </nav>

            <form action="/search" method="get">
                <div class="search-bar-hd">
                    <input id="search-input" name="search-input" type="text" placeholder="Tìm sản phẩm">
                    <button type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
            <script>
                function getValue() {
                    const searchInput = document.getElementById("search-input");
                    const inputValue = searchInput.value;
                    console.log("Giá trị tìm kiếm:", inputValue);
                }
            </script>
        </div>
    </header>
</div>

<!-- End header -->

<section class="error-404" style="height:500px;">
    <div class="row">
        <div class="col-3"><span class="header-font"
                                 style="font-size: 6em; font-weight: bold; opacity: .3; padding-left: 25%;">404</span>
        </div>
        <div class="col-9">
            <h1>Rất tiếc! Trang thì không tồn tại.</h1>
        </div>
    </div>
</section>

<footer class="footer">
    <div class="footer-container">
        <!-- Left Column -->
        <div class="footer-column">
            <h3>KẾT NỐI VỚI KANE'S</h3>
            <img src="../../../public/images/logos/logo3.png" alt=" Logo" class="footer-logo">
            <p>FOLLOW US</p>
            <p>Instagram – Youtube – Facebook</p>
            <button class="footer-button">HỆ THỐNG CỬA HÀNG</button>
        </div>

        <!-- Second Column -->
        <div class="footer-column">
            <h3>KANE'S</h3>
            <ul>
                <li><a href="../../about.jsp">Giới thiệu</a></li>
                <li><a href="#">Chuyện Kannes</a></li>
                <li><a href="#">Tổng công ty</a></li>
                <li><a href="#">Tuyển dụng</a></li>
                <li><a href="#">Thẻ hội viên</a></li>
                <li><a href="#">Đổi trả hàng</a></li>
            </ul>
        </div>

        <!-- Third Column -->
        <div class="footer-column">
            <h3>CẢM HỨNG</h3>
            <ul>
                <li><a href="#">Sản phẩm</a></li>
                <li><a href="#">Ý tưởng và cảm hứng</a></li>
            </ul>
        </div>

        <!-- Fourth Column -->
        <div class="footer-column">
            <h3>NEWSLETTER</h3>
            <p>Hãy để lại email của bạn để nhận được những ý tưởng trang trí mới và thông tin ưu đãi từ KANE'S</p>
            <p>Email: kannes@akacompany.com.vn</p>
            <p>Hotline: 18007200</p>
            <div class="newsletter">
                <input type="email" placeholder="Nhập email của bạn">
                <button class="subscribe-button">ĐĂNG KÝ</button>
            </div>
        </div>
    </div>

</footer>

<script src="../../../public/js/curtainmenu.js"></script>
<script src="../../../public/js/popup.js"></script>
</body>
</html>
