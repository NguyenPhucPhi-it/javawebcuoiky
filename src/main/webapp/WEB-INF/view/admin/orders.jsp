<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>
    <style>
        .badge-pending  { background:#ff9800; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
        .badge-confirm  { background:#2196f3; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
        .badge-shipping { background:#9c27b0; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
        .badge-done     { background:#4caf50; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
        .badge-cancel   { background:#f44336; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
    </style>
</head>
<body>
<div class="container-fluid main-page">
    <div class="app-main">
        <nav class="sidebar ">
            <ul>
               <li>
                        <a href="/admin/dashboard"><i class="fa-solid fa-house ico-side"></i>Dashboards</a>
                    </li>
                    
                    <li>
                        <a href="/admin/brands"><i class="fa-solid fa-folder-open ico-side"></i>Quản lí danh muc</a>
                    </li>
                    <li>
                        <a href="/admin/products"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí sản phẩm</a>
                    </li>
                    <li>
                        <a href="comment.html"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí bình luận</a>
                    </li>
                    <li>
                         <a href="/admin/post"><i class="fa-solid fa-user ico-side"></i>Quản lý bài viết</a>
                    </li>
                    
                       <li><a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a></li>
                   
                    <li><li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li></li>
            </ul>
        </nav>
        <div class="main-content">
            <div class="container">
                <h3 class="title-page">Quản lý đơn hàng</h3>
                <table id="example" class="table table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Người nhận</th>
                            <th>Email</th>
                            <th>SĐT</th>
                            <th>Địa chỉ</th>
                            <th>Trạng thái chung</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${orders}" varStatus="st">
                            <tr>
                                <td>${st.index + 1}</td>
                                <td>${o.receiverName}</td>
                                <td>${o.receiverEmail}</td>
                                <td>${o.receiverPhone}</td>
                                <td>${o.address}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${o.status == 'Chờ xác nhận'}">
                                            <span class="badge-pending">${o.status}</span>
                                        </c:when>
                                        <c:when test="${o.status == 'Đã xác nhận'}">
                                            <span class="badge-confirm">${o.status}</span>
                                        </c:when>
                                        <c:when test="${o.status == 'Đang giao'}">
                                            <span class="badge-shipping">${o.status}</span>
                                        </c:when>
                                        <c:when test="${o.status == 'Hoàn thành'}">
                                            <span class="badge-done">${o.status}</span>
                                        </c:when>
                                        <c:when test="${o.status == 'Đã hủy'}">
                                            <span class="badge-cancel">${o.status}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge-pending">${o.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/orders/${o.id}" 
                                       class="btn btn-info btn-sm">
                                        <i class="fa-solid fa-eye"></i> Xem & Cập nhật
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>new DataTable('#example');</script>
</body>
</html>