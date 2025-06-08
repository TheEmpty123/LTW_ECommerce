<%@ page import="com.example.ecommerce.Bean.User" %><%--
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

                        <c:if test="${method eq 'edit'}">
                            <form method="post" action="/admin/edit-user">
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" id="fullName" name="fullName" placeholder="${user.fullName}">
                                </div>
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" id="username" name="username" placeholder="${user.username}">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" placeholder="${user.email}">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" id="password" name="password" placeholder="Enter new password">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone No.</label>
                                    <input type="tel" id="phone" name="phone" placeholder="${user.phoneNum}">
                                </div>
                                <div class="form-group">
                                    <label for="key">Public Key</label>
                                    <input type="text" id="key" name="key" placeholder="${user.public_key}">
                                </div>
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select type="role" id="gender" name="gender">
                                        <option value="0">Male</option>
                                        <option value="1">Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="role">Role</label>
                                    <select type="role" id="role" name="role">
                                        <option value="1">Client</option>
                                        <option value="2">Manager</option>
                                        <option value="3">Employee</option>
                                        <option value="4">Administrator</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="status">Status</label>
                                    <select type="role" id="status" name="status">
                                        <option value="ENABLE">Enable</option>
                                        <option value="DISABLE">Disable</option>
                                    </select>
                                </div>
                                <button type="submit" class="submit-btn">Submit</button>
                            </form>
                        </c:if>
                        <c:if test="${method eq 'add'}">
                            <form method="post" action="/admin/add-user">
                                <div class="form-group">
                                    <label for="fullName">Full Name</label>
                                    <input type="text" id="fullName" name="fullName" placeholder="Enter full name">
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
                                    <label for="password">Password</label>
                                    <input type="password" id="password" name="password" placeholder="Enter new password" required>
                                </div>
                                <div class="form-group">
                                    <label for="gender">Gender</label>
                                    <select type="role" id="gender" name="gender">
                                        <option value="0">Male</option>
                                        <option value="1">Female</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="role">Role</label>
                                    <select type="role" id="role" name="role">
                                        <option value="1">Client</option>
                                        <option value="2">Manager</option>
                                        <option value="3">Employee</option>
                                        <option value="4">Administrator</option>
                                    </select>
                                </div>
                                <button type="submit" class="submit-btn">Submit</button>
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

</body>
</html>
