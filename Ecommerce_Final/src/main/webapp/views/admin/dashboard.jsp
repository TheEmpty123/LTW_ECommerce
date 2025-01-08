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
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/style.css">
</head>
<body>
    <input type="checkbox" id="sidebar-toggle">

    <%@ include file="menu-bar.jsp"%>

<%--    <div class="sidebar">--%>
<%--        <div class="sidebar-header">--%>
<%--            <h3 class="brand">--%>
<%--                <span class="ti-panel"></span>--%>
<%--                <span>Dashboard</span>--%>
<%--            </h3>--%>
<%--            <label for="sidebar-toggle" class="ti-menu-alt"></label>--%>
<%--        </div>--%>

<%--        <div class="sidebar-menu">--%>
<%--            <ul>--%>
<%--                <!-- For management -->--%>
<%--                <li>--%>
<%--                    <a class="separator">--%>
<%--                        General--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="dashboard.jsp">--%>
<%--                        <span class="ti-home"></span>--%>
<%--                        <span>Trang chủ</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="admin-management.jsp">--%>
<%--                        <span class="ti-wheelchair"></span>--%>
<%--                        <span>Admins</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="user-management.jsp">--%>
<%--                        <span class="ti-user"></span>--%>
<%--                        <span>Người dùng</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="role-permissions-management.jsp">--%>
<%--                        <span class="ti-agenda"></span>--%>
<%--                        <span>Vai trò & Quyền hạn</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="product-management.jsp">--%>
<%--                        <span class="ti-truck"></span>--%>
<%--                        <span>Quản lý sản phẩm</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="category-management.jsp">--%>
<%--                        <span class="ti-menu"></span>--%>
<%--                        <span>Quản lý danh mục</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="inventory-management.jsp">--%>
<%--                        <span class="ti-server"></span>--%>
<%--                        <span>Quản lý hàng tồn</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="order-management.jsp">--%>
<%--                        <span class="ti-receipt"></span>--%>
<%--                        <span>Quản lý đơn</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="promotions-discounts.jsp">--%>
<%--                        <span class="ti-ticket"></span>--%>
<%--                        <span>Giảm giá</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="purchases-management.jsp">--%>
<%--                        <span class="ti-money"></span>--%>
<%--                        <span>Thanh toán</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="sales-reports.jsp">--%>
<%--                        <span class="ti-bar-chart"></span>--%>
<%--                        <span>Báo cáo doanh thu</span>--%>
<%--                    </a>--%>
<%--                </li>--%>

<%--                <!-- For user self -->--%>

<%--                <li>--%>
<%--                    <a class="separator">Users</a>--%>
<%--                </li>--%>

<%--                <li>--%>
<%--                    <a href="profile-management.jsp">--%>
<%--                        <span class="ti-user"></span>--%>
<%--                        <span>Profile</span>--%>
<%--                    </a>--%>
<%--                </li>--%>

<%--                <!-- For support -->--%>

<%--                <li>--%>
<%--                    <a class="separator">--%>
<%--                        Support--%>
<%--                    </a>--%>
<%--                </li>--%>

<%--                <li>--%>
<%--                    <a href="privacy-policy.jsp">--%>
<%--                        <span class="ti-info-alt"></span>--%>
<%--                        <span>Privacy policy</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="faqs.jsp">--%>
<%--                        <span class="ti-help-alt"></span>--%>
<%--                        <span>FAQs</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--                <li>--%>
<%--                    <a href="help-center.jsp">--%>
<%--                        <span class="ti-headphone-alt"></span>--%>
<%--                        <span>Help center</span>--%>
<%--                    </a>--%>
<%--                </li>--%>

<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    --%>

    <div class="main-content">

        <header>
            <div class="search-wrapper">
                <span class="ti-search"></span>
                <input type="search" placeholder="Search">
            </div>

            <div class="social-icons">
                <span class="ti-bell"></span>
                <span class="ti-comment"></span>
                <span></span>
                <h4>The Empty</h4>
                <div></div>
            </div>
        </header>

        <main>

            <h2 class="dash-title">Overview</h2>

            <div class="dash-cards">
                <div class="card-single">
                    <div class="card-body">
                        <span class="ti-briefcase"></span>
                        <div>
                            <h5>Tổng doanh thu</h5>
                            <h4>${requestScope.get("totalRevenue")} vnđ</h4>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="">View all</a>
                    </div>
                </div>

                <div class="card-single">
                    <div class="card-body">
                        <span class="ti-reload"></span>
                        <div>
                            <h5>Đang xử lý</h5>
                            <h4>${requestScope.get("totalProcessing")} vnđ</h4>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="">View all</a>
                    </div>
                </div>

                <div class="card-single">
                    <div class="card-body">
                        <span class="ti-check-box"></span>
                        <div>
                            <h5>Đã xử lý</h5>
                            <h4>${requestScope.get("totalShipped")} vnđ</h4>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="">View all</a>
                    </div>
                </div>
            </div>


            <section class="recent">
                <div class="activity-grid">
                    <div class="activity-card">
                        <h3>Đơn hàng gần đây</h3>

                        <div class="table-responsive">
                            <table>
                                <thead>
                                <tr>
                                    <th>Mã Đơn</th>
                                    <th>Ngày Đặt</th>
                                    <th>Tổng Giá</th>
                                    <th>Tình trạng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty recentOrders}">
                                    <c:forEach var="entry" items="${recentOrders}">
                                        <tr>
                                            <td>${entry.id}</td>
                                            <td>${entry.createDate}</td>
                                            <td>${entry.totalS} vnđ</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${entry.shippingStatus eq 'Delivering'}">
                                                        <span class="badge warning"><span class="ti-truck"></span> Delivering</span>
                                                    </c:when>
                                                    <c:when test="${entry.shippingStatus eq 'Completed'}">
                                                        <span class="badge success"><span class="ti-check"></span> Success</span>
                                                    </c:when>
                                                    <c:when test="${entry.shippingStatus eq 'Packaging'}">
                                                        <span class="badge warning"><span class="ti-package"></span> Packaging...</span>
                                                    </c:when>
                                                    <c:when test="${entry.shippingStatus eq 'Cancelled'}">
                                                        <span class="badge alert"><span class="ti-close"></span> Cancelled</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge info">Unknown Status</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="summary">
                        <div class="summary-card">
                            <div class="summary-single">
                                <span class="ti-id-badge"></span>
                                <div>
                                    <h5>${totalEmployee}</h5>
                                    <small>Số lượng nhân viên</small>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </section>

        </main>

    </div>

</body>
</html>
