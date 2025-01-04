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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/bootstrap-5.3.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/public/js/curtainmenu.js"></script>
    <script src="${pageContext.request.contextPath}/public/js/Cart.js"></script>
    <style>
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
    </style>
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
                <h4 style="font-weight: lighter; margin-left: -15px; font-size: large; margin-top: 10px;">
                    <c:if test="${sessionScope.auth != null}">
                        <a href="${pageContext.request.contextPath}/views/auth/Profile.jsp">
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
                <a href=""><img src="${pageContext.request.contextPath}/public/images/logos/logo3.png"
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


        <div id="list-product-cart">
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
                            <a href="del-cart?pid=${cp.id}" class="remove-to-cart" data-pid="${cp.id}">
                                <button class="close-btn">
                                    <i class="bi bi-x-circle"></i>
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div id="pay-pal">
            <div class="total-price">
                <div class="money-text">
                    <p>Thành tiền: </p>
                </div>
                <div class="money-number">
                    <p id="total-cart"><f:formatNumber type="currency" currencySymbol="đ"
                                       value="${sessionScope.cart.total}"/></p>
                </div>
            </div>
            <div class="watch-cart center-items">
                <a href="${pageContext.request.contextPath}/showCart">XEM GIỎ HÀNG</a>
            </div>
            <div class="check-out center-items">
                <a href="">THANH TOÁN</a>
            </div>
        </div>
    </div>
</div>
<!-- </div> -->

<div id="container">
    <div id="notification" class="notification hidden">Sản phẩm đã được thêm vào giỏ hàng!</div>
    <!-- IMAGE HEADER -->
    <div id="imageHeader">
        <div class="title-bg" style="age: url('${pageContext.request.contextPath}/public/images/banners/dongho.jpg')">
            <div class="title">
                <Strong style="padding: 10px; font-size: 30px;">${categories.cateName}</Strong><br>
                <a href="" style="font-weight: normal;">Trang chủ</a> / <a
                    href="${pageContext.request.contextPath}/list-product" style="font-weight: normal;">Sản phẩm</a> /
                <a
                        href="../product/Products.jsp" style="font-weight: bold;">${categories.cateName}</a>
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
                <c:forEach var="p" items="${productsForCate}">
                    <div class="col-md-3">
                        <div class="card product-card product" data-id="${p.id}" data-name="${p.proName}"
                             data-img="${p.thumb}" data-price="${p.price}">
                            <a href="product?id=${p.id}&atributeID=${p.atributeID}&cateID=${p.cateID}">
                                <img src="${p.thumb}"
                                     alt="${p.proName}">
                            </a>
                            <div class="card-body">
                                <h6 class="product-name">${p.proName}</h6>
                                <div class="like-price-product">
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
                                                <%--                                            <a href="add-cart?pid=${p.id}" style="color: black">--%>
                                            <button class="add-to-cart" style="font-size: 11px; font-weight: bold">THÊM
                                                VÀO GIỎ
                                            </button>
                                                <%--                                            </a>--%>
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
