<%--
  Created by IntelliJ IDEA.
  User: KhanhDuy
  Date: 12/19/2024
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
  <title>Product Management</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/popup.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/admin/filter-style.css">
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
          <a href="${pageContext.request.contextPath}dashboard.jsp">
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

    <!-- Pop up -->

    <div id="iframePopup" class="modal">
      <div class="modal-content">
        <span class="close">&times;</span>
        <iframe src="add-stock.jsp" frameborder="0"></iframe>
      </div>
    </div>

    <!-- End pop up -->

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

        <!-- Filter -->
        <div class="filter-container">
          <div class="filter">
            <div class="filter-component">
              <h2>Category:</h2>
            </div>

            <!-- Filter Box -->
            <div class="filter-component">
              <select id="productCategory" name="productCategory">
                <option value="">Select category</option>
                <option value="Kệ phòng khách" selected>Kệ phòng khách</option>
                <option value="Bàn nước">Bàn nước</option>
                <option value="Ghế dài & đôn">Ghế dài & đôn</option>
                <option value="Đèn trang trí">Đèn trang trí</option>
                <option value="Giường">Giường</option>
                <option value="Ghế Bar">Ghế Bar</option>
                <option value="Phòng khách">Phòng khách</option>
                <option value="Armchair">Armchair</option>
                <option value="Bàn bên">Bàn bên</option>
                <option value="Tủ giày">Tủ giày</option>
                <option value="Tủ ly">Tủ ly</option>
                <option value="Sofa">Sofa</option>
                <option value="Đồng hồ trang trí">Đồng hồ trang trí</option>
                <option value="Tủ áo">Tủ áo</option>
                <option value="Bình trang trí">Bình trang trí</option>
                <option value="Khung gương">Khung gương</option>
                <option value="Bàn làm việc">Bàn làm việc</option>
                <!-- Add more categories as needed -->
              </select>
            </div>
          </div>

          <div class="filter">
            <div class="filter-component">
              <h2>Warehouse:</h2>
            </div>

            <!-- Filter Box -->
            <div class="filter-component">
              <select id="inventory" name="inventory">
                <option value="">Select inventory</option>
                <option value="WH-001">Hợp Tiến Logistics</option>
                <option value="WH-002">Noi Bai Cargo Terminal Service JSC</option>
                <option value="WH-003">SPX Châu Phú</option>
                <option value="WH-004">SPX Thống Nhất</option>
                <option value="WH-005">SPX Biên Hòa 01</option>
              </select>
            </div>
          </div>
        </div>



        <div class="activity-grid-alt2">
          <div class="activity-card">

            <div>
              <div class="search-wrapper">
                <h3>All Product List</h3>
                <span class="ti-search"></span>
                <input type="search" placeholder="Search content here...">
                <div class="pagination">
                  <a href="add-product.jsp" class="add-product-btn">Add product</a>
                </div>

              </div>
            </div>



            <div class="table-responsive">
              <table>
                <thead>
                <tr>
                  <th>Id</th>
                  <th>Product Name</th>
                  <th>Price</th>
                  <th>Stock</th>
                  <th>Category</th>
                  <th>Rating</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>#001</td>
                  <td class="td-product">
                    <img src="${pageContext.request.contextPath}/public/images/all-products/1.jpg" alt="">
                    Kệ 3 tầng Gold
                  </td>
                  <td>24,480,000₫</td>
                  <td>486 Item Left
                    <h4>155 Sold</h4>
                  </td>
                  <td>Kệ phòng khách</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  5.0
                                              </span>
                    <h5>44 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
                      <span class="ti-pencil-alt"></span>
                    </a>
                    <a href="#">
                      <span class="ti-trash"></span>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td>#003</td>
                  <td class="td-product">
                    <img src="${pageContext.request.contextPath}/public/images/all-products/71.jpg" alt="">
                    Bàn nước Dura
                  </td>
                  <td>14,900,001₫</td>
                  <td>66 Item Left
                    <h4>15 Sold</h4>
                  </td>
                  <td>Bàn nước</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  4.0
                                              </span>
                    <h5>13 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
                      <span class="ti-pencil-alt"></span>
                    </a>
                    <a href="#">
                      <span class="ti-trash"></span>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td>#002</td>
                  <td class="td-product">
                    <img src="${pageContext.request.contextPath}/public/images/all-products/81.jpg" alt="">
                    Đôn Orientale da beige R5
                  </td>
                  <td>28,860,000₫</td>
                  <td>124 Item Left
                    <h4>18 Sold</h4>
                  </td>
                  <td>Kệ phòng khách</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  4.5
                                              </span>
                    <h5>5 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
                      <span class="ti-pencil-alt"></span>
                    </a>
                    <a href="#">
                      <span class="ti-trash"></span>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td>#004</td>
                  <td class="td-product">
                    <img src=".${pageContext.request.contextPath}/public/images/all-products/91.jpg" alt="">
                    Đèn bàn Gianfranco Gunmetal
                  </td>
                  <td>32,880,000₫</td>
                  <td>1,028 Item Left
                    <h4>256 Sold</h4>
                  </td>
                  <td>Đèn trang trí</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  4.8
                                              </span>
                    <h5>108 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
                      <span class="ti-pencil-alt"></span>
                    </a>
                    <a href="#">
                      <span class="ti-trash"></span>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td>#005</td>
                  <td class="td-product">
                    <img src="${pageContext.request.contextPath}/public/images/all-products/11.jpg" alt="">
                    Giường Coastal vàng 1m6
                  </td>
                  <td>28,900,000₫</td>
                  <td>128 Item Left
                    <h4>96 Sold</h4>
                  </td>
                  <td>Giường</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  3.7
                                              </span>
                    <h5>99 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
                      <span class="ti-pencil-alt"></span>
                    </a>
                    <a href="#">
                      <span class="ti-trash"></span>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td>#006</td>
                  <td class="td-product">
                    <img src="${pageContext.request.contextPath}/public/images/all-products/21.jpg" alt="">
                    Tủ ly cao Lake CS6076-4 màu smoke
                  </td>
                  <td>28,900,000₫</td>
                  <td>128 Item Left
                    <h4>96 Sold</h4>
                  </td>
                  <td>Phòng ăn</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  3.7
                                              </span>
                    <h5>99 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
                      <span class="ti-pencil-alt"></span>
                    </a>
                    <a href="#">
                      <span class="ti-trash"></span>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td>#007</td>
                  <td class="td-product">
                    <img src="${pageContext.request.contextPath}/public/images/all-products/31.jpg" alt="">
                    Ghế Bar Bridge màu nâu Da Cognac
                  </td>
                  <td>29,950,001₫</td>
                  <td>1,242 Item Left
                    <h4>654 Sold</h4>
                  </td>
                  <td>Ghế bar</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  4.3
                                              </span>
                    <h5>245 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
                      <span class="ti-pencil-alt"></span>
                    </a>
                    <a href="#">
                      <span class="ti-trash"></span>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td>#008</td>
                  <td class="td-product">
                    <img src="${pageContext.request.contextPath}/public/images/all-products/41.jpg" alt="">
                    Sofa 2 chỗ Mây mới
                  </td>
                  <td>19,900,000₫</td>
                  <td>12 Item Left
                    <h4>32 Sold</h4>
                  </td>
                  <td>Phòng khách</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  4.3
                                              </span>
                    <h5>23 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
                      <span class="ti-pencil-alt"></span>
                    </a>
                    <a href="#">
                      <span class="ti-trash"></span>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td>#009</td>
                  <td class="td-product">
                    <img src="${pageContext.request.contextPath}/public/images/all-products/51.jpg" alt="">
                    Armchair Doulton vintage
                  </td>
                  <td>28,500,000₫</td>
                  <td>12 Item Left
                    <h4>32 Sold</h4>
                  </td>
                  <td>Armchair</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  4.3
                                              </span>
                    <h5>23 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
                      <span class="ti-pencil-alt"></span>
                    </a>
                    <a href="#">
                      <span class="ti-trash"></span>
                    </a>
                  </td>
                </tr>
                <tr>
                  <td>#010</td>
                  <td class="td-product">
                    <img src="${pageContext.request.contextPath}/public/images/all-products/61.jpg" alt="">
                    Bàn bên 3C-02
                  </td>
                  <td>7,990,000₫</td>
                  <td>12 Item Left
                    <h4>32 Sold</h4>
                  </td>
                  <td>Bàn bên</td>
                  <td>
                                              <span class="badge rating">
                                                  <span class="ti-star"></span>
                                                  4.3
                                              </span>
                    <h5>23 reviews</h5>
                  </td>
                  <td>
                    <a href="#" class="openIframePopup">
                      <span class="ti-plus"></span>
                    </a>
                    <a href="edit-product.jsp">
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
              <h6 class="show-entries">*Showing 1 to 10 of 152 entries</h6>
                <a href="#">&laquo;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">...</a>
                <a href="#">15</a>
                <a href="#">16</a>
                <a href="#">&raquo;</a>
            </div>

          </div>
        </div>
      </section>

    </main>

  </div>
  <script src="${pageContext.request.contextPath}/public/js/admin/popup.js"></script>
</body>
</html>
