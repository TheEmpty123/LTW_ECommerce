<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Add User</title>
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
            <div class="activity-grid-alt3">

                <div class="prof-card-alt">
                    <div class="prof-flex">
                        <div class="prof-img-alt"></div>
                    </div>

                    <div class="text-center">
                        <button type="button">
                            <span class="ti-upload"></span>
                            <input type="file" id="fileInput" accept="image/*">
                        </button>
                    </div>
                </div>

                <div class="activity-card">
                    <div class="form-container">
                        <h2>User Information</h2>
                        <form>
                            <div class="form-group">
                                <label for="fullName">Full Name</label>
                                <input type="text" id="fullName" name="fullName" placeholder="Enter full name"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" id="username" name="username" placeholder="Enter username"
                                       required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" placeholder="Enter email" required>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone No.</label>
                                <input type="tel" id="phone" name="phone" placeholder="Enter phone number" required>
                            </div>
                            <div class="form-group">
                                <label for="role">Role</label>
                                <select type="role" id="role" name="role">
                                    <option value="CLIENT">Client</option>
                                    <option value="VIP_CLIENT">VIP client</option>
                                    <option value="MANAGER">Manager</option>
                                    <option value="EMPLOYEE">Employee</option>
                                    <option value="ADMINISTRATOR">Administrator</option>
                                </select>
                            </div>
                            <button type="submit" class="submit-btn">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

</body>
</html>