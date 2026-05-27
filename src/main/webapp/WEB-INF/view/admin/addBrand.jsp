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
                        <a href="user.html"><i class="fa-solid fa-user ico-side"></i>Quản lí thành viên</a>
                    </li>
                    <li>
                        <a href="order.html"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản kí đơn hàng</a>
                    </li>
                    <li><li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a></li></li>

                </ul>
        </nav>
        <div class="main-content">
            <div class="container">
                <h3 class="title-page">Thêm danh mục</h3>
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