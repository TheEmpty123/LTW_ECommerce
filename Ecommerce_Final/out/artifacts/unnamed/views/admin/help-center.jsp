<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Help Center</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/style.css" />
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            color: #333;
        }

        /* Header */
        .header-bar {
            background-image: url('${pageContext.request.contextPath}/public/images/banners/img-2.jpg');
            /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            padding: 50px 20px;
            text-align: center;
            color: #fff;
            border-radius: 10px;
            margin: 20px;
        }

        .header h1 {
            font-size: 2em;
            margin-bottom: 10px;
        }

        .header p {
            font-size: 1em;
            opacity: 0.8;
        }

        /* Search bar */
        .search-bar {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .search-bar input[type="text"] {
            width: 80%;
            max-width: 500px;
            padding: 10px;
            border-radius: 20px;
            border: none;
            outline: none;
            font-size: 1em;
            padding-left: 15px;
        }

        /* Content Sections */
        .content-section {
            background-color: #fff;
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .content-section h2 {
            font-size: 1.5em;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            color: #ff5722;
            /* Icon color */
        }

        .content-section h2 img {
            margin-right: 10px;
        }

        .content-section p {
            font-size: 1em;
            line-height: 1.6;
            color: #666;
        }

        /* Footer */
        .footer {
            text-align: center;
            padding: 10px;
            font-size: 0.9em;
            color: #888;
        }

        .footer a {
            color: #ff5722;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<input type="checkbox" id="sidebar-toggle" />
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
            <input type="search" placeholder="Search" />
        </div>

        <div class="social-icons">
            <span class="ti-bell"></span>
            <span class="ti-comment"></span>
            <div></div>
        </div>
    </header>
    <div class="header-bar">
        <h1>Help Center</h1>
        <p>Our code of conduct and your pledge to be an upstanding member of the product</p>

        <div class="search-bar">
            <input type="text" placeholder="Search ...">
        </div>
    </div>

    <div class="content-section">
        <h2> Getting Started</h2>
        <p>Welcome to Larkon Dive into basic for a swift on boarding experience.</p>
    </div>

    <div class="content-section">
        <h2>Admin Settings</h2>
        <p>Learn how to manage your current workspace or your enterprise spacet.</p>
    </div>

    <div class="content-section">
        <h2> Server Setup</h2>
        <p>Connect, simplify, and automate. Discover the power of apps and tools..</p>
    </div>

    <div class="content-section">
        <h2>Login And Verification</h2>
        <p>Read on to learn how to sign in with your email address, or your Apple or Google.</p>
    </div>

    <div class="content-section">
        <h2>Account Setup</h2>
        <p>Adjust your profile and preferences to make ChatCloud work just for you</p>
    </div>

    <div class="content-section">
        <h2>Trust & Safety
        </h2>
        <p>Trust on our current database and learn how we distribute your data.
        </p>
    </div>

    <div class="content-section">
        <h2>Permissions</h2>
        <p>Permission for you and others to join and work within a workspace</p>
    </div>

    <div class="footer">
        From <a href="https://github.com/TheEmpty123/LTW_ECommerce">The Empty</a> with love. ❤️
    </div>
</div>
</body>
</html>
