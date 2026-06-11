<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật danh mục</title>
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
                    <li>
                       <a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a>
                    </li>
                    <li><li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li></li>

                </ul>
        </nav>
        <div class="main-content">
            <div class="container">
                <h3 class="title-page">Cập nhật danh mục</h3>

                    <form action="${pageContext.request.contextPath}/admin/updateBrand" method="post">
                        
                        <div class="mb-3">
                            <input type="hidden" name="id" class="form-control" value="${brand.id}"/>
                        </div>

                        <div class="mb-3">
                            <label>Tên danh mục</label>
                            <input type="text" name="brandName" class="form-control" value="${brand.brandName}"/>
                        </div>

                        <button type="submit" class="btn btn-warning">
                            <i class="fa-solid fa-pen-to-square"></i> Lưu thay đổi
                        </button>
                        
                        <a href="${pageContext.request.contextPath}/admin/brands" class="btn btn-secondary">Hủy</a>
                    </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>