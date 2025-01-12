<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/13/2024
  Time: 1:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/profile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/bootstrap-5.3.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/public/js/Cart.js"></script>
    <title>Tài khoản của tôi</title>
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
        <c:forEach items="${sessionScope.cart.list}" var="cp">
            <div class="list-product-cart">
                <div class="row">
                    <div class="col-md-12 col-12 order">
                        <div class="image center-items">
                            <img src="${cp.img}" alt="">
                        </div>
                        <div class="detail-order center-items" style="justify-content: left;">
                            <div>
                                <h6>${cp.name}</h6>
                                <span>${cp.quantity}</span> x <span>${cp.price}</span>
                            </div>
                        </div>
                        <div class="close-orders center-items">
                            <a href="del-cart?pid=${cp.id}" class="remove-from-cart" data-pid="${cp.id}">
                                <button class="close-btn">
                                    <i class="bi bi-x-circle"></i>
                                </button>
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div id="pay-pal">
            <div class="total-price">
                <div class="money-text">
                    <p>Thành tiền: </p>
                </div>
                <div class="money-number total-cart">
                    <p>${sessionScope.cart.total}</p>
                </div>
            </div>
            <div class="watch-cart center-items">
                <a href="${pageContext.request.contextPath}/showCart">XEM GIỎ HÀNG</a>
            </div>
            <div class="check-out center-items">
                <a href="${pageContext.request.contextPath}/views/web/order/order.jsp">THANH TOÁN</a>
            </div>
        </div>
    </div>
</div>
<%-- HEADER --%>
<div class="container-hd">
    <header>
        <div class="header-top-hd">
            <div class="language-switcher-hd">
                <a href="#">EN</a> | <a href="#"><strong>VN</strong></a>
            </div>
            <div class="contact-info-hd">
                <div class="phone-hd">
                    <a class="fas fa-regular fa-phone"></a>
                </div>
                <a href="${pageContext.request.contextPath}contact.jsp">0906 904 114</a>
                <div class="about-hd">
                    <a href="${pageContext.request.contextPath}about.jsp">Giới thiệu</a>
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
<%--    create mobile menu--%>
        <div id="background-trans" hidden class="mfp-bg mfp-ready"></div>
        <div class="header-bottom-hd">
            <div class="logo-hd">
                <a href="${pageContext.request.contextPath}/views/web/common/home.jsp">
                    <img src="${pageContext.request.contextPath}/public/images/logos/logo3.png" alt="Logo">
                </a>
            </div>
            <nav class="main-nav">
                <a style="color: black; border: none;" class="btn dropdown-toggle"
                   href="${pageContext.request.contextPath}/list-product">SẢN PHẨM</a>
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
            <div class="search-bar-hd">
                <input type="text" placeholder="Tìm sản phẩm">
                <button><i class="fa-solid fa-magnifying-glass"></i></button>
            </div>
        </div>
    </header>
</div>
<%-- HEADER --%>
<div id="container">
    <div id="content">
        <!-- Thanh menu -->
        <div id="menu">
            <div class="title">
                <h5 style="margin: 5px 0;">Tài khoản cá nhân</h5>
            </div>
            <div class="sub-menu">
                <h6 id="sub-menu-info" class="text-menu clicked">Thông tin của tôi</h6>
                <h6 id="sub-menu-order" class="text-menu">Đơn hàng</h6>
                <!-- <h6 id="sub-menu-product-viewed" class="text-menu">Sản phẩm vừa xem</h6> -->
                <h6 id="sub-menu-wish-list" class="text-menu">Danh sách ưa thích</h6>
                <h6 id="sub-menu-logout" class="text-menu">Đăng xuất</h6>

            </div>
        </div>
<%--    Chứa các thông tin của người dùng--%>
        <div id="sub-content">
            <div id="information" class="show">
                <div class="row" style="height: 170px;">
                    <div class="col-md-6 flex-column">
                        <label class="pb-10">Họ: <abbr class="p-red">*</abbr></label>
                        <input type="text" class="input-text">
                    </div>
                    <div class="col-md-6 flex-column">
                        <label class="pb-10">Tên: <abbr class="p-red">*</abbr></label>
                        <input type="text" class="input-text">
                    </div>
                    <div class="col-md-12 flex-column">
                        <label  class="pb-10">Tên hiển thị: </label>
                        <input type="text" class="input-text" value="${sessionScope.auth.username}">
                    </div>
                </div>
                <div class="row" style="height: 140px;">
                    <div class="col-md-12 flex-column">
                        <label class="pt-10">Tên này sẽ được hiển thị ở phần tài khoản và bình luận</label>
                    </div>
                    <div class="col-md-12 flex-column">
                        <label class="pb-10">Địa chỉ email: <abbr class="p-red">*</abbr> </label>
                        <input type="text" class="input-text" value="${sessionScope.auth.email}">
                    </div>
                </div>
                <div class="row" style="height: 360px;">
                    <div class="col-md-12">
                        <h5>Thay đổi mật khẩu</h5>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-12 flex-column">
                            <label  class="pb-10">Mật khẩu hiện tại (để trống nếu không có thay đổi)</label>
                            <input type="text" class="input-text">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-12 flex-column">
                            <label  class="pb-10">Mật khẩu mới (để trống nếu không có thay đổi) </label>
                            <input type="text" class="input-text">
                        </div>
                    </div>
                    <div class="col-md-12 flex-column">
                        <label  class="pb-10">Xác nhận mật khẩu mới </label>
                        <input type="text" class="input-text">
                    </div>
                    <div class="col-sm-3 col-md-3 flex-column">
                        <button class="b-w-b p-2-1">Lưu thay đổi</button>
                    </div>
                </div>

                <div class="row" style="height: 600px;">
                    <div class="col-md-12 flex-column">
                        <label class="pb-10">Địa chỉ: <abbr class="p-red">*</abbr></label>
                        <input type="text" class="input-text" placeholder="Địa chỉ" value="${address.fullAddress}">
                    </div>
                    <div class="col-md-12 flex-column">
                        <label class="pb-10">Quận / Huyện: <abbr class="p-red">*</abbr> </label>
                        <input type="text" class="input-text" placeholder="Quận / Huyện" value="${address.street}">
                    </div>
                    <div class="col-md-12 flex-column">
                        <label class="pb-10">Tỉnh / Thành phố: <abbr class="p-red">*</abbr></label>
                        <input type="text" class="input-text" placeholder="Tỉnh / Thành phố" value="${address.princible}">
                    </div>
                    <div class="col-md-12 flex-column">
                        <label class="pb-10">Số điện thoại <abbr class="p-red">*</abbr></label>
                        <input type="text" class="input-text" value="${sessionScope.auth.phoneNum}">
                    </div>
                    <div class="col-md-12 flex-column">
                        <label lass="pb-10">Địa chỉ email: <abbr class="p-red">*</abbr> </label>
                        <input type="text" class="input-text" value="${sessionScope.auth.email}">
                    </div>
                    <div class="col-sm-3 col-md-3 flex-column">
                        <button class="b-w-b p-2-1">Cập nhật</button>
                    </div>
                </div>
            </div>
            <div id="order" class="hidden">
                <div class="box">
                    <h3>Đơn hàng của tôi</h3>
                    <div class="nav-order">
                        <div class="nav-box fchild">Tất cả đơn hàng</div>
                        <div class="nav-box">Đang xử lí</div>
                        <div class="nav-box">Đang giao</div>
                        <div class="nav-box">Đã hoàn thành</div>
                        <div class="nav-box">Trả lại</div>
                    </div>
                </div>
            </div>
            <div id="wish-list" class="hidden">
                <div class="box">
                    <h3>Danh sách yêu thích</h3>
                </div>
            </div>
            <div id="log-out" class="hidden">
                <div class="box-logout">
                    <div class="content-logout">
                        <div class="check-out-image">
                            <!-- <img src="../../../../public/images/check-out.png" alt=""> -->
                        </div>
                        <h5>Bạn chắc chắn muốn đăng xuất?</h5>
                        <div class="buttons-box">
                            <a href="${pageContext.request.contextPath}/logout">
                                <button class="btns">Đăng xuất</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%--        <!-- Phần chứa các sản phẩm ưu thích của người dùng và những sản phẩm người dùng vừa xem trong thời gian cụ thể -->--%>
        <div id="reminds-products">
            <div class="wish-list">
                <div class="wish-list-title margin-lr-20">
                    <h5>Danh sách yêu thích</h5>
                </div>
            </div>
            <div class="product-viewed">
                <div class="wish-list-viewed margin-lr-20">
                    <h5>Sản phẩm vừa xem</h5>
                </div>
                <div class="list-products">
                    <div class="row">
                        <div class="col-sm-3 col-md-4 product-item">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/public/images/all-products/1.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-sm-3 col-md-4 product-item">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/public/images/all-products/77.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-sm-3 col-md-4 product-item">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/public/images/all-products/44.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-sm-3 col-md-4 product-item">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/public/images/all-products/33.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-sm-3 col-md-4 product-item">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/public/images/all-products/55.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-sm-3 col-md-4 product-item">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/public/images/all-products/134.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-sm-3 col-md-4 product-item">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/public/images/all-products/100.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-sm-3 col-md-4 product-item">
                            <a href="">
                                <img src="${pageContext.request.contextPath}/public/images/all-products/13.jpg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<%--<!-- <iframe src="../common/footer.jsp" frameborder="0" id="footer"></iframe> -->--%>
<footer class="footer">
    <div class="footer-container">
<%--        <!-- Left Column -->--%>
        <div class="footer-column">
            <h3>KẾT NỐI VỚI KANE'S</h3>
            <img src="${pageContext.request.contextPath}/public/images/logos/logo3.png" alt=" Logo" class="footer-logo">
            <p>FOLLOW US</p>
            <p>Instagram – Youtube – Facebook</p>
            <button class="footer-button">HỆ THỐNG CỬA HÀNG</button>
        </div>

        <!-- Second Column -->
        <div class="footer-column">
            <h3 style="justify-content: center;">KANE'S</h3>
            <ul>
                <li><a href="#">Giới thiệu</a></li>
                <li><a href="#">Chuyện KANE'S</a></li>
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
            <p>Email: kanescare@akacompany.com.vn</p>
            <p>Hotline: 18007200</p>
            <div class="newsletter">
                <input type="email" placeholder="Nhập email của bạn">
                <button class="subscribe-button">ĐĂNG KÝ</button>
            </div>
        </div>
    </div>

</footer>
<script src="${pageContext.request.contextPath}/public/js/curtainmenu.js"></script>
<script src="${pageContext.request.contextPath}/public/js/popup.js"></script>
<script src="${pageContext.request.contextPath}/public/js/submenu.js"></script>
</body>
</html>
