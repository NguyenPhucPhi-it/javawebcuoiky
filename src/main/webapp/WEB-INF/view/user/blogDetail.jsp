<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loggedUser" value="${sessionScope.loggedUser}" />
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${post.title} – Poly Shop</title>
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        .blog-detail-wrapper { max-width:860px; margin:50px auto; padding:0 15px; }
        .blog-detail-img { width:100%; max-height:420px; object-fit:cover; border-radius:8px; margin-bottom:24px; }
        .blog-detail-title { font-size:28px; font-weight:700; color:#222; margin-bottom:10px; }
        .blog-meta { color:#aaa; font-size:13px; margin-bottom:24px; }
        .blog-content { font-size:16px; line-height:1.9; color:#444; }
        .btn-back { background:#555; color:#fff; padding:10px 24px; border-radius:6px; text-decoration:none; display:inline-block; margin-top:30px; }
        .btn-back:hover { background:#333; color:#fff; }
    </style>
</head>
<body>
<div id="main-wrapper">

    <header class="header header-transparent header-sticky">
        <div class="header-bottom menu-right">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-3 col-6 order-lg-1 order-md-1 order-1">
                        <div class="logo"><h1><strong>Poly</strong> Shop</h1></div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-12 order-lg-2 order-md-2 order-3 d-flex justify-content-center">
                        <nav class="main-menu">
                            <ul>
                                <li><a href="/user/home">TRANG CHỦ</a></li>
                                <li><a href="/user/product">CỬA HÀNG</a></li>
                                <li><a href="/user/blog" style="color:#e91e63;">BÀI VIẾT</a></li>
                                <li><a href="/user/contact">LIÊN HỆ</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3 col-md-3 col-6 order-lg-3 order-md-3 order-2 d-flex justify-content-end">
                        <div class="header-cart">
                            <a href="/user/shoppingcart"><i class="fa fa-shopping-cart"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="blog-detail-wrapper">
        <img src="${pageContext.request.contextPath}/assets/uploads/${post.image}"
             alt="${post.title}" class="blog-detail-img"
             onerror="this.src='${pageContext.request.contextPath}/assets/images/no-image.png'">

        <div class="blog-meta">
            <i class="fa fa-calendar"></i>
            ${post.createdAt != null ? post.createdAt.toLocalDate() : ''}
        </div>

        <div class="blog-detail-title">${post.title}</div>

        <div class="blog-content">
            ${post.content}
        </div>

        <a href="${pageContext.request.contextPath}/user/blog" class="btn-back">
            <i class="fa fa-angle-left"></i> Quay lại danh sách
        </a>
    </div>

    <footer class="footer-section section bg-dark" style="margin-top:60px;">
        <div class="footer-bottom section">
            <div class="container ft-border pt-30 pb-30">
                <div class="row justify-content-between align-items-center">
                    <div class="col-lg-6">
                        <p style="color:#aaa;margin:0;">Copyright &copy;2025
                            <a href="#" style="color:#e91e63;">Poly Shop</a>. All rights reserved.
                        </p>
                    </div>
                    <div class="col-lg-6 text-right">
                        <h3><a href="/user/home" style="color:white">Poly Shop</a></h3>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>

<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/plugins.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
</body>
</html>