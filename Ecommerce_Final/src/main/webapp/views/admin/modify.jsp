<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Profile Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/add-product.css">
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
        <section class="recent">
            <div class="activity-grid-alt3">

                <div class="prof-card">
                    <div class="prof-flex">
                        <div class="prof-info">
                            <h1>Order id: #${o.id}</h1>
                            <div class="prof-details">
                                <h4>Oder at: ${o.createDate}</h4>
                            </div>
                            <div class="prof-details">
                                <h4>By: ${o.customer}</h4>
                            </div>
                            <div class="prof-details">
                                <h4>Total: ${o.totalF}</h4>
                            </div>
                            <div class="prof-details">
                                <h4>Discount: ${code}</h4>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="activity-card">
                    <div class="form-container">
                        <div class="left-section">
                            <h2>Chi tiết đơn hàng</h2>
                        </div>
                        <div class="right-section">
                            <h2>Order Information</h2>

                            <!-- Display error message -->
                            <c:if test="${not empty errorMessage}">
                                <div style="color: red;">
                                        ${errorMessage}
                                </div>
                            </c:if>

                            <!-- Display success message -->
                            <c:if test="${not empty successMessage}">
                                <div style="color: greenyellow;">
                                        ${successMessage}
                                </div>
                            </c:if>

                            <form method="post" action="/admin/edit-order">
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input type="text" id="phone" name="phone" placeholder="${ord.sdt}">
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label for="ship">Shipping Status</label>
                                        <select id="ship" name="ship">
                                            <option value="1">Packaging</option>
                                            <option value="2">Delivering</option>
                                            <option value="3">Completed</option>
                                            <option value="4">Cancelled</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="pay">Payment Status</label>
                                        <select id="pay" name="pay">
                                            <option value="1">Pending</option>
                                            <option value="2">Completed</option>
                                            <option value="3">Cancelled</option>
                                        </select>
                                    </div>
                                </div>
                                <button type="submit" class="submit-btn">Update</button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </section>

    </main>

</div>

</body>
</html>
