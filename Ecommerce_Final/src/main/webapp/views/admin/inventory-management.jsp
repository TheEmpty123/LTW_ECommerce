<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Inventory Management</title>
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
            <div></div>
        </div>
    </header>

    <main>

        <h2 class="dash-title">Warehouse Panel</h2>

        <div class="dash-cards">
            <div class="card-single">
                <div class="card-body">
                    <span class="ti-package"></span>
                    <div>
                        <h5>Total Product Items</h5>
                        <h4>${totalProductItems} sản phẩm</h4>
                    </div>
                </div>
            </div>

            <div class="card-single">
                <div class="card-body">
                    <span class="ti-export"></span>
                    <div>
                        <h5>In Stock Product</h5>
                        <h4>${totalInStock} sản phẩm</h4>
                    </div>
                </div>
            </div>

            <div class="card-single">
                <div class="card-body">
                    <span class="ti-import"></span>
                    <div>
                        <h5>Out Of Stock Product</h5>
                        <h4>${totalOutOfStock} sản phẩm</h4>
                    </div>
                </div>
            </div>

        </div>

        <section class="recent">
            <div class="activity-grid-alt2">
                <div class="activity-card">
                    <div class="table-responsive">
                        <table>
                            <thead>
                            <tr>
                                <th>WareH ID</th>
                                <th>Name</th>
                                <th>Location</th>
                                <th>Manager</th>
                                <th>Contact Number</th>
                                <th>Stock Available</th>
                                <th>Revenue</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="w" items="${wh}">
                                <tr>
                                    <td>${w.id}</td>
                                    <td>${w.name}</td>
                                    <td>${w.address}</td>
                                    <td>${w.manager}</td>
                                    <td>${w.phone}</td>
                                    <td>${w.stock}</td>
                                    <td>${w.revenueF}</td>
                                    <td>
                                        <a href="/admin/edit-wh?id=${w.id}">
                                            <span class="ti-pencil-alt"></span>
                                        </a>
                                        <a href="/admin/edit-wh?id=${w.id}">
                                            <span class="ti-trash"></span>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>
