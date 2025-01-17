<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Discount</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/add-product.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/add-discount.css">
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
            <div class="activity-grid-alt5">
                <div class="form-container">

                    <!-- Right section: Product details -->
                    <div class="right-section">
                        <h2>Coupon Information</h2>
                        <form method="post" action="/admin/add-discount">
                            <!-- Name and Category on the same row -->
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="code">Code</label>
                                    <input type="text" id="code" name="code" placeholder="Enter discount code" required>
                                </div>
                                <div class="form-group">
                                    <label for="type">Coupons Types</label>
                                    <select id="type" name="type" required>
                                        <option value="">Select type</option>
                                        <option value="percentage">Percentage</option>
                                        <option value="fix_value">Fixed Amount</option>
                                        <!-- Add more categories as needed -->
                                    </select>
                                </div>
                            </div>

                            <!-- Stock and Price on the same row -->
                            <div class="form-row">
                                <div class="form-group">
                                    <label for="limits">Limit</label>
                                    <input type="number" id="limits" name="limits" placeholder="Enter limits uses"
                                           required>
                                </div>
                                <div class="form-group">
                                    <label for="value">Value</label>
                                    <input type="number" id="value" name="value" placeholder="Enter discount value"
                                           required>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <label>Date Schedule</label>
                                    <div class="date-container">
                                        <label for="start">Start date:</label>
                                        <input type="date" id="start" name="trip-start" value="" required/>
                                    </div>
                                    <div>
                                        <label for="end">End date:</label>
                                        <input type="date" id="end" name="trip-end" value="" required/>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="create-btn">Create Coupon</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>

</div>

</body>
</html>
