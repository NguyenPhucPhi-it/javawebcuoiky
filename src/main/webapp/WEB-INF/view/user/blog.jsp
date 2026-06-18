<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loggedUser" value="${sessionScope.loggedUser}" />
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bài viết – Poly Shop</title>
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        .blog-card { background:#fff; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,.08); overflow:hidden; margin-bottom:30px; transition:transform .2s; }
        .blog-card:hover { transform:translateY(-4px); }
        .blog-card img { width:100%; height:220px; object-fit:cover; }
        .blog-card-body { padding:20px; }
        .blog-card-body h4 { font-weight:700; margin-bottom:8px; }
        .blog-card-body h4 a { color:#333; text-decoration:none; }
        .blog-card-body h4 a:hover { color:#e91e63; }
        .blog-meta { font-size:13px; color:#aaa; margin-bottom:8px; }
        .blog-excerpt { color:#777; font-size:14px; line-height:1.7;
            display:-webkit-box; -webkit-line-clamp:3;
            -webkit-box-orient:vertical; overflow:hidden; }
        .btn-readmore { background:#e91e63; color:#fff; padding:8px 20px;
            border-radius:5px; font-size:14px; text-decoration:none;
            display:inline-block; margin-top:12px; }
        .btn-readmore:hover { background:#c2185b; color:#fff; }
        .blog-empty { text-align:center; padding:80px 0; color:#999; font-size:18px; }
    </style>
</head>
<body>
<div id="main-wrapper">

    <!-- Header -->
    <header class="header header-transparent header-sticky">
        <div class="header-top">
                <div class="container">
                    <div class="row align-items-center">
                        <div
                            class="col-xl-6 col-lg-8 d-flex flex-wrap justify-content-lg-start justify-content-center align-items-center">
                            <!--Links start-->
                            <div class="header-top-links">
                                <ul>
                                    <li><a href="#"><i class="fa fa-phone"></i>(08) 123 456 7890</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-open-o"></i>yourmail@domain.com</a></li>
                                </ul>
                            </div>
                            <!--Links end-->
                        </div>
                        <div class="col-xl-6 col-lg-4">
                            <div class="ht-right d-flex justify-content-lg-end justify-content-center">
                                <ul class="ht-us-menu d-flex">
                            <c:choose>
                                <c:when test="${loggedUser != null}">
                                
                                    <li>
                                        <a href="#"><i class="fa fa-user-circle-o"></i>${loggedUser.username}</a>
                                        <ul class="ht-dropdown right">
                                            <c:if test="${loggedUser.role == 1}">
                                                <li><a href="/admin/dashboard">Quản trị</a></li>
                                            </c:if>
                                            <li><a href="/auth/logout">Đăng xuất</a></li>
                                            <li><a href="/user/orders">Lịch sử đặt hàng</a></li>
                                            <li><a href="/user/pending-reviews">Bình luận/ đánh giá</a></li>
                                        </ul>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                
                                    <li>
                                        <a href="#"><i class="fa fa-user-circle-o"></i>Tài khoản</a>
                                        <ul class="ht-dropdown right">
                                            <li><a href="/auth/register">Đăng ký</a></li>
                                            <li><a href="/auth/login">Đăng nhập</a></li>
                                        </ul>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
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
                <div class="row">
                    <div class="col-12 d-flex d-lg-none">
                        <div class="mobile-menu"></div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Banner -->
    <div class="page-banner-section section bg-gray" style="padding:30px 0; text-align:center;">
        <h1 style="margin:0; font-size:28px;">Bài viết</h1>
        <ul style="list-style:none;padding:0;margin:8px 0 0;display:flex;justify-content:center;gap:6px;font-size:14px;color:#888;">
            <li><a href="/user/home">Trang chủ</a></li>
            <li>/</li>
            <li style="color:#e91e63;">Bài viết</li>
        </ul>
    </div>

    <!-- Danh sách bài viết -->
    <div class="section pt-60 pb-60">
        <div class="container">
            <c:choose>
                <c:when test="${empty posts}">
                    <div class="blog-empty">
                        <i class="fa fa-newspaper-o" style="font-size:56px;display:block;margin-bottom:16px;color:#ddd;"></i>
                        Chưa có bài viết nào.
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="row">
                        <c:forEach var="p" items="${posts}">
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="blog-card">
                                    <a href="${pageContext.request.contextPath}/user/blog/${p.id}">
                                        <%-- ảnh post lưu trong static/assets/uploads nên dùng /assets/uploads --%>
                                        <img src="${pageContext.request.contextPath}/assets/uploads/${p.image}"
                                             alt="${p.title}"
                                             onerror="this.src='${pageContext.request.contextPath}/assets/images/no-image.png'">
                                    </a>
                                    <div class="blog-card-body">
                                        <div class="blog-meta">
                                            <i class="fa fa-calendar"></i>
                                            ${p.createdAt != null ? p.createdAt.toLocalDate() : ''}
                                        </div>
                                        <h4>
                                            <a href="${pageContext.request.contextPath}/user/blog/${p.id}">
                                                ${p.title}
                                            </a>
                                        </h4>
                                        <div class="blog-excerpt">${p.content}</div>
                                        <a href="${pageContext.request.contextPath}/user/blog/${p.id}" class="btn-readmore">
                                            Đọc thêm <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer-section section bg-dark">
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