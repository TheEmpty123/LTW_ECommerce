<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 3:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Menu Bar</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/style.css">
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
                    <a href="/admin/dashboard">
                        <span class="ti-home"></span>
                        <span>Trang chủ</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/ad-mana">
                        <span class="ti-wheelchair"></span>
                        <span>Admins</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/users">
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
</body>
</html>
