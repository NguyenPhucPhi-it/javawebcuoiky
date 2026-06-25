<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${post.id == 0 ? 'Thêm' : 'Sửa'} bài viết</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid main-page">
    <div class="app-main">
        <nav class="sidebar">
            <ul>
                <li><a href="/admin/dashboard"><i class="fa-solid fa-house ico-side"></i>Dashboards</a></li>
                <li><a href="/admin/brands"><i class="fa-solid fa-folder-open ico-side"></i>Quản lí danh mục</a></li>
                <li><a href="/admin/products"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí sản phẩm</a></li>
                <li>  <a href="/admin/comments"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí bình luận</a></li>
                <li><a href="/admin/post"><i class="fa-solid fa-newspaper ico-side"></i>Quản lý bài viết</a></li>
                <li>
                      <a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a>
                    </li>
                  <li><a href="/admin/chat"><i class="fa-solid fa-message ico-side"></i>Chat khách hàng</a></li>
                <li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li>
            </ul>
        </nav>
        <div class="main-content">
            <div class="container">
                <h3 class="title-page">${post.id == 0 ? 'Thêm' : 'Sửa'} bài viết</h3>
                <a href="/admin/post" class="btn btn-secondary mb-3">← Quay lại</a>

              <form action="${pageContext.request.contextPath}/admin/post/save"
      method="post" enctype="multipart/form-data">
    
    <input type="hidden" name="id" value="${post.id}"/>

    <input type="hidden" name="image" value="${post.image}"/>

    <div class="mb-3">
        <label class="form-label">Tiêu đề</label>
        <input type="text" name="title" class="form-control"
               value="${post.title}" required/>
    </div>

    <div class="mb-3">
        <label class="form-label">Ảnh</label>
        <input type="file" name="file" class="form-control" accept="image/*"/>
        <c:if test="${post.image != null && post.image != ''}">
            <img src="${pageContext.request.contextPath}/assets/uploads/${post.image}"
                 height="80" class="mt-2" style="border-radius:6px;"/>
        </c:if>
    </div>

    <div class="mb-3">
        <label class="form-label">Nội dung</label>
        <textarea name="content" class="form-control" rows="8">${post.content}</textarea>
    </div>

    <div class="mb-3">
        <label class="form-label">Trạng thái</label>
        <select name="status" class="form-select">
            <option value="1" ${post.status == 1 ? 'selected' : ''}>Hiển thị</option>
            <option value="0" ${post.status == 0 ? 'selected' : ''}>Ẩn</option>
        </select>
    </div>

    <button type="submit" class="btn btn-primary">Lưu</button>
</form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
</body>
</html>