<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/14/2024
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/footer.css">
    <link href="${pageContext.request.contextPath}/public/bootstrap-5.3.3-dist/css/bootstrap.min.css" rel="stylesheet">
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
    <script src="${pageContext.request.contextPath}/public/js/curtainmenu.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/Cart.js"></script>
    <%--    <script src="${pageContext.request.contextPath}/public/js/FavouriteProducts.js"></script>--%>
    <style>
        .review-section {
            background: white;
            padding: 20px;
            border-radius: 8px;
            max-width: 1100px;
            margin: auto;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        .rating-overview {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .rating-score {
            text-align: center;
        }

        .rating-score span {
            font-size: 2.5rem;
            font-weight: bold;
            /* margin-left:-3 ; */
            color: #e63946;
        }

        .rating-filters button {
            background: #f1f1f1;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            margin: 0 5px;
            cursor: pointer;
        }

        .rating-filters button:hover {
            background: #ddd;
        }

        .review {
            border-top: 1px solid #eee;
            padding: 20px 0;
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .review-header span {
            margin-left: -60%;
        }

        .review-header strong {
            font-size: 1rem;
            color: #333;
        }

        .review p {
            margin: 5px 0;
            color: #555;
        }


        .product-review {
            max-width: 1000px;
            margin: 20px auto;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .product-review h3 {
            margin-bottom: 10px;
            width: 300px;
            font-size: 1.2rem;
            color: #333;
        }

        .product-review textarea {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
            box-sizing: border-box;
            height: 50px;
        }

        .product-review textarea:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .product-review button {
            margin: 10px;
            padding: 10px 15px;
            width: 200px;
            height: 50px;
            background-color: #007bff;
            color: white;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .product-review button:hover {
            background-color: #0056b3;
        }

        /* Kiểu thông báo */
        .notification {
            position: fixed;
            top: 140px;
            right: 20px;
            padding: 10px 20px;
            background-color: #4caf50; /* Màu xanh lá biểu thị thành công */
            color: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            font-size: 14px;
            z-index: 1000;
            opacity: 1;
            transition: opacity 0.5s ease, transform 0.5s ease;
        }

        /* Ẩn thông báo */
        .hidden {
            opacity: 0;
            transform: translateY(-20px);
            pointer-events: none;
        }

        .remove-item {
            border: none;
            background-color: white;
        }

        .red {
            background-color: red;
        }

        .scroll-cart {
            max-height: 65%;
            height: 65% !important;
            overflow-y: auto;
            overflow-x: hidden;
            padding-right: 10px;
        }

        .cart-actions {
            position: sticky; /* Giữ cố định trong container */
            height: 150px !important;
            bottom: 0; /* Đặt vị trí tại đáy của container */
            background-color: #fff; /* Nền trắng để nổi bật */
            padding: 10px;
            z-index: 10; /* Đảm bảo không bị che bởi phần khác */
        }

        .watch-cart,
        .check-out {
            padding: 5px 20px;
            margin-bottom: 10px;
        }
        button{
            border: none;
            background-color: white;
        }
    </style>
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

<div id="mask" class="center-items">
    <div class="block-content center-items">
        <img src="${p.thumb}" alt="">
    </div>
</div>
<div id="container">
    <div id="notification" class="notification hidden">Sản phẩm đã được thêm vào giỏ hàng!</div>
    <div id="login-notification" class="notification hidden red">Bạn chưa đăng nhập!</div>
    <div id="path-nav">
        <a href="">Trang chủ</a>/
        <a href="#">Phòng khách</a>/
        <a href="products?cateID=${categories.id}">${categories.cateName}</a>
    </div>

    <div id="product-details">
        <div class="product-image">
            <!-- Hình ảnh của sản phẩm -->
            <div id="image-product" class="image-right">
                <img src="${p.thumb}" class="image-product-detail"
                     onclick="showImage()">
            </div>
        </div>

        <!-- Mô tả sản phẩm -->
        <div class="product-describe">
            <h1 class="product-title">${p.proName}</h1>
            <div class="wishlist-wrapper favourite-product" data-id="${p.id}"
                 data-user="${sessionScope.auth.id}">
<%--                <div class="wishlist-icon">--%>
                    <button class="wishlist-button">
                        <i class="bi bi-heart"></i>
                    </button>
<%--                </div>--%>
            </div>
            <div class="price-wrapper">
                <p class="product-page-price"><f:formatNumber type="currency" currencySymbol="đ"
                                                              value="${p.price}"/></p>
            </div>
            <div class="product-attributes-wrapper">
                <div class="product-attributes-materail">
                    <strong>Vật liệu </strong>
                    <span class="product-attributes-option">${pat.material}</span>
                </div>
                <div class="product-attributes-size">
                    <strong>Kích thước</strong>
                    <span class="product-attributes-option">${pat.size}</span>
                </div>
            </div>
            <div class="stock-available margin-top-bottom-25">
                <div>
                    <span>Hàng có sẵn - </span>
                    <a href="#" style="text-decoration: underline;">Xem cửa hàng trưng bày</a></p>
                </div>
            </div>
            <div class="product-meta margin-top-bottom-25">
                <div class="category">
                    <span>Danh mục:</span>
                    <a href="#">Armchair,</a>
                    <a href="#">Phòng khách</a>
                </div>
            </div>

            <!-- các nút để chọn số lượng và mua sản phẩm -->
            <div class="cart margin-top-bottom-25">
                <div class="quantity buttons-added left-btn">
                    <input type="button" value="-" id="button-minus-quantity" onclick="minusQuantity()">
                    <input type="number" name="quatity" id="input-quantity" value="1" min="1" inputmode="numeric"
                           autocomplete="off">
                    <input type="button" value="+" id="button-plus-quantity" onclick="plusQuantity()">
                </div>
                <div class="right-btn product" data-id="${p.id}" data-name="${p.proName}" data-img="${p.thumb}"
                     data-price="${p.price}">
                    <a href="${pageContext.request.contextPath}/order" class="buy-button"> Mua ngay</a>
                    <button class="add-to-cart" style=" padding: 10px 5px">Thêm vào giỏ</button>
                </div>
            </div>
            <div class="hotline">
                <a href="">18007200</a>
            </div>

            <!-- nội dung liên quan của sản phẩm như: bảo hành, vận chuyển,... -->
            <div class="woocommerce-content">
                <div class="menu-items">
                    <div id="guarantee-tab" aria-selected="true" onclick="guaraSelected()">Bảo hành</div>
                    <div id="delivery-tab" aria-selected="false" onclick="delSelected()">Vận chuyển</div>
                </div>
                <div class="tab-panels">
                    <div id="guarantee-panels">
                        <div id="content-baohanh" class="guarantee-panels-content">
                            <p>
                                <img src="${pageContext.request.contextPath}/public/images/cart/check.png" alt="">
                                Các sản phẩm nội thất tại Nhà Xinh đa số đều được sản xuất tại nhà máy của
                                công ty cổ phần xây dựng kiến trúc AA với đội ngũ nhân viên và công nhân ưu
                                tú cùng cơ sở vật chất hiện đại
                                <a href="${pageContext.request.contextPath}/public/images/cart/check.png"></a>. Nhà Xinh
                                đã
                                kiểm tra kỹ lưỡng từ nguồn nguyên liệu cho đến sản phẩm hoàn thiện cuối cùng.
                            </p>
                            <p>
                                <img src="${pageContext.request.contextPath}/public/images/cart/check.png" alt="">
                                Nhà Xinh bảo hành một năm cho các trường hợp có lỗi về kỹ thuật trong quá trình sản xuất
                                hay lắp đặt.
                            </p>
                            <p>
                                <img src="${pageContext.request.contextPath}/public/images/cart/check.png" alt="">
                                Quý khách không nên tự sửa chữa mà hãy báo ngay cho Nhà Xinh qua hotline:
                                <a href="">1800 7200.</a>
                            </p>
                            <p>
                                <img src="${pageContext.request.contextPath}/public/images/cart/check.png" alt="">
                                Sau thời gian hết hạn bảo hành, nếu quý khách có bất kỳ yêu cầu hay thắc mắc thì
                                vui lòng liên hệ với Nhà Xinh để được hướng dẫn và giải quyết các vấn đề gặp phải.
                            </p>
                            <p>
                                <strong>TUY NHIÊN NHÀ XINH KHÔNG BẢO HÀNH CHO CÁC TRƯỜNG HỢP SAU:</strong>
                            </p>
                            <p>
                                <img src="${pageContext.request.contextPath}/public/images/cart/check.png" alt="">
                                Khách hàng tự ý sửa chữa khi sản phẩm bị trục trặc mà không báo cho Nhà Xinh.
                            </p>
                            <p>
                                <img src="${pageContext.request.contextPath}/public/images/cart/check.png" alt="">
                                Sản phẩm được sử dụng không đúng quy cách của sổ bảo hành (được trao gửi khi
                                quý khách mua sản phẩm) gây nên trầy xước, móp, dơ bẩn hay mất màu.
                            </p>
                            <p>
                                <img src="${pageContext.request.contextPath}/ublic/images/cart/check.png" alt="">
                                Sản phẩm bị biến dạng do môi trường bên ngoài bất bình thường (quá ẩm, quá khô,
                                mối hay do tác động từ các thiết bị điện nước, các hóa chất hay dung môi khách hàng sử
                                dụng không phù hợp).
                            </p>
                            <p>
                                <img src="${pageContext.request.contextPath}/public/images/cart/check.png" alt="">
                                Sản phẩm hết hạn bảo hành.
                            </p>
                            <p>
                                <img src="${pageContext.request.contextPath}/public/images/cart/check.png" alt="">
                                Sản phẩm không có phiếu bảo hành của Nhà Xinh.
                            </p>

                        </div>
                    </div>
                    <div id="delivery-panels">
                        <div id="content-vanchuyen" class="delivery-panels-content">
                            <strong>Giao hàng tận nơi</strong>
                            <p>
                                Nhà Xinh cung cấp dịch vụ giao hàng tận nơi, lắp ráp và sắp xếp vị trí theo đúng ý muốn
                                của quý khách:
                            </p>
                            <p>
                                - MIỄN PHÍ giao hàng trong các Quận nội thành Tp.Hồ Chí Minh và Hà Nội, áp dụng cho các
                                đơn hàng trị giá trên 10 triệu.
                            </p>
                            <p>
                                - Đối với khu vực các tỉnh lân cận: Tính phí hợp lý theo dựa trên quãng đường vận chuyển
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="review-section">
        <h2>ĐÁNH GIÁ SẢN PHẨM</h2>
        <div class="rating-overview">
            <div class="rating-score">
                <span>4.8</span>
                <p>trên 5</p>
                <p>⭐⭐⭐⭐⭐</p>
            </div>
            <div class="rating-filters">
                <button>Tất Cả</button>
                <button>5 Sao (2.5k)</button>
                <button>4 Sao (176)</button>
                <button>3 Sao (52)</button>
                <button>2 Sao (10)</button>
                <button>1 Sao (26)</button>
            </div>
        </div>

        <div class="review">
            <div class="review-header">
                <strong>vu**trong</strong>
                <span>5 ⭐</span>
                <p>2024-07-28 00:19 | Số lượng: 2</p>
            </div>
            <p>Ghế quá đẹp và chất lượng, đúng như hình. Giao hàng nhanh chóng, chuyên nghiệp 10đ. Đặt vào rất hợp với
                nội thất của nhà mình.</p>
        </div>

        <div class="review">
            <div class="review-header">
                <strong>nt**ngoc</strong>
                <span>5 ⭐</span>
                <p>2024-11-29 12:21 | Số lượng: 1</p>
            </div>
            <p>
                Nhân viên rất nhiệt tình có hỗ trợ trả hàng hoàn tiền khi khách không ưng, đầu tiên
                mình định trả hàng rồi mà chả hiểu điều gì khiến mình giữ lại!ghế không có chỗ nào để chê, đẹp luôn.
            </p>
        </div>

        <div class="product-review">
            <h3>Đánh giá sản phẩm</h3>
            <textarea placeholder="Nhập đánh giá của bạn ở đây..." rows="1"></textarea>
            <button type="submit">Gửi đánh giá</button>
        </div>
    </div>

    <div id="similar">
        <div class="title-similar">
            <h2>Có thể bạn cũng thích</h2>
        </div>
        <div class="center-box">
            <div class="row">
                <c:forEach var="p" items="${productOfCate}">
                    <div class="col-md-3">
                        <div class="card product-card product" data-id="${p.id}" data-name="${p.proName}"
                             data-img="${p.thumb}" data-price="${p.price}">
                            <a href="product?id=${p.id}&atributeID=${p.atributeID}&cateID=${p.cateID}">
                                <img src="${p.thumb}"
                                     alt="${p.proName}">
                            </a>
                            <div class="card-body">
                                <h6 class="product-name">${p.proName}</h6>
                                <div class="like-price-product favourite-product" data-id="${p.id}"
                                     data-user="${sessionScope.auth.id}">
                                    <span class="product-price"><f:formatNumber type="currency" currencySymbol="đ"
                                                                                value="${p.price}"/></span>
                                    <button class="wishlist-button">
                                        <i class="bi bi-heart"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="cart-see-more-btns">
                                <div class="row">
                                    <div class="col-sm-7 col-md-7">
                                        <div class="cart-btn use-button fake-btn" style="border: none">
                                            <button class="add-to-cart" style="font-size: 11px; font-weight: bold; padding: 10px 5px">
                                                THÊM VÀO GIỎ
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-sm-5 col-md-5">
                                        <div class="use-button fake-btn">
                                            <a href="product?id=${p.id}&atributeID=${p.atributeID}&cateID=${p.cateID}">
                                                <p>XEM THÊM</p></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<!-- FOOTER -->
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
    function guaraSelected() {
        const btnbaohanh = document.getElementById("guarantee-tab")
        const btnvanchuyen = document.getElementById("delivery-tab")
        const baohanh = document.getElementById("guarantee-panels")
        const vanchuyen = document.getElementById("delivery-panels")
        const productDetail = document.getElementById("product-details")
        if (btnbaohanh.ariaSelected === "false") {
            btnbaohanh.ariaSelected = "true"
            btnvanchuyen.ariaSelected = "false"
            baohanh.style.visibility = "visible"
            vanchuyen.style.visibility = "hidden"
            btnbaohanh.style.color = "black"
            btnbaohanh.style.borderBottomColor = "#fbaf1a"
            btnvanchuyen.style.borderBottomColor = "white"
            btnvanchuyen.style.color = "#7d7d7d"
            productDetail.style.height = "400%"
        }
    }

    function delSelected() {
        const btnbaohanh = document.getElementById("guarantee-tab")
        const btnvanchuyen = document.getElementById("delivery-tab")
        const baohanh = document.getElementById("guarantee-panels")
        const vanchuyen = document.getElementById("delivery-panels")
        const productDetail = document.getElementById("product-details")
        if (btnvanchuyen.ariaSelected === "false") {
            btnvanchuyen.ariaSelected = "true"
            btnbaohanh.ariaSelected = "false"
            baohanh.style.visibility = "hidden"
            vanchuyen.style.visibility = "visible"
            btnvanchuyen.style.color = "black"
            btnvanchuyen.style.borderBottomColor = "#fbaf1a"
            btnbaohanh.style.borderBottomColor = "white"
            btnbaohanh.style.color = "#7d7d7d"
            productDetail.style.height = "1000px"
        }
    }

    function plusQuantity() {
        const currQuan = document.getElementById("input-quantity")
        const newQuan = parseInt(currQuan.getAttribute("value")) + 1
        // document.getElementById("input-quantity").ariaValueNow   = currQuan+1 +""
        currQuan.setAttribute("value", newQuan)
    }

    function minusQuantity() {
        const currQuan = document.getElementById("input-quantity")
        const newQuan = parseInt(currQuan.getAttribute("value")) - 1
        // document.getElementById("input-quantity").ariaValueNow   = currQuan+1 +""
        if (newQuan > 0) {
            currQuan.setAttribute("value", newQuan)
        }
    }

    function openNav() {
        document.getElementById("myNav").style.width = "20%";
        document.getElementById("background-trans").hidden = false;
    }

    function closeNav() {
        document.getElementById("myNav").style.width = "0%";
        document.getElementById("background-trans").hidden = true;
    }

    document.querySelectorAll('.wishlist-button').forEach(function (heart) {
        heart.addEventListener('click', function () {
            heart.classList.toggle('clicked')
        })
    })
    // Ngăn cuộn
    const mask = document.getElementById('mask');

    function showImage() {
        document.body.style.overflow = 'hidden';
        mask.style.opacity = 1;
        mask.style.zIndex = 1000;

    }

    // Cho phép cuộn lại
    function hiddenImage() {
        document.body.style.overflow = 'auto';
        mask.style.opacity = 0;
        mask.style.zIndex = -1000;
    }

    document.getElementById('mask').addEventListener('click', hiddenImage);

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
