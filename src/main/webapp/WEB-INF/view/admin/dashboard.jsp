<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/helper.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/iconfont.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/plugins.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
    <title>Document</title>
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
                        <a href="/admin/post"><i class="fa-solid fa-user ico-side"></i>Quản lý bài viết</a>
                    </li>
                    <li>
                       <a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a>
                    </li>
                    <li><li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li></li>

                </ul>
            </nav>
            
        </div>
    </div>
 <script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
    <script>
        new DataTable('#example');
    </script>
</body>

</html>