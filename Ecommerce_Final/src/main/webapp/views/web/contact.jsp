<%--
  Created by IntelliJ IDEA.
  User: dttan
  Date: 12/18/2024
  Time: 1:10 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
    <link rel="stylesheet" href="../../public/css/header.css">
    <link rel="stylesheet" href="../../public/css/footer.css">
    <link rel="stylesheet" href="../../public/css/contact.css">
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
                        <img src="../../public/images/all-products/53.jpg" alt="">
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
                <a href="../webapp/views/web/cart/cart.html">XEM GIỎ HÀNG</a>
            </div>
            <div class="check-out center-items">
                <a href="../webapp/views/web/order/order.html">THANH TOÁN</a>
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

                <a href="contact.html">0906 904 114</a>
                <div class="about-hd">
                    <a href="about.html">Giới thiệu</a>
                    <a href="#">Khuyến mãi </a>
                </div>
            </div>

            <div class="header-icons-hd">
                <a href="#" class="fas fa-map-marker-alt"></a>
                <a href="#" class="fas fa-heart"></a>
                <a href="#" class="fas fa-shopping-cart" onclick="showCart()"></a>
                <a href="#" class="fas fa-light fa-user"></a>
                <h4 style="font-weight: lighter; margin-left: -15px; font-size: large; margin-top: 10px;"><a
                        href="views/auth/profile.html">Tài khoản của tôi</a></h4>
            </div>
        </div>
        <!-- create mobile menu -->
        <div id="background-trans" hidden class="mfp-bg mfp-ready"></div>
        <div class="header-bottom-hd">
            <div class="logo-hd">
                <a href="views/common/home.html"><img src="../../public/images/logos/logo3.png"
                                                      alt="Logo"></a>
            </div>
            <nav class="main-nav">
                <a style="color: black; border: none;"
                   class="btn dropdown-toggle" href="views/web/product/all-product.html">SẢN PHẨM</a>

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
                                        <a class="ux-menu-link__link flex" href="views/web/product/products.html">
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

<div class="container">
    <div class="contact-form">
        <h1>Liên hệ với chúng tôi</h1>
        <p>Bạn không chắc chắn về những gì bạn cần? Đội ngũ tại Square Events sẽ rất vui lòng lắng nghe bạn và gợi ý
            những ý tưởng sự kiện mà bạn chưa từng cân nhắc</p>
        <form>
            <label for="fullname">Họ và tên</label>
            <input type="text" id="fullname" placeholder="John Doe">

            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Nhập vào email của bạn">

            <label for="phone">Số điện thoại</label>
            <input type="tel" id="phone" placeholder="+84 (000) 000-0000">

            <label for="message">Tin nhắn của bạn</label>
            <textarea id="message" placeholder="Nhập vào tin nhắn"></textarea>

            <button type="submit">Gửi</button>
        </form>
    </div>
    <div class="contact-image">
        <img src="../../public/images/contact/contact.png" alt="Contact Support">
        <div class="overlay-text">Chúng tôi đang chờ đợi phản hồi từ bạn!</div>
    </div>
</div>
<footer class="footer">
    <div class="footer-container">
        <div class="footer-column">
            <h3>KẾT NỐI VỚI KANE'S</h3>
            <img src="../../public/images/logos/logo3.png"
                 alt=" Logo" class="footer-logo">
            <p>FOLLOW US</p>
            <p>Instagram – Youtube – Facebook</p>
            <button class="footer-button">HỆ THỐNG CỬA HÀNG</button>
        </div>

        <div class="footer-column">
            <h3>KANE'S</h3>
            <ul>
                <li><a href="#">Giới thiệu</a></li>
                <li><a href="#">Chuyện KANE'S</a></li>
                <li><a href="#">Tổng công ty</a></li>
                <li><a href="#">Tuyển dụng</a></li>
                <li><a href="#">Thẻ hội viên</a></li>
                <li><a href="#">Đổi trả hàng</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>CẢM HỨNG</h3>
            <ul>
                <li><a href="#">Sản phẩm</a></li>
                <li><a href="#">Ý tưởng và cảm hứng</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>NEWSLETTER</h3>
            <p>Hãy để lại email của bạn để nhận được những ý tưởng trang trí mới và thông tin ưu đãi từ KANE'S</p>
            <p>Email: kanes@akacompany.com.vn</p>
            <p>Hotline: 18007200</p>
            <div class="newsletter">
                <input type="email" placeholder="Nhập email của bạn">
                <button class="subscribe-button">ĐĂNG KÝ</button>
            </div>
        </div>
    </div>

</footer>
<script src="../../public/js/curtainmenu.js"></script>
<script src="../../public/js/popup.js"></script>
</body>
</html>
