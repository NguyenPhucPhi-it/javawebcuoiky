<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/products.css">
</head>
<body>
<div class="container-fluid main-page">
    <div class="app-main">
        <nav class="sidebar bg-primary">
            <ul>
                <li><a href="/admin/dashboard">Dashboards</a></li>
                <li><a href="/admin/products">Quản lí sản phẩm</a></li>
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
                        <!-- <%-- Preview ảnh trước khi upload --%> -->
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