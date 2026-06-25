<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
 
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
                         <a href="/admin/comments"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí bình luận</a>
                    </li>
                    <li>
                         <a href="/admin/post"><i class="fa-solid fa-user ico-side"></i>Quản lý bài viết</a>
                    </li>
                   <li><a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a></li>
                    <li><a href="/admin/chat"><i class="fa-solid fa-message ico-side"></i>Chat khách hàng</a></li>
                    <li><li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li></li>

                </ul>
        </nav>

        <div class="main-content">
            <div class="container">
                <h3 class="title-page">Thêm sản phẩm</h3>
                <!-- up load anh -->
                <form action="${pageContext.request.contextPath}/admin/products/add"
                      method="post"
                      enctype="multipart/form-data">

                    <div class="mb-3">
                        <label>Tên sản phẩm</label>
                        <input type="text" name="name" class="form-control" required/>
                    </div>

                    <div class="mb-3">
                        <label>Giá</label>
                        <input type="number" name="price" class="form-control" step="0.01" required/>
                    </div>

                    <div class="mb-3">
                        <label>Khuyến mãi (%)</label>
                        <input type="number" name="discount" class="form-control" step="0.01"/>
                    </div>

                    <div class="mb-3">
                        <label>Số lượng</label>
                        <input type="number" name="quantity" class="form-control"/>
                    </div>

                    <div class="mb-3">
                        <label>Mô tả</label>
                        <textarea name="description" class="form-control" rows="3"></textarea>
                    </div>

                    <div class="mb-3">
                        <label>Hình ảnh</label>
                        <input type="file" name="imageFile" class="form-control" accept="image/*"
                               onchange="previewImage(event)"/>
                        <img id="preview" src="#" alt="Preview"
                             style="display:none; margin-top:10px; max-width:200px; border-radius:8px;"/>
                    </div>
                    <div class="mb-3">
                        <label>Danh mục</label>
                        <select name="id_brand" class="form-control" required>
                            <option value="">-- Chọn danh mục --</option>
                            <c:forEach var="b" items="${brands}">
                                <option value="${b.id}">${b.brandName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Lưu sản phẩm</button>
                    <a href="/admin/products" class="btn btn-secondary">Hủy</a>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function previewImage(event) {
        const preview = document.getElementById('preview');
        preview.src = URL.createObjectURL(event.target.files[0]);
        preview.style.display = 'block';
    }
</script>
</body>
</html>