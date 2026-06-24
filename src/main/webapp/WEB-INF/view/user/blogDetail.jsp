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

                        <!--Logo start-->
                        <div class="col-lg-3 col-md-3 col-6 order-lg-1 order-md-1 order-1">
                            <div class="logo">
                                <h1><strong>Poly</strong> Shop</h1>
                            </div>
                        </div>
                        <!--Logo end-->

                        <!--Menu start-->
                        <div
                            class="col-lg-6 col-md-6 col-12 order-lg-2 order-md-2 order-3 d-flex justify-content-center">
                            <nav class="main-menu">
                                <ul>
                                    <li><a href="/user/home">TRANG CHỦ</a>
                                    </li>
                                    <li><a href="/user/product">CỬA HÀNG</a>                            
                                    </li>
                                    <li><a href="/user/blog">Bài viết</a>
                                    </li>
                                    <li><a href="/user/introduce">GIỚI THIỆU</a></li>
                                    <li><a href="/user/contact">LIÊN HỆ</a></li>
                                </ul>
                            </nav>
                        </div>
                        <!--Menu end-->

                        <!--Search Cart Start-->
                        <div class="col-lg-3 col-md-3 col-6 order-lg-3 order-md-3 order-2 d-flex justify-content-end">
                            <div class="header-search">
                                <button class="header-search-toggle"><i class="fa fa-search"></i></button>
                                <div class="header-search-form">
                                    <form action="#">
                                        <input type="text" placeholder="Nhập từ khóa ...">
                                        <button><i class="fa fa-search"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="header-cart">
                            <a href="${pageContext.request.contextPath}/user/shoppingcart">
                                <i class="fa fa-shopping-cart"></i><span>${cartCount}</span>
                            </a>
                        </div>
                        </div>
                        <!--Search Cart End-->
                    </div>

                    <!--Mobile Menu start-->
                    <div class="row">
                        <div class="col-12 d-flex d-lg-none"> 
                            <div class="mobile-menu"></div>
                        </div>
                    </div>
                    <!--Mobile Menu end-->
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

    <footer class="footer-section section bg-dark">

            <!--Footer Top start-->
            <div
                class="footer-top section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50 pb-45 pb-lg-25 pb-md-15 pb-sm-5 pb-xs-0">
                <div class="container">
                    <div class="row row-25">

                        <!--Footer Widget start-->
                        <div class="footer-widget col-lg-3 col-md-6 col-sm-6 col-12 mb-40 mb-xs-35">
                            <h4 class="title"><span class="text">Poly Shop</span></h4>
                             <p>Poly Shop là website kinh doanh đồng hồ chính hãng, mang đến những sản phẩm đồng hồ, phù hợp với mọi người. Hãy ghé thăm Poly Shop để khám phá ngay những sản phẩm dành cho bạn!</p>
                            <div class="footer-social">
                                <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                                <a href="#" class="google"><i class="fa fa-google-plus"></i></a>
                                <a href="#" class="linkedin"><i class="fa fa-instagram"></i></a>
                                <a href="#" class="pinterest"><i class="fa fa-pinterest-p"></i></a>
                                <a href="#" class="pinterest"><i class="fa fa-vimeo"></i></a>
                            </div>
                        </div>
                        <!--Footer Widget end-->


                        <!--Footer Widget start-->
                        <div class="footer-widget col-lg-3 col-md-6 col-sm-6 col-12 mb-40 mb-xs-35">
                            <h4 class="title"><span class="text">Thông tin</span></h4>
                            <ul class="ft-menu">
                                <li><a href="#">Giới thiệu</a></li>
                                <li><a href="#">Liên hệ</a></li>
                                <li><a href="#">Dịch vụ</a></li>
                                <li><a href="#">Điều khoản</a></li>
                                <li><a href="#">Đại lý</a></li>
                                <li><a href="#">Đăng ký nhận tin</a></li>
                            </ul>
                        </div>
                        <!--Footer Widget end-->


                        <!--Footer Widget start-->
                        <div class="footer-widget col-lg-3 col-md-6 col-sm-6 col-12 mb-40 mb-xs-35">
                            <h4 class="title"><span class="text">Dành cho bạn</span></h4>
                            <ul class="ft-menu">
                                <li><a href="#">Sản phẩm mới</a></li>
                                <li><a href="#">Bán chạy</a></li>
                                <li><a href="#">Sản phẩm đặc biệt</a></li>
                                <li><a href="#">Sản phẩm nhiều người xem</a></li>
                                <li><a href="#">Sản phẩm sắp về</a></li>
                                <li><a href="#">Bộ sưu tập</a></li>
                            </ul>
                        </div>
                        <!--Footer Widget end-->

                        <!--Footer Widget start-->
                        <div class="footer-widget col-lg-3 col-md-6 col-sm-6 col-12 mb-40 mb-xs-35">
                            <h4 class="title"><span class="text">Liên hệ</span></h4>
                            <ul class="address">
                                <li><i class="fa fa-home"></i><span></span>
                                </li>
                                <li><i class="fa fa-phone"></i><span><a href="#">(08) 123 456 7890</a></span></li>
                                <li><i class="fa fa-envelope-o"></i><span><a href="#">yourmail@domain.com</a></span>
                                </li>
                            </ul>
                            <div class="payment-box mt-15 mb-15">
                                <a href="#"><img src="./assets/images/payment.png" alt=""></a>
                            </div>
                        </div>
                        <!--Footer Widget end-->
                    </div>
                </div>
            </div>
            <!--Footer Top end-->

            <!--Footer bottom start-->
            <div class="footer-bottom section">
                <div class="container ft-border pt-40 pb-40 pt-xs-20 pb-xs-20">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-6 col-md-6 col-sm-8">
                            <div class="copyright text-left">
                                <p>Copyright &copy;2026 <a href="#">Poly Shop</a>. All rights reserved.</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-4">
                            <div class="footer-logo text-right">
                                <h3><a href="index.html" style="color:white">Poly Shop</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--Footer bottom end-->
        </footer>
</div>

<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/plugins.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
</body>
</html>