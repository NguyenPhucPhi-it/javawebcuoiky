<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý bài viết</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
  
</head>
<body>
<div class="container-fluid main-page">
    <div class="app-main">
        <nav class="sidebar bg-primary">
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
                         <a href="/admin/comments"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí bình luận</a>
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
                <h3 class="title-page">Bài Viết</h3>
                <div class="d-flex justify-content-end">
                    <a href="${pageContext.request.contextPath}/admin/post/add"
                       class="btn btn-primary mb-2">Thêm bài viết</a>
                </div>
                <table id="example" class="table table-striped" style="width:100%">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tiêu đề</th>
                            <th>Ảnh</th>
                            <th>Trạng thái</th>
                            <th>Ngày tạo</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${posts}">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.title}</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/uploads/${p.image}"
                                         width="60" height="60" style="object-fit:cover; border-radius:6px;"
                                         onerror="this.src='${pageContext.request.contextPath}/assets/images/no-image.png'"/>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${p.status == 1}">
                                            <span class="badge bg-success">Hiển thị</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge bg-secondary">Ẩn</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${p.createdAt}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/admin/post/update/${p.id}"
                                       class="btn btn-warning btn-sm">
                                        <i class="fa-solid fa-pen-to-square"></i> Sửa
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/post/delete/${p.id}"
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('Xóa bài viết này?')">
                                        <i class="fa-solid fa-trash"></i> Xóa
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
<script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
<script>new DataTable('#example');</script>
</body>
</html>