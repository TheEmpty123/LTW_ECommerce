<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.example.ecommerce.Bean.Order" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 4:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Sale Reports</title>
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

    <jsp:include page="menu-bar.jsp"/>
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
                        <h5>Total Revenue</h5>
                        <h4>${requestScope.get("totalRevenue")} vnđ</h4>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="/admin/orders">View all</a>
                </div>
            </div>

            <div class="card-single">
                <div class="card-body">
                    <span class="ti-reload"></span>
                    <div>
                        <h5>Pending</h5>
                        <h4>${requestScope.get("totalProcessing")} vnđ</h4>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="/admin/orders">View all</a>
                </div>
            </div>

            <div class="card-single">
                <div class="card-body">
                    <span class="ti-check-box"></span>
                    <div>
                        <h5>Processed</h5>
                        <h4>${requestScope.get("totalShipped")} vnđ</h4>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="/admin/orders">View all</a>
                </div>
            </div>
        </div>


        <section class="recent">
            <div class="activity-grid">
                <div class="activity-card">
                    <h3>Recent Orders</h3>

                    <div class="table-responsive">
                        <table>
                            <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Delivery Date</th>
                                <th>Total</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${not empty recentOrders}">
                                <c:forEach var="entry" items="${recentOrders}">
                                    <tr>
                                        <td>${entry.id}</td>
                                        <td>${entry.timeStamp}</td>
                                        <td>${entry.totalS} vnđ</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${entry.shippingStatus eq 'Delivering'}">
                                                    <span class="badge warning"><span class="ti-truck"></span> Delivering</span>
                                                </c:when>
                                                <c:when test="${entry.shippingStatus eq 'Completed'}">
                                                    <span class="badge success"><span
                                                            class="ti-check"></span> Success</span>
                                                </c:when>
                                                <c:when test="${entry.shippingStatus eq 'Packaging'}">
                                                    <span class="badge warning"><span class="ti-package"></span> Packaging...</span>
                                                </c:when>
                                                <c:when test="${entry.shippingStatus eq 'Cancelled'}">
                                                    <span class="badge alert"><span
                                                            class="ti-close"></span> Cancelled</span>
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
                                <small>Number of staff</small>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <br>
            <div class="activity-grid-alt4">
                <div class="activity-card">
                    <h3>Recent Order Values</h3>
                    <canvas id="total-revenue"></canvas>
                </div>

                <div class="activity-card">
                    <h3>Order Status (%)</h3>
                    <canvas id="order-status"></canvas>
                </div>
            </div>

        </section>

    </main>

</div>

<!--
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.min.js"></script>
data: [1500000, 1300000, 15000000, 9900000, 7200000]
-->

<script>
    var data1 = [${pa}, ${de}, ${pr}];
    var data2 = [];
    <c:forEach var="o" items="${recentOrders}">
    data2.push(${o.total});
    </c:forEach>
    var label2 = [];
    <c:forEach var="o" items="${recentOrders}">
    label2.push('${o.id}');
    </c:forEach>
</script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${pageContext.request.contextPath}/public/js/admin/chart1.js"></script>
<script src="${pageContext.request.contextPath}/public/js/admin/chart2.js"></script>
</body>
</html>
