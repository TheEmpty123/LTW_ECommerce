<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/add-product.css">
</head>
<body>
    <input type="checkbox" id="sidebar-toggle">
    <div class="sidebar">
        <div class="sidebar-header">
            <h3 class="brand">
                <span class="ti-panel"></span>
                <span>Dashboard</span>
            </h3>
            <label for="sidebar-toggle" class="ti-menu-alt"></label>
        </div>

        <div class="sidebar-menu">
            <ul>
                <!-- For management -->
                <li>
                    <a class="separator">
                        General
                    </a>
                </li>
                <li>
                    <a href="dashboard.jsp">
                        <span class="ti-home"></span>
                        <span>Trang chủ</span>
                    </a>
                </li>
                <li>
                    <a href="admin-management.jsp">
                        <span class="ti-wheelchair"></span>
                        <span>Admins</span>
                    </a>
                </li>
                <li>
                    <a href="user-management.jsp">
                        <span class="ti-user"></span>
                        <span>Người dùng</span>
                    </a>
                </li>
                <li>
                    <a href="role-permissions-management.jsp">
                        <span class="ti-agenda"></span>
                        <span>Vai trò & Quyền hạn</span>
                    </a>
                </li>
                <li>
                    <a href="product-management.jsp">
                        <span class="ti-truck"></span>
                        <span>Quản lý sản phẩm</span>
                    </a>
                </li>
                <li>
                    <a href="category-management.jsp">
                        <span class="ti-menu"></span>
                        <span>Quản lý danh mục</span>
                    </a>
                </li>
                <li>
                    <a href="inventory-management.jsp">
                        <span class="ti-server"></span>
                        <span>Quản lý hàng tồn</span>
                    </a>
                </li>
                <li>
                    <a href="order-management.jsp">
                        <span class="ti-receipt"></span>
                        <span>Quản lý đơn</span>
                    </a>
                </li>
                <li>
                    <a href="promotions-discounts.jsp">
                        <span class="ti-ticket"></span>
                        <span>Giảm giá</span>
                    </a>
                </li>
                <li>
                    <a href="purchases-management.jsp">
                        <span class="ti-money"></span>
                        <span>Thanh toán</span>
                    </a>
                </li>
                <li>
                    <a href="sales-reports.jsp">
                        <span class="ti-bar-chart"></span>
                        <span>Báo cáo doanh thu</span>
                    </a>
                </li>

                <!-- For user self -->

                <li>
                    <a class="separator">Users</a>
                </li>

                <li>
                    <a href="profile-management.jsp">
                        <span class="ti-user"></span>
                        <span>Profile</span>
                    </a>
                </li>

                <!-- For support -->

                <li>
                    <a class="separator">
                        Support
                    </a>
                </li>

                <li>
                    <a href="privacy-policy.jsp">
                        <span class="ti-info-alt"></span>
                        <span>Privacy policy</span>
                    </a>
                </li>
                <li>
                    <a href="faqs.jsp">
                        <span class="ti-help-alt"></span>
                        <span>FAQs</span>
                    </a>
                </li>
                <li>
                    <a href="help-center.jsp">
                        <span class="ti-headphone-alt"></span>
                        <span>Help center</span>
                    </a>
                </li>

            </ul>
        </div>
    </div>


    <div class="main-content">

        <header>
            <div class="search-wrapper">
                <span class="ti-search"></span>
                <input type="search" placeholder="Search">
            </div>

            <div class="social-icons">
                <span class="ti-bell"></span>
                <span class="ti-comment"></span>
                <div></div>
            </div>
        </header>

        <main>
            <section class="recent">
                <div class="activity-grid-alt5">

                    <div class="form-container">
                        <!-- Left section: Image upload and button -->
                        <div class="left-section">
                            <div class="img-upload">
                                <label for="productImg">Product Thumbnail</label>
                                <div class="img-preview">
                                    <img src="${pageContext.request.contextPath}/public/images/all-products/1.jpg" alt="">
                                </div>
                                <input type="file" id="productImg" name="productImg" accept="image/*">
                            </div>

                        </div>

                        <!-- Right section: Product details -->
                        <div class="right-section">
                            <h2>Edit Product ID #001</h2>
                            <form>
                                <!-- Name and Category on the same row -->
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="productName">Product Name</label>
                                        <input type="text" id="productName" name="productName"
                                               placeholder="Kệ 3 tầng Gold" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="productCategory">Product Categories</label>
                                        <select id="productCategory" name="productCategory" required>
                                            <option value="">Select category</option>
                                            <option value="Kệ phòng khách" selected>Kệ phòng khách</option>
                                            <option value="Bàn nước">Bàn nước</option>
                                            <option value="Ghế dài & đôn">Ghế dài & đôn</option>
                                            <option value="Đèn trang trí">Đèn trang trí</option>
                                            <option value="Giường">Giường</option>
                                            <option value="Ghế Bar">Ghế Bar</option>
                                            <option value="Phòng khách">Phòng khách</option>
                                            <option value="Armchair">Armchair</option>
                                            <option value="Bàn bên">Bàn bên</option>
                                            <option value="Tủ giày">Tủ giày</option>
                                            <option value="Tủ ly">Tủ ly</option>
                                            <option value="Sofa">Sofa</option>
                                            <option value="Đồng hồ trang trí">Đồng hồ trang trí</option>
                                            <option value="Tủ áo">Tủ áo</option>
                                            <option value="Bình trang trí">Bình trang trí</option>
                                            <option value="Khung gương">Khung gương</option>
                                            <option value="Bàn làm việc">Bàn làm việc</option>
                                            <!-- Add more categories as needed -->
                                        </select>
                                    </div>
                                </div>

                                <!-- Stock and Price on the same row -->
                                <div class="form-row">
                                    <!--
                                    <div class="form-group">
                                        <label for="stock">Stock</label>
                                        <input type="number" id="stock" name="stock" placeholder="Enter stock quantity"
                                            required>
                                    </div>
                                    -->
                                    <div class="form-group">
                                        <label for="price">Price (vnđ)</label>
                                        <input type="text" id="price" name="price" placeholder="24,480,000"
                                               required>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="productDescription">Description</label>
                                    <textarea id="productDescription" name="productDescription"
                                              placeholder="Enter product description"></textarea>
                                </div>

                                <button type="submit" class="create-btn">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>
    <script src="${pageContext.request.contextPath}/public/js/admin/currency.js"></script>
</body>
</html>
