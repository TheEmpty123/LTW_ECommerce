<%@ page import="com.example.ecommerce.Bean.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.example.ecommerce.Bean.Role" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.example.ecommerce.Bean.Permission" %><%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>User Management</title>
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

        <h2 class="dash-title">Overview</h2>
        <h3 class="dash-address">
            <a href="/admin/dashboard">Home</a>/<a href="#">${CMD}</a>
        </h3>

        <div class="dash-cards">

            <div class="card-single">
                <div class="card-body">
                    <span class="ti-id-badge"></span>
                    <div>
                        <h5>Total Users</h5>
                        <h4>${totalUsers} accounts recorded</h4>
                    </div>
                </div>
            </div>

            <div class="card-single">
                <div class="card-body">
                    <span class="ti-check-box"></span>
                    <div>
                        <h5>Current Available User</h5>
                        <h4>${availableUsers} accounts recorded</h4>
                    </div>
                </div>
            </div>

            <div class="card-single">
                <div class="card-body">
                    <span class="ti-alert"></span>
                    <div>
                        <h5>Current Disabled User</h5>
                        <h4>${disabledUsers} accounts recorded</h4>
                    </div>
                </div>
            </div>

        </div>


        <section class="recent">

            <c:if test="${CMD eq 'users'}">
                <div class="activity-grid">
                    <div class="activity-card">

                        <%
                            int size = (int) request.getAttribute("totalUsers");
                            int startIndex = 0;
                            int currentPages = 1;
                            int showMax = 10;
                            int totalPages = (int) Math.ceil((double) size / (double) showMax);
                            String pageParam = request.getParameter("page");

                            if (pageParam != null) {
                                currentPages = Integer.parseInt(pageParam);
                            }

                            startIndex = (currentPages - 1) * showMax;
                            int endIndex = Math.min(startIndex + showMax, size);
                        %>

                        <div>
                            <div class="search-wrapper">
                                <h3>Users List</h3>
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
                                    <th>Role</th>
                                    <th>Created</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty users}">
                                    <%
                                        List<User> users = (List<User>) request.getAttribute("users");
                                        var roles = (Map<Integer, Role>) request.getAttribute("roles");
                                        for (int i = startIndex; i < endIndex; i++) {
                                            User u = users.get(i);
                                    %>
                                    <tr>
                                        <td><%=u.getId()%>
                                        </td>
                                        <td><%=u.getUsername()%>
                                        </td>
                                        <td><%=u.getEmail()%>
                                        </td>
                                        <td><%=roles.get(u.getRoleID()).getNameRole()%>
                                        </td>
                                        <td><%=Timestamp.valueOf(u.getCreateUser())%>
                                        </td>
                                        <td>
                                            <%
                                                var status = u.getStatusUser();
                                                switch (status) {
                                                    case ENABLE: {
                                            %>
                                            <span class="badge success">Available</span>
                                            <%
                                                    break;
                                                }
                                                case DISABLE: {

                                            %>
                                            <span class="badge alert">Disabled</span>
                                            <%
                                                    }
                                                }
                                            %>
                                        </td>
                                        <td>
                                            <a href="edit-user?id=<%=u.getId()%>">
                                                <span class="ti-pencil-alt"></span>
                                            </a>
                                            <a href="delete-user?id=<%=u.getId()%>">
                                                <span class="ti-trash"></span>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </c:if>

                                </tbody>
                            </table>
                        </div>

                        <div class="pagination">
                            <h6 class="show-entries">
                                *Showing <%=startIndex + 1%> to <%=endIndex%> of <%=size%> entries
                            </h6>
                            <a href="?page=<%=currentPages > 1 ? currentPages - 1 : 1 %>">&laquo;</a>
                            <%
                                boolean needDot = false;
                                for (int i = 1; i <= totalPages; i++) {
                                    String activeClass = (i == currentPages) ? "active" : "";
                                    if (i == 1 || i == totalPages) {
                                        needDot = true;
                            %>
                            <a href="?page=<%=i%>" class="<%=activeClass%>">
                                <%=i%>
                            </a>
                            <%
                            } else if (i < currentPages + 2 && i > currentPages - 2) {
                                needDot = true;
                            %>
                            <a href="?page=<%=i%>" class="<%=activeClass%>">
                                <%=i%>
                            </a>
                            <%
                            } else if (needDot) {
                                needDot = false;
                            %>
                            <a href="#" class="">...</a>
                            <%
                                    }
                                }
                            %>
                            <a href="?page=<%=currentPages < totalPages ? currentPages + 1 : totalPages %>">&raquo;</a>
                            <a href="add-user" class="add-user-btn">Add user</a>
                        </div>


                    </div>

                    <div class="summary">
                        <div class="summary-card">
                            <div class="summary-single">
                                <span class="ti-id-badge"></span>
                                <div>
                                    <h5>${totalUserWithModerator}</h5>
                                    <small>Number of moderator</small>
                                </div>
                            </div>
                            <div class="summary-single">
                                <span class="ti-home"></span>
                                <div>
                                    <h5>${agencies}</h5>
                                    <small>Number of agency</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </c:if>

            <c:if test="${CMD eq 'permissions'}">

                <!-- Error Message -->
                <c:if test="${not empty errorMessage}">
                    <div style="color: red;">
                            ${errorMessage}
                    </div>
                </c:if>

                <!-- Success Message -->
                <c:if test="">
                    <c:if test="${not empty successMessage}">
                        <div style="color: greenyellow;">
                                ${successMessage}
                        </div>
                    </c:if>
                </c:if>

                <div class="activity-grid-alt">
                    <div class="activity-card">
                        <div class="table-responsive">
                            <table>
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Assigned To</th>
                                    <th>Created Date & Time</th>
                                    <th>Last Update</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Permission> permissions = (List<Permission>) request.getAttribute("permissions");
                                    Map<Integer, Role> rolesMap = (Map<Integer, Role>) request.getAttribute("rolesMap");
                                    String badge = "sdf";

                                    for (var p : permissions) {
                                %>
                                <tr>
                                    <td><%=p.getPermissionName()%>
                                    </td>
                                    <td>
                                        <%
                                            for (var r : rolesMap.values()) {
                                                if (r.getPermission() != null && r.getPermission().contains(p.getPermissionName())) {
                                                    switch (r.getNameRole()) {
                                                        case "Manager":
                                        %>
                                        <span class="badge warning">Manager</span>
                                        <%
                                                break;
                                            case "Administrator":
                                        %>
                                        <span class="badge success">Administrator</span>
                                        <%
                                                break;
                                            case "Employee":
                                        %>
                                        <span class="badge dev">Employee</span>
                                        <%
                                                            break;
                                                    }
                                                }
                                            }
                                        %>
                                    </td>
                                    <td><%=Timestamp.valueOf(p.getCreateDate())%>
                                    </td>
                                    <td><%=Timestamp.valueOf(p.getLastUpdate())%>
                                    </td>
                                    <td>
                                        <a href="?id=<%=p.getId()%>" methods="post">
                                            <span class="ti-pencil-alt"></span>
                                        </a>
                                        <a href="?id=<%=p.getId()%>">
                                            <span class="ti-trash"></span>
                                        </a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </c:if>

        </section>

    </main>

</div>

</body>
</html>
