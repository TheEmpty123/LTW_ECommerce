<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Discount</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/add-product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/add-discount.css">
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

                    <!-- Right section: Product details -->
                    <div class="right-section">
                        <h2>Coupon Information</h2>
                        <form>
                            <!-- Name and Category on the same row -->
                            <div class="form-row">

                                <div class="form-group">
                                    <label for="code">Code</label>
                                    <input type="text" id="code" name="code" placeholder="Enter discount code"
                                           required>
                                </div>
                                <div class="form-group">
                                    <label for="type">Coupons Types</label>
                                    <select id="type" name="type" required>
                                        <option value="">Select type</option>
                                        <option value="SHIP">Free Shipping</option>
                                        <option value="PERCENT">Percentage</option>
                                        <option value="AMOUNT">Fixed Amount</option>
                                        <!-- Add more categories as needed -->
                                    </select>
                                </div>
                            </div>

                            <!-- Stock and Price on the same row -->
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="limits">Limit</label>
                                    <input type="number" id="limits" name="limits" placeholder="Enter limits uses"
                                           required>
                                </div>
                                <div class="form-group">
                                    <label for="value">Value</label>
                                    <input type="number" id="value" name="value" placeholder="Enter discount value"
                                           required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label>Coupon Status</label>
                                    <div class="hidden-toggles">
                                        <input name="status" type="radio" id="active" class="hidden-toggles__input"
                                               checked>
                                        <label for="active" class="hidden-toggles__label">Active</label>

                                        <input name="status" type="radio" id="inactive"
                                               class="hidden-toggles__input">
                                        <label for="inactive" class="hidden-toggles__label">Inactive</label>

                                        <input name="status" type="radio" id="plan" class="hidden-toggles__input">
                                        <label for="plan" class="hidden-toggles__label">Future plan</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label>Date Schedule</label>
                                    <div class="date-container">
                                        <label for="start">Start date:</label>
                                        <input type="date" id="start" name="trip-start" value="" required/>
                                    </div>
                                    <div>
                                        <label for="end">End date:</label>
                                        <input type="date" id="end" name="trip-end" value="" required/>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="create-btn">Create Product</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>

</div>

</body>
</html>
