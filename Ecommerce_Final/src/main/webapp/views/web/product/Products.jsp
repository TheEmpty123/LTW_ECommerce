<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/14/2024
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đồng hồ</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../public/css/product.css">
    <link rel="stylesheet" href="../../../public/css/header.css">
    <link rel="stylesheet" href="../../../public/css/footer.css">
    <link rel="stylesheet" href="../../../public/bootstrap-5.3.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="../../../public/js/curtainmenu.js"></script>
</head>
<body>
<!-- HEADER -->
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
                <h4 style="font-weight: lighter; margin-left: -15px; font-size: large; margin-top: 10px;"><a href="">Tài
                    khoản của tôi</a></h4>
            </div>
        </div>
        <!-- create mobile menu -->
        <div id="background-trans" hidden class="mfp-bg mfp-ready"></div>
        <div class="header-bottom-hd">

            <div class="logo-hd">
                <a href=""><img src="../../../public/images/logos/logo3.png"
                                alt="Logo">
                </a>
            </div>
            <nav class="main-nav">
                <a style="color: black; border: none;"
                   class="btn dropdown-toggle" href="../product/All-products.jsp">SẢN PHẨM</a>
                <ul class="dropdown-menu">
                    <div class="row" id="row-873750177">
                        <div id="col-1465340020" class="col medium-2 small-6 large-2">
                            <div class="col-inner">
                                <div class="ux-menu stack stack-col justify-start">
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Sofa			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Armchair			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Ghế dài &amp; đôn			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Bàn bên			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Bàn nước			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Tủ giày			</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="col-668683791" class="col medium-2 small-6 large-2">
                            <div class="col-inner">
                                <div class="ux-menu stack stack-col justify-start">
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Ghế Bar			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Tủ ly			</span>
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
                                        Giường ngủ			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Tủ áo			</span>
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
                                        Bàn làm việc			</span>
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
                                        Đèn trang trí			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Bình trang trí			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Gương			</span>
                                        </a>
                                    </div>
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="../product/Products.jsp">
                                                <span class="ux-menu-link__text">
                                        Đồng hồ			</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="col-225901627" class="col medium-2 small-12 large-2">
                            <div class="col-inner">
                                <div class="ux-menu stack stack-col justify-start ux-menu--divider-solid">
                                    <div class="ux-menu-link flex menu-item">
                                        <a class="ux-menu-link__link flex" href="#">
                                                <span class="ux-menu-link__text">
                                        Hàng trang trí khác			</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
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
<!-- END HEADER -->
<!-- <div id="pop-up-cart"> -->
<!-- <iframe src="../cart/pop-up-cart.html" frameborder="0" id="pop-up-cart"></iframe> -->
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
                <a href="../cart/Cart.jsp">XEM GIỎ HÀNG</a>
            </div>
            <div class="check-out center-items">
                <a href="">THANH TOÁN</a>
            </div>
        </div>
    </div>
</div>
<!-- </div> -->

<div id="container">
    <!-- IMAGE HEADER -->
    <div id="imageHeader">
        <div class="title-bg" style="age: url('../../../public/images/banners/dongho.jpg')">
            <div class="title">
                <Strong style="padding: 10px; font-size: 30px;">Đồng hồ</Strong><br>
                <a href="" style="font-weight: normal;">Trang chủ</a> / <a
                    href="../product/All-products.jsp" style="font-weight: normal;">Sản phẩm</a> / <a
                    href="../product/Products.jsp" style="font-weight: bold;">Đồng hồ</a>
            </div>
        </div>
        <div class="mask"></div>
    </div>

    <!-- FILTER -->
    <div id="filter">
        <div class="row">
            <div class="col-md-2">
                <div class="row">
                    <h6>Giá</h6>
                    <div class="dropdown-price">
                        <div class="dropdown-toggle-price" onclick="toggleDropdownPrice()">Theo mức độ phổ biến</div>
                        <div class="dropdown-menu-price">
                            <div class="dropdown-item-price selected" onclick="selectItem(this)">Theo mức độ phổ biến
                            </div>
                            <div class="dropdown-item-price" onclick="selectItem(this)">Mới nhất</div>
                            <div class="dropdown-item-price" onclick="selectItem(this)">Theo giá: Thấp đến cao</div>
                            <div class="dropdown-item-price" onclick="selectItem(this)">Theo giá: Cao đến thấp</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-2">
                <div class="row">
                    <h6>Chât liệu</h6>
                    <div class="dropdown-material">
                        <div class="dropdown-toggle-material" onclick="toggleDropdownmaterial()">Tất cả</div>
                        <div class="dropdown-menu-material">
                            <div class="dropdown-item-material">
                                <input type="checkbox" id="thuytinh" onchange="updateSelection()">
                                <label for="thuytinh">Thủy tinh (383)</label>
                            </div>
                            <div class="dropdown-item-material">
                                <input type="checkbox" id="kinh" onchange="updateSelection()">
                                <label for="kinh">Kính (7)</label>
                            </div>
                            <div class="dropdown-item-material hidden">
                                <input type="checkbox" id="kimloai" onchange="updateSelection()">
                                <label for="kimloai">Kim loại (387)</label>
                            </div>
                            <div class="dropdown-footer" onclick="showMore()">Show more</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="applyBtn">
                    <button>Áp dụng</button>
                </div>
            </div>
        </div>
    </div>
    <!-- PRODUCTS -->
    <div id="p-product">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/101.jpg"
                                 alt="Đồng hồ bàn Alum/Granite">
                        </a>
<%--                        <img src="" alt="">--%>
                        <div class="card-body">
                            <h6 class="product-name">Đồng hồ bàn Alum/Granite</h6>
                            <div class="like-price-product">
                                <span class="product-price">670,000₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn use-button fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="use-button fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/102.jpg"
                                 alt="Đồng hồ bàn Nickel">
                        </a>
                        <div class="card-body">
                            <h6 class="product-name">Đồng hồ bàn Nickel</h6>
                            <div class="like-price-product">
                                <span class="product-price">1,390,000₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/103.jpg"
                                 alt="Đồng hồ bàn Steel/Alum">
                        </a>
                        <div class="card-body">
                            <h6 class="product-name">Đồng hồ bàn Steel/Alum</h6>
                            <div class="like-price-product">
                                <span class="product-price">880,000₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/104.jpg" class="image-top"
                                 alt="Đồng hồ bàn trang trí 17cm">
                            <img src="../../../public/images/all-products/104.1.jpg" class="image-back"
                                 alt="Đồng hồ bàn trang trí 17cm banner">
                        </a>
                        <div class="card-body">
                            <h6 class="product-name">Đồng hồ bàn trang trí 17cm</h6>
                            <div class="like-price-product">
                                <span class="product-price">2,580,000₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/105.jpg" class="image-top"
                                 alt="Đồng hồ bàn trang trí 21cm">
                            <img src="../../../public/images/all-products/105.1.jpg" class="image-back"
                                 alt="Đồng hồ bàn trang trí 21cm 1">
                        </a>
                        <div class="card-body">
                            <h6 class="product-name">Đồng hồ bàn trang trí 21cm</h6>
                            <div class="like-price-product">
                                <span class="product-price">3,900,000₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/106.jpg" alt="Bàn bên 3C-02">
                        </a>
                        <div class="card-body">
                            <h6 class="product-name">Đồng hồ Baxter S</h6>
                            <div class="like-price-product">
                                <span class="product-price">3,900,001₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/107.jpg" class="image-top"
                                 alt="Đồng hồ cát 10 phút cam">
                            <img src="../../../public/images/all-products/107.1.jpg" class="image-back"
                                 alt="Đồng hồ cát 10 phút cam 1">
                        </a>
                        <div class="card-body">
                            <h6 class="product-name">Đồng hồ cát 10 phút cam</h6>
                            <div class="like-price-product">
                                <span class="product-price">750,000₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/108.jpg"
                                 alt="Bàn bên butterfly ginkgo 411510 MCA">
                        </a>
                        <div class="card-body">
                            <h6 class="product-name">Đồng hồ cát 10 phút hồng</h6>
                            <div class="like-price-product">
                                <span class="product-price">750,000₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/109.jpg"
                                 alt="Sofa 1 chỗ Orientale da beige R5">
                        </a>
                        <div class="card-body">
                            <h6 class="product-name"> Đồng hồ treo tường 58cm</h6>
                            <div class="like-price-product">
                                <span class="product-price">1,400,000₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card product-card">
                        <a href="">
                            <img src="../../../public/images/all-products/110.jpg" alt="Sofa 2 chỗ Hà Nội">
                        </a>
                        <div class="card-body">
                            <h6 class="product-name">Đồng hồ treo tường Belt</h6>
                            <div class="like-price-product">
                                <span class="product-price">5,360,000₫</span>
                                <button class="wishlist-button">
                                    <i class="bi bi-heart"></i>
                                </button>
                            </div>
                        </div>
                        <div class="cart-see-more-btns">
                            <div class="row">
                                <div class="col-sm-7 col-md-7">
                                    <div class="cart-btn fake-btn">
                                        <p>THÊM VÀO GIỎ</p>
                                    </div>
                                </div>
                                <div class="col-sm-5 col-md-5">
                                    <div class="fake-btn">
                                        <p>XEM THÊM</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- fOOTER -->
<!-- <iframe src="../../common/footer.html" frameborder="0" class="footer"></iframe> -->
<footer class="footer">
    <div class="footer-container">
        <!-- Left Column -->
        <div class="footer-column">
            <h3>KẾT NỐI VỚI KANE'S</h3>
            <img src="../../../public/images/logos/logo3.png"
                 alt=" Logo" class="footer-logo">
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
<script>
    function toggleDropdownPrice() {
        document.querySelector('.dropdown-menu-price').classList.toggle('active');
    }

    function selectItem(item) {
        // Cập nhật tiêu đề
        document.querySelector('.dropdown-toggle-price').textContent = item.textContent;

        // Đánh dấu mục được chọn và bỏ đánh dấu mục cũ
        document.querySelectorAll('.dropdown-item-price').forEach(el => el.classList.remove('selected'));
        item.classList.add('selected');

        // Ẩn menu
        document.querySelector('.dropdown-menu-price').classList.remove('active');
    }

    document.addEventListener('click', function (event) {
        const dropdown = document.querySelector('.dropdown-price');
        if (!dropdown.contains(event.target)) {
            document.querySelector('.dropdown-menu-price').classList.remove('active');
        }
    });

    function toggleDropdownmaterial() {
        document.querySelector('.dropdown-menu-material').classList.toggle('active');
    }

    function updateSelection() {
        const selectedItems = [];
        document.querySelectorAll('.dropdown-item-material input[type="checkbox"]:checked').forEach((checkbox) => {
            const label = checkbox.nextElementSibling;
            selectedItems.push(label.textContent.trim());
        });

        document.querySelector('.dropdown-toggle-material').textContent = selectedItems.join(', ') || "Tất cả";

    }

    function showMore() {
        const textFooter = document.querySelector('.dropdown-footer').textContent
        if (textFooter === "Show more") {
            document.querySelectorAll('.dropdown-item-material').forEach(e => {
                if (e.classList.contains('hidden')) {
                    e.classList.remove('hidden')
                    e.classList.add('show')
                }
            })
            document.querySelector('.dropdown-footer').textContent = "Hide less"
        } else if (textFooter === "Hide less") {
            document.querySelectorAll('.dropdown-item-material').forEach(e => {
                if (e.classList.contains('show')) {
                    e.classList.remove('show')
                    e.classList.add('hidden')
                }
            })
            document.querySelector('.dropdown-footer').textContent = "Show more"
        }

    }

    document.addEventListener('click', function (event) {
        const dropdown = document.querySelector('.dropdown-material');
        if (!dropdown.contains(event.target)) {
            document.querySelector('.dropdown-menu-material').classList.remove('active');
        }
    });

    document.querySelectorAll('.wishlist-button').forEach(function (heart) {
        heart.addEventListener('click', function () {
            heart.classList.toggle('clicked')
        })
    })

    // Xử lí phần ẩn hiện giỏ hàng
    const pop_up_cart = document.getElementById('mask-container')

    function showCart() {
        document.body.style.overflow = 'hidden';
        pop_up_cart.style.opacity = 1;
        pop_up_cart.style.zIndex = 2000;
        pop_up_cart.style.transform = 'translateX(0)'
        pop_up_cart.style.transition = 'transform 0.5s ease'
    }

    //ẩn đi phần giỏ hàng
    function hiddenCart() {
        document.body.style.overflow = 'auto';
        pop_up_cart.style.transform = 'translateX(50%)'
        pop_up_cart.style.transition = 'transform 0.5s ease'
        pop_up_cart.style.opacity = 0;
        pop_up_cart.style.zIndex = -2000;
    }

    document.getElementById('mask-cart').addEventListener('click', hiddenCart)
    document.getElementById('close-pop-up').addEventListener('click', hiddenCart)
</script>
</body>
</html>
