<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.ecommerce.Bean.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Admin Management</title>
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

    <%@ include file="menu-bar.jsp" %>

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
        <h3 class="dash-address">
            <a href="/admin/dashboard">Home</a>/<a href="#">admins</a>
        </h3>

        <div class="dash-cards">

            <div class="card-single">
                <div class="card-body">
                    <span class="ti-id-badge"></span>
                    <div>
                        <h5>Number of Admins</h5>
                        <h4>${totalAdmin}</h4>
                    </div>
                </div>
            </div>

        </div>

        <section class="recent">
            <div class="activity-grid-alt">
                <div class="activity-card">

                    <div>
                        <div class="search-wrapper">
                            <h3>Admin List</h3>
                            <span class="ti-search"></span>
                            <input type="search" placeholder="Search content here...">
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table>
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Email Address</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:if test="${not empty adminList}">
                                <c:forEach var="user" items="${adminList}">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.username}</td>
                                        <td>${user.email}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${user.statusUser eq 'ENABLE'}">
                                                    <span class="badge success">Available</span>
                                                </c:when>
                                                <c:when test="${user.statusUser eq 'DISABLE'}">
                                                    <span class="badge alert">Disabled</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="">
                                                <span class="ti-pencil-alt"></span>
                                            </a>
                                            <a href="">
                                                <span class="ti-trash"></span>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                            </tbody>
                        </table>
                    </div>

                    <div class="pagination">
                        <a href="#add-user" class="add-user-btn">Add user</a>
                    </div>

                </div>
            </div>
        </section>

    </main>

</div>

</body>
</html>
