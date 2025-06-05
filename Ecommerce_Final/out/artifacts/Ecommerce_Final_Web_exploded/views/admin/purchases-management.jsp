<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 4:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Purchases Management</title>
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
                <div class="activity-grid-alt2">
                    <div class="activity-card">

                        <div>
                            <div class="search-wrapper">
                                <h3>All Orders List</h3>
                                <span class="ti-search"></span>
                                <input type="search" placeholder="Search content here...">
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table>
                                <thead>
                                <tr>
                                    <th>Customer ID</th>
                                    <th>Order ID</th>
                                    <th>Total</th>
                                    <th>Payment Method</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td>#CUS_21130569</td>
                                    <td>#FUR-5491-LMN7</td>
                                    <td>9,490,000₫</td>
                                    <td>Cash</td>
                                    <td>
                                                <span class="badge success">
                                                    Completed
                                                </span>
                                    </td>
                                    <td>
                                        <a href="#">
                                            <span class="ti-pencil-alt"></span>
                                        </a>
                                        <a href="#">
                                            <span class="ti-trash"></span>
                                        </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>#CUS_22130158</td>
                                    <td>#FUR-8734-AXQ2</td>
                                    <td>19,490,000₫</td>
                                    <td>Bank transfer</td>
                                    <td>
                                                <span class="badge warning">
                                                    Pending...
                                                </span>
                                    </td>
                                    <td>
                                        <a href="#">
                                            <span class="ti-pencil-alt"></span>
                                        </a>
                                        <a href="#">
                                            <span class="ti-trash"></span>
                                        </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>#CUS_22130062</td>
                                    <td>#FUR-3287-QZX4</td>
                                    <td>199,490,000₫</td>
                                    <td>Bank transfer</td>
                                    <td>
                                                <span class="badge alert">
                                                    Cancelled
                                                </span>
                                    </td>
                                    <td>
                                        <a href="#">
                                            <span class="ti-pencil-alt"></span>
                                        </a>
                                        <a href="#">
                                            <span class="ti-trash"></span>
                                        </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>#FUR-7625-BTY9</td>
                                    <td>#CUS_21130569</td>
                                    <td>19,490,000₫</td>
                                    <td>Bank transfer</td>
                                    <td>
                                                <span class="badge success">
                                                    Completed
                                                </span>
                                    </td>
                                    <td>
                                        <a href="#">
                                            <span class="ti-pencil-alt"></span>
                                        </a>
                                        <a href="#">
                                            <span class="ti-trash"></span>
                                        </a>
                                    </td>
                                </tr>

                                <tr>
                                    <td>#FUR-4159-PKD3</td>
                                    <td>#CUS_21130569</td>
                                    <td>1,019,490,000₫</td>
                                    <td>Cash</td>
                                    <td>
                                                <span class="badge success">
                                                    Completed
                                                </span>
                                    </td>
                                    <td>
                                        <a href="#">
                                            <span class="ti-pencil-alt"></span>
                                        </a>
                                        <a href="#">
                                            <span class="ti-trash"></span>
                                        </a>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>

                        <div class="pagination">
                            <h6 class="show-entries">*Showing 1 to 5 of 5 entries</h6>
                                <a href="#">&laquo;</a>
                                <a href="#" class="active">1</a>
                                <a href="#">&raquo;</a>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>
</body>
</html>
