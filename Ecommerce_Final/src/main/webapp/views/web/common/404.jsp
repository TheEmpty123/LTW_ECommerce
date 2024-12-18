<%--
  Created by IntelliJ IDEA.
  User: dttan
  Date: 12/18/2024
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
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
        <div class="list-product-cart">
            <div class="row">
                <div class="col-md-12 col-12 order">
                    <div class="image center-items">
                        <img src="../../../public/images/all-products/53.jpg" alt="">
                    </div>
                    <div class="detail-order center-items" style="justify-content: left;">
                        <div>
                            <h6>Armchair mây mới</h6>
                            <span>1</span> x <span>13,900,000đ</span>
                        </div>
                    </div>
                    <div class="close-orders center-items">
                        <button class="close-btn">
                            <i class="bi bi-x-circle"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div id="pay-pal">
            <div class="total-price">
                <div class="money-text">
                    <p>Thành tiền: </p>
                </div>
                <div class="money-number">
                    <p>13,900,000đ</p>
                </div>
            </div>
            <div class="watch-cart center-items">
                <a href="../web/cart/cart.html">XEM GIỎ HÀNG</a>
            </div>
            <div class="check-out center-items">
                <a href="../web/order/order.html">THANH TOÁN</a>
            </div>

        </div>
    </div>
</div>

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

                <a href="../../contact.html">0906 904 114</a>
                <div class="about-hd">
                    <a href="../../about.html">Giới thiệu</a>
                    <a href="#">Khuyến mãi </a>
                </div>
            </div>

            <div class="header-icons-hd">
                <a href="#" class="fas fa-map-marker-alt"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-shopping-cart" onclick="showCart()"></a>
                <a href="../auth/profile.html" class="fas fa-light fa-user"></a>
                <h4 style="font-weight: lighter; margin-left: -15px; font-size: large; margin-top: 10px;"><a
                        href="../auth/profile.html">Tài khoản của tôi</a></h4>
            </div>
        </div>
        <!-- create mobile menu -->
        <div id="background-trans" hidden class="mfp-bg mfp-ready"></div>
        <div class="header-bottom-hd">
            <div class="menu-icon-hd">
                <img src="../../../public/images/menu-bar/menu-bar.png" alt="Menu Icon" onclick="openNav()">
                <div id="myNav" class="menu-overlay">
                    <a href="javascript:void(0)" class="menu-closebtn" style="border-bottom: none; font-size: 40px;"
                       onclick="closeNav()">&times;</a>
                    <div class="menu-overlay-content">
                        <a id="d1" class="btn-secondary dropdown-toggle" role="button" data-bs-toggle="dropdown"
                           href="#">Sofa và Armchair</a>
                        <ul class="dropdown-menu" aria-labelledby="d1">
                            <li id="menu-item-3785"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3785">
                                <a href="#">Sofa</a>
                            </li>
                            <li id="menu-item-3786"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3786">
                                <a href="#">Sofa góc</a>
                            </li>
                            <li id="menu-item-24359"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-24359">
                                <a href="#">Armchair</a>
                            </li>
                            <li id="menu-item-3377"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3377">
                                <a href="#">Ghế dài &amp; đôn</a>
                            </li>
                            <li id="menu-item-3378"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3378">
                                <a href="#">Ghế thư giãn</a>
                            </li>
                        </ul>
                        <a id="d2" class="btn-secondary dropdown-toggle" role="button" data-bs-toggle="dropdown"
                           href="#">Bàn</a>
                        <ul class="dropdown-menu" aria-labelledby="d2">
                            <li id="menu-item-24417"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-24417">
                                <a href="#">Bàn nước</a>
                            </li>
                            <li id="menu-item-3362"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3362">
                                <a href="#">Bàn ăn</a>
                            </li>
                            <li id="menu-item-3372"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3372">
                                <a href="#">Bàn bên</a>
                            </li>
                            <li id="menu-item-3387"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3387">
                                <a href="#">Bàn làm việc</a>
                            </li>
                            <li id="menu-item-3382"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3382">
                                <a href="#">Bàn trang điểm</a>
                            </li>
                        </ul>
                        <a id="d3" class="btn-secondary dropdown-toggle" role="button" data-bs-toggle="dropdown"
                           href="#">Ghế</a>
                        <ul class="dropdown-menu" aria-labelledby="d3">
                            <li id="menu-item-28024"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-28024">
                                <a href="#">Ghế ăn</a>
                            </li>
                            <li id="menu-item-3365"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3365">
                                <a href="#">Ghế bar</a>
                            </li>
                            <li id="menu-item-3388"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3388">
                                <a href="#">Ghế làm việc</a>
                            </li>
                        </ul>
                        <a id="d4" class="btn-secondary dropdown-toggle" role="button" data-bs-toggle="dropdown"
                           href="#">Giường ngủ</a>
                        <ul class="dropdown-menu" aria-labelledby="d4">
                            <li id="menu-item-28345"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-28345">
                                <a href="#">Giường</a>
                            </li>
                            <li id="menu-item-3381"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3381">
                                <a href="#">Bàn đầu giường</a>
                            </li>
                            <li id="menu-item-3795"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3795">
                                <a href="#/">Nệm</a>
                            </li>
                        </ul>
                        <a id="d5" class="btn-secondary dropdown-toggle" role="button" data-bs-toggle="dropdown"
                           href="#">Tủ và kệ</a>
                        <ul class="dropdown-menu" aria-labelledby="d5">
                            <li id="menu-item-3790"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3790">
                                <a href="#">Tủ tivi</a>
                            </li>
                            <li id="menu-item-3776"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3776">
                                <a href="#">Tủ trưng bày</a>
                            </li>
                            <li id="menu-item-3779"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3779">
                                <a href="#">Tủ ly</a>
                            </li>
                            <li id="menu-item-3780"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3780">
                                <a href="#">Tủ rượu</a>
                            </li>
                            <li id="menu-item-3781"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3781">
                                <a href="#">Xe đẩy</a>
                            </li>
                            <li id="menu-item-3798"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3798">
                                <a href="#">Tủ hộc kéo</a>
                            </li>
                            <li id="menu-item-3797"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3797">
                                <a href="#">Tủ áo</a>
                            </li>
                            <li id="menu-item-3796"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3796">
                                <a href="#">Tủ âm tường</a>
                            </li>
                            <li id="menu-item-3788"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3788">
                                <a href="#">Tủ giày</a>
                            </li>
                            <li id="menu-item-3380"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3380">
                                <a href="#">Kệ phòng khách</a>
                            </li>
                        </ul>
                        <a id="d6" class="btn-secondary dropdown-toggle" role="button" data-bs-toggle="dropdown"
                           href="#">Bếp</a>
                        <ul class="dropdown-menu" aria-labelledby="d6">
                            <li id="menu-item-3813"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3813">
                                <a href="#">Tủ bếp</a>
                            </li>
                            <li id="menu-item-3810"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3810">
                                <a href="#">Phụ kiện bếp</a>
                            </li>
                            <li id="menu-item-3349"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3349">
                                <a href="#">Đảo bếp</a>
                            </li>
                            <li id="menu-item-3811"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3811">
                                <a href="#">Quầy bar</a>
                            </li>
                        </ul>
                        <a id="d7" class="btn-secondary dropdown-toggle" role="button" data-bs-toggle="dropdown"
                           href="#">Hàng trang trí</a>
                        <ul class="dropdown-menu" aria-labelledby="d7">
                            <li id="menu-item-3353"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3353">
                                <a href="#">Bình trang trí</a>
                            </li>
                            <li id="menu-item-3354"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3354">
                                <a href="#">Đèn trang trí</a>
                            </li>
                            <li id="menu-item-3355"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3355">
                                <a href="#">Đồ trang trí Noel</a>
                            </li>
                            <li id="menu-item-3356"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3356">
                                <a href="views/web/product/products.html">Đồng hồ</a>
                            </li>
                            <li id="menu-item-3357"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3357">
                                <a href="#">Dụng cụ bếp</a>
                            </li>
                            <li id="menu-item-3358"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3358">
                                <a href="#">Gối và thú bông</a>
                            </li>
                            <li id="menu-item-3359"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3359">
                                <a href="#">Hàng trang trí khác</a>
                            </li>
                            <li id="menu-item-3360"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3360">
                                <a href="#">Hoa &amp; Cây</a>
                            </li>
                            <li id="menu-item-3800"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3800">
                                <a href="#">Khung gương</a>
                            </li>
                            <li id="menu-item-3801"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3801">
                                <a href="#">Khung hình</a>
                            </li>
                            <li id="menu-item-3802"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3802">
                                <a href="#">Nệm</a>
                            </li>
                            <li id="menu-item-3804"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3804">
                                <a href="#">Sản phẩm khác</a>
                            </li>
                            <li id="menu-item-3805"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3805">
                                <a href="#">Thảm</a>
                            </li>
                            <li id="menu-item-3794"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3794">
                                <a href="#">Mền</a>
                            </li>
                            <li id="menu-item-3806"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3806">
                                <a href="#">Tranh</a>
                            </li>
                            <li id="menu-item-3807"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3807">
                                <a href="#">Tượng trang trí</a>
                            </li>
                        </ul>
                        <a id="d8" class="btn-secondary dropdown-toggle" role="button" data-bs-toggle="dropdown"
                           href="#">Ngoại thất</a>
                        <ul class="dropdown-menu" aria-labelledby="d8">
                            <li id="menu-item-3391"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3391">
                                <a href="#">Bàn ngoài trời</a>
                            </li>
                            <li id="menu-item-3393"
                                class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-3393">
                                <a href="#">Ghế ngoài trời</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="logo-hd">
                <a href="home.html"> <img src="../../../public/images/logos/logo3.png" alt="Logo"></a>
            </div>
            <nav class="main-nav">
                <a style="color: black; border: none;" class="btn dropdown-toggle"
                   href="../web/product/all-product.html">SẢN PHẨM</a>

                <ul class="dropdown-menu">
                    <div class="row" id="row-873750177">


                        <div id="col-1465340020" class="col medium-2 small-6 large-2">
                            <div class="col-inner">

                                <div class="ux-menu stack stack-col justify-start">

                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#/">
                                                <span class="ux-menu-link__text">
                                                    Sofa </span>
                                        </a>
                                    </div>


                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Armchair </span>
                                        </a>
                                    </div>


                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Ghế dài &amp; đôn </span>
                                        </a>
                                    </div>


                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Bàn bên </span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Bàn nước </span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Tủ giày </span>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div id="col-668683791" class="col medium-2 small-6 large-2">
                            <div class="col-inner">

                                <div class="ux-menu stack stack-col justify-start">

                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#/">
                                                <span class="ux-menu-link__text">
                                                    Ghế Bar </span>
                                        </a>
                                    </div>

                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Tủ ly </span>
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div id="col-306964646" class="col medium-2 small-6 large-2">
                            <div class="col-inner">

                                <div class="ux-menu stack stack-col justify-start">


                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Giường ngủ </span>
                                        </a>
                                    </div>

                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Tủ áo </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="col-763303414" class="col medium-2 small-6 large-2">
                            <div class="col-inner">

                                <div class="ux-menu stack stack-col justify-start">
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Bàn làm việc </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="col-2111288232" class="col medium-2 small-6 large-2">
                            <div class="col-inner">

                                <div class="ux-menu stack stack-col justify-start">

                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Đèn trang trí </span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Bình trang trí </span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                                    Gương </span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="../web/product/products.html">
                                                <span class="ux-menu-link__text">
                                                    Đồng hồ </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="col-225901627" class="col medium-2 small-12 large-2">
                            <div class="col-inner">
                                <div class="ux-menu stack stack-col justify-start ux-menu--divider-solid">
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="">
                                                <span class="ux-menu-link__text">
                                                    Hàng trang trí khác </span>
                                        </a>
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

<section class="error-404" style="height:500px;">
    <div class="row">
        <div class="col-3"><span class="header-font"
                                 style="font-size: 6em; font-weight: bold; opacity: .3; padding-left: 25%;">404</span>
        </div>
        <div class="col-9">
            <h1>Oops! That page can’t be found.</h1>
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
                <li><a href="../../about.html">Giới thiệu</a></li>
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
