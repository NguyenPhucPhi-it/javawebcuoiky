<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                    <li>
                      <a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a>
                    </li>
                      <li><a href="/admin/chat"><i class="fa-solid fa-message ico-side"></i>Chat khách hàng</a></li>
                    <li><li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li></li>

                </ul>
            </nav>
                    <div class="main-content">
                        <div class="container">
                            <h3 class="title-page">
                               Danh mục
                            </h3>
                            <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>
<c:if test="${not empty success}">
    <div class="alert alert-success">${success}</div>
</c:if>
                            <div class="d-flex justify-content-end">
                                <a href="${pageContext.request.contextPath}/admin/brands/add" 
                                class="btn btn-primary mb-2">Thêm danh mục</a>
                            </div>
                            <table id="example" class="table table-striped" style="width:100%">
                            <thead>
            <tr>
                <th>ID</th>
                <th>Tên danh mục</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${brands}">
                <tr>
                    <td>${b.id}</td>
                    <td>${b.brandName}</td>  
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/updateBrand/${b.id}" class="btn btn-warning btn-sm">
                            <i class="fa-solid fa-pen-to-square"></i> Sửa
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/brands/delete/${b.id}" class="btn btn-danger btn-sm"
                                         onclick="return confirm('Xóa sản phẩm này?')">
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
    <script>
        new DataTable('#example');
    </script>
</body>

</html>