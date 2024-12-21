<%--
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
    <h3 class="dash-address">
      <a href="dashboard.jsp">Home</a>/<a href="#">admins</a>
    </h3>

    <div class="dash-cards">

      <div class="card-single">
        <div class="card-body">
          <span class="ti-id-badge"></span>
          <div>
            <h5>Number of Admins</h5>
            <h4>5</h4>
          </div>
        </div>
      </div>

      <div class="card-single">
        <div class="card-body">
          <span class="ti-check-box"></span>
          <div>
            <h5>Current Online Admins</h5>
            <h4>1</h4>
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
                <th>Role</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>1</td>
                <td>theempty</td>
                <td>emptythe.56@gmail.com</td>
                <td>Admin</td>
                <td>
                  <span class="badge success">Available</span>
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
              <tr>
                <td>2</td>
                <td>harvey2807</td>
                <td>harvey.2807@gmail.com</td>
                <td>Admin</td>
                <td>
                  <span class="badge warning">Disabled</span>
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
              <tr>
                <td>3</td>
                <td>PKhanhDuy</td>
                <td>pkhanhduy.48@gmail.com</td>
                <td>Admin</td>
                <td>
                  <span class="badge warning">Disabled</span>
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
              <tr>
                <td>4</td>
                <td>randomguy</td>
                <td>randomguy@hotmail.com</td>
                <td>Admin</td>
                <td>
                  <span class="badge alert">Suspected</span>
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
              <tr>
                <td>5</td>
                <td>nttoan</td>
                <td>nttoan.3004@gmail.com</td>
                <td>Admin</td>
                <td>
                  <span class="badge alert">Suspected</span>
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
              </tbody>
            </table>
          </div>

          <div class="pagination">
            <h6 class="show-entries">*Showing 1 to 5 of 5 entries</h6>
              <a href="#">&laquo;</a>
              <a href="#" class="active">1</a>
              <a href="#">&raquo;</a>
              <a href="add-user.jsp" class="add-user-btn">Add user</a>
          </div>

        </div>
      </div>
    </section>

  </main>

</div>

</body>
</html>
