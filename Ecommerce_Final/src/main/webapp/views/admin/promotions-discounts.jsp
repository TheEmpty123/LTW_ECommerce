<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Promotions Discounts</title>
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

            <h2 class="dash-title">Overview</h2>

            <div class="dash-cards-alt">
                <div class="card-single-alt2">
                    <div class="card-body">
                        <span class="ti-check"></span>
                        <div>
                            <h5>Available</h5>
                            <h4>16</h4>
                        </div>
                    </div>
                </div>

                <div class="card-single-alt">
                    <div class="card-body">
                        <span class="ti-truck"></span>
                        <div>
                            <h5>Discounted Total</h5>
                            <h4>656,000₫</h4>
                        </div>
                    </div>
                </div>

                <div class="card-single-alt3">
                    <div class="card-body">
                        <span class="ti-close"></span>
                        <div>
                            <h5>Expired</h5>
                            <h4>2</h4>
                        </div>
                    </div>
                </div>

            </div>

            <section class="recent">
                <div class="activity-grid-alt2">
                    <div class="activity-card">

                        <div>
                            <div class="search-wrapper">
                                <h3>All Orders List</h3>
                                <span class="ti-search"></span>
                                <input type="search" placeholder="Search content here...">
                                <div class="pagination">
                                    <a href="add-discount.jsp" class="add-product-btn">Create a discount plan</a>
                                </div>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table>
                                <thead>
                                <tr>
                                    <th>Code</th>
                                    <th>Discount</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>

                                <tr>
                                    <td>THISISACODE69</td>
                                    <td>200,000₫</td>
                                    <td>12 May 2023</td>
                                    <td>12 Jun 2023</td>
                                    <td>
                                                <span class="badge success">
                                                    <span class="ti-check"></span>
                                                    Active
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
                                    <td>IAMPOOR555</td>
                                    <td>1,000,000₫</td>
                                    <td>12 Nov 2023</td>
                                    <td>12 Jun 2030</td>
                                    <td>
                                                <span class="badge warning">
                                                    <span class="ti-close"></span>
                                                    Expired
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
                                    <td>POORBUTBETTER99</td>
                                    <td>10,000,000₫</td>
                                    <td>12 Nov 2023</td>
                                    <td>12 Jun 2030</td>
                                    <td>
                                                <span class="badge success">
                                                    <span class="ti-check"></span>
                                                    Active
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
                                    <td>IAMRICH6699</td>
                                    <td>100%</td>
                                    <td>12 Nov 2023</td>
                                    <td>12 Dec 2024</td>
                                    <td>
                                                <span class="badge success">
                                                    <span class="ti-check"></span>
                                                    Active
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
                                    <td>JUSTARANDOMDISCOUNT</td>
                                    <td>69,6969₫</td>
                                    <td>12 Nov 2023</td>
                                    <td>12 Dec 2024</td>
                                    <td>
                                                <span class="badge warning">
                                                    <span class="ti-close"></span>
                                                    Expired
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
