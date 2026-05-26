<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/products.css">
</head>
<body>
<div class="container-fluid main-page">
    <div class="app-main">
        <nav class="sidebar bg-primary">
            <ul>
                <li><a href="/admin/dashboard">Dashboards</a></li>
                <li><a href="/admin/products">Quản lí sản phẩm</a></li>
                <li><a href="/admin/brands">Quản lí danh mục</a></li>
            </ul>
        </nav>
        <div class="main-content">
            <div class="container">
                <h3 class="title-page">Thêm danh mục</h3>

                <%-- Không có ảnh thì dùng form thường, không cần enctype --%>
                <form action="${pageContext.request.contextPath}/admin/brands/add"
                      method="post">

                    <div class="mb-3">
                        <label>Tên danh mục</label>
                        <input type="text" name="brandName" class="form-control" required/>
                    </div>

                    <button type="submit" class="btn btn-primary">Lưu</button>
                    <a href="/admin/brands" class="btn btn-secondary">Hủy</a>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>