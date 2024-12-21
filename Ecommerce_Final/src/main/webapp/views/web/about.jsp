<%--
  Created by IntelliJ IDEA.
  User: dttan
  Date: 12/18/2024
  Time: 1:12 PM
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
    <title>About us</title>
    <link rel="stylesheet" href="../../public/css/about.css">
    <link rel="stylesheet" href="../../public/css/header.css">
    <link rel="stylesheet" href="../../public/css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
                <a href="views/web/cart/cart.html">XEM GIỎ HÀNG</a>
            </div>
            <div class="check-out center-items">
                <a href="views/web/order/order.html">THANH TOÁN</a>
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
                <a href="views/common/home.html"> <img src="../../public/images/logos/logo3.png"
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
                                        <a class="ux-menu-link__link flex" href="#/">
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
                                        <a class="ux-menu-link__link flex" href="#/">
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
                                        <a class="ux-menu-link__link flex" href="">
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
<!-- <script src="../../public/js/curtainmenu.js"></script> -->
</body>
</div>
<div id="container">
    <div class="intro">
        <img class="img-intro"
             src="../../public/images/banners/kanes_furniture_cover.png"
             alt="historyofformation">
        <div class="page-title-inner container align-center flex-row medium-flex-wrap">
            <div class="title-wrapper is-xlarge flex-col text-left medium-text-center">
                <h1 class="entry-title mb-0">About us</h1>
            </div>
        </div>
        <!-- </div>  -->
        <div class="content">
            <section class="history-text">
                <h1 class="history">LỊCH SỬ HÌNH THÀNH</h1>
                <p class="history">KANE'S ra đời vào năm 1999, là một trong những thương hiệu tiên phong trong ngành
                    nội thất, với nguồn cảm hứng văn hóa Việt và gu thẩm mỹ tinh tế. Qua một năm hoạt động, KANE'S luôn
                    chú trọng đổi mới để duy trì vị thế là thương hiệu nội thất hàng đầu tại Việt Nam. Không ngừng tìm
                    tòi sáng tạo, kết hợp quy trình chọn lọc kỹ lưỡng, các bộ sưu tập do KANE'S thiết kế sản xuất luôn
                    mang nét tinh tế thẩm mỹ, hợp xu hướng cùng chất lượng bền vững. KANE'S hiện nay đã có chuỗi 10
                    cửa hàng trên toàn quốc, với không gian rộng, giàu cảm hứng, trưng bày những thiết kế trang nhã, hợp
                    thời trong sự thân thiện và gần gũi
                </p>
            </section>
            <section class="des">
                <div class="part1">
                    <div class="img-p1">
                        <img src="../../public/images/products/bo-suu-tap-may-net-viet-duong-dai-3.jpg"
                             alt="">
                    </div>
                    <div class="des-p1" style="text-align: left;">
                        <p>
                            <li>2024. Tròn một năm thành lập, KANE'S liên tục cho ra những bộ sưu tập mới do chính
                                KANE'S
                                thiết kế và sản xuất tại Việt Nam mang lại cho khách hàng những lựa chọn hợp thời và
                                chất
                                lượng.
                            </li>

                            <li>2021: Khẳng định thương hiệu bền vững với những bước phát triển mới dù đối mặt những khó
                                khăn do dịch bệnh Covid. Hệ thống cửa hàng mở rộng, với showroom mới tại Bình Dương.
                            </li>

                            <li>2020: Đơn vị chủ quản thương hiệu KANE'S – AKA Furniture Group tái cơ cấu trở thành
                                thành
                                viên của tập đoàn AA Corporation – Tập đoàn sản xuất và thi công nội thất chất lượng cao
                                hàng đầu Châu Á.
                            </li>

                            2019: Đây là năm mang dấu ấn đặc biệt của thương hiệu KANE'S – Đánh dấu chặng đường phát
                            triển 20 năm. Với sự xuất hiện của 2 cửa hàng tại Nguyễn Văn Hưởng (Q2, HCM) và Trung tâm
                            nội thất Thụy Khuê (Tây Hồ, Hà Nội)</li>

                            <li>2016: Mở rộng hệ thống KANE'S với 2 cửa hàng lớn ở ngay trung tâm thủ đô Hà Nội thuộc
                                quận
                                Hoàn Kiếm và quận Đống Đa.
                            </li>

                            <li>2011 – 2014: Khẳng định thương hiệu với sự xuất hiện của 2 cửa hàng mới tại ngã tư trung
                                tâm
                                Q1, TP.HCM (Hai Bà Trưng – Trần Cao Vân) và TTTM Royal City Hà Nội.
                            </li>

                            <li>2005 – 2010: Phát triển mạnh mẽ với hệ thống cửa hàng trên các khu đô thị mới là KANE'S
                                Yên Hòa, KANE'S'Ss Phú Mỹ Hưng và KANE'S Centre – khu vực trung tâm Q1.
                            </li>

                            <li>2002 – 2005: KANE'S Cát Linh tại Hà Nội và KANE'S Citimart tại TP.HCM nhằm hoàn thiện hệ
                                thống và phục vụ tốt hơn cho Khách hàng.
                            </li>

                            <li>1999: Ra đời với 2 cửa hàng lớn tại Hà Nội và TP.HCM, mang đậm phong cách riêng về thiết
                                kế
                                và cách bày trí.
                            </li>
                        </p>
                    </div>
                    <div class="img-p2">
                        <img src="../../public/images/products/bo-suu-tap-maxine-phong-an-600x899.jpg"
                             alt="">
                    </div>
                    <div class="des-p2" style="text-align: left;">
                        <h2 style="text-align: center;">Giá trị và sự khác biệt</h2>
                        <p>Với mong muốn phát triển thương hiệu Việt bằng nội lực, KANE'S đã chú trọng vào thiết kế và
                            sản xuất nội thất trong nước. Danh mục sản phẩm của KANE'S thường xuyên được đổi mới và
                            cập nhật, liên tục cung cấp cho khách hàng các dòng sản phẩm theo xu hướng mới nhất. Do
                            chính người Việt thiết kế và sản xuất, nội thất thương hiệu KANE'S luôn phù hợp với cuộc
                            sống Á Đông, đem đến sự tiện nghi hoàn hảo trong mọi không gian sống.

                            Hơn 70% sản phẩm của KANE'S được thiết kế, sản xuất bởi đội ngũ nhân viên cùng công nhân
                            ưu tú với nhà máy có cơ sở vật chất hiện đại bậc nhất tại Việt Nam.

                            Sự khác biệt của KANE'S chính là sáng tạo nội thất thành phong cách riêng, phù hợp với nhu
                            cầu khách hàng. Không chỉ là sản phẩm nội thất đơn thuần, mà còn là không gian sống theo
                            phong cách riêng với cách bày trí hài hòa từ đồ nội thất kết hợp với đồ trang trí. Giúp
                            khách hàng cảm nhận được một không gian sống thực sự, cảm thấy thoải mái để tận hưởng cuộc
                            sống.</p>
                    </div>
                </div>
                <div class="part2">
                    <div class="img-p3">
                        <img src="../../public/images/products/nha-xinh-gioi-thieu-chat-luong-251121 (1).jpg"
                             alt="">
                    </div>

                    <div class="des-p3" style="text-align: left;">
                        <h2 style="text-align: center;">Chất lượng và dịch vụ</h2>
                        <p>Chất lượng của nguyên vật liệu, phụ kiện và quy trình sản xuất đều được kiểm định và giám sát
                            chặt chẽ bởi hệ thống quản lý chất lượng ISO 9001. Sản phẩm của KANE'S được thiết kế theo
                            định hướng công năng sử dụng, thẩm mỹ và chất lượng. Trong những năm gần đây, thương hiệu
                            luôn hướng đến xu hướng thiết kế xanh nhằm đóng góp không chỉ một không gian sống tiện nghi
                            mà còn là một môi trường sống trong lành cho người sử dụng và cộng đồng. Với nhiều cống hiến
                            như vậy, KANE'S vinh dự nhiều năm liền được trao tặng các danh hiệu “Hàng Việt Nam chất
                            lượng cao”, “Trusted brand” và “Top 100 nhà cung cấp hàng đầu”.

                            Bên cạnh đó, KANE'S tự hào sở hữu đội ngũ tư vấn thiết kế và kỹ sư chuyên nghiệp, có kiến
                            thức sâu rộng trong lĩnh vực đồ gỗ nội thất. Tập thể nhân viên tại KANE'S cam kết nỗ lực
                            tư vấn và trợ giúp khách hàng lựa chọn sản phẩm ưng ý nhất. Dịch vụ tư vấn thiết kế của Nhà
                            Xinh sẽ giúp khách hàng kiến tạo một không gian sống như ý thông qua sự phối hợp điêu luyện
                            giữa các sản phẩm nội thất và đồ trang trí.</p>
                    </div>
                    <div class="img-p4">
                        <img src="../../public/images/products/nha-may-aa-tayninh-1400x786.jpg"
                             alt="">
                    </div>
                    <div class="des-p4" style="text-align: left;">
                        <h2 style="text-align: center;">Nhà máy</h2>

                        <p>Phần lớn sản phẩm của KANE'S được sản xuất tại nhà máy của Tổng công ty AA (AA Đức Hòa,
                            Long An và AA Tây Ninh) có diện tích 80.000m2, với trang thiết bị hiện đại nhất và theo tiêu
                            chuẩn ISO 9001, chuyên sản xuất các sản phẩm nội thất chất lượng cao cho các khách sạn, nhà
                            hàng 5 sao, dự án nội thất cao cấp và xuất khẩu.</p>
                        <h2 style="text-align: center;">KANE'S và Cộng Đồng
                        </h2>
                        <!-- <div class="des-p4"  style="text-align: left;"> -->
                        <p>Đóng góp cho cộng đồng nằm trong sứ mệnh của KANE'S. Để trở thành thương hiệu tiên phong và
                            văn minh, KANE'S đã thực hiện nhiều các hoạt động cộng đồng như hỗ trợ trẻ em nghèo, tham
                            gia các hoạt động vì môi trường như thiết kế xanh, đi bộ từ thiện,… Những bước chân, hành
                            động không ngừng nghỉ để góp phần cho cuộc sống tốt hơn.</p>
                    </div>

                </div>
                <div class="part3">
                    <div class="img-part3-1">
                        <img src="../../public/images/products/nha-may-aa-tay-ninh-5-1200x800.jpg">
                    </div>
                    <div class="img-part3-2">
                        <img src="../../public/images/products/nha-may-aa-tay-ninh-12-1200x800.jpg">
                    </div>
                </div>
            </section>

        </div>
    </div>
    <footer class="footer">
        <div class="footer-container">
            <!-- Left Column -->
            <div class="footer-column">
                <h3>KẾT NỐI VỚI KANE'S</h3>
                <img src="../../public/images/logos/logo3.png"
                     alt=" Logo" class="footer-logo">
                <p>FOLLOW US</p>
                <p>Instagram – Youtube – Facebook</p>
                <button class="footer-button">HỆ THỐNG CỬA HÀNG</button>
            </div>

            <!-- Second Column -->
            <div class="footer-column">
                <h3>KANE'S</h3>
                <ul>
                    <li><a href="#">Giới thiệu</a></li>
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
</div>
<script src="../../public/js/curtainmenu.js"></script>
<script src="../../public/js/popup.js"></script>
</body>
</html>