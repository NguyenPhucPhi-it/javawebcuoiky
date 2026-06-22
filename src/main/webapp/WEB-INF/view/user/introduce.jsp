<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loggedUser" value="${sessionScope.loggedUser}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/helper.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/iconfont.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <title>Giới thiệu - Poly Shop</title>
</head>

<body>
    <div id="main-wrapper">
        <!-- Header Section Start (Giữ nguyên cấu trúc đồng bộ) -->
        <header class="header header-transparent header-sticky">
            <div class="header-top">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-6 col-lg-8 d-flex flex-wrap justify-content-lg-start justify-content-center align-items-center">
                            <div class="header-top-links">
                                <ul>
                                    <li><a href="#"><i class="fa fa-phone"></i>(08) 123 456 7890</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-open-o"></i>yourmail@domain.com</a></li>
                                </ul>
                            </div>
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
                        <div class="col-lg-3 col-md-3 col-6">
                            <div class="logo">
                                <h1><strong>Poly</strong> Shop</h1>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-12 d-flex justify-content-center">
                            <nav class="main-menu">
                                <ul>
                                    <li><a href="/user/home">TRANG CHỦ</a></li>
                                    <li><a href="/user/product">CỬA HÀNG</a></li>
                                    <li><a href="/user/blog">Bài viết</a></li>
                                    <li class="active"><a href="/user/about">GIỚI THIỆU</a></li>
                                    <li><a href="/user/contact">LIÊN HỆ</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-lg-3 col-md-3 col-6 d-flex justify-content-end">
                            <div class="header-cart">
                                <a href="${pageContext.request.contextPath}/user/shoppingcart">
                                    <i class="fa fa-shopping-cart"></i><span>${cartCount}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Banner Start -->
        <div class="page-banner-section section bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="page-banner text-center">
                            <h1 style="margin: 0 !important;">Giới thiệu về chúng tôi</h1>
                            <ul class="page-breadcrumb">
                                <li><a href="/user/home">Trang chủ</a></li>
                                <li>Giới thiệu</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner End -->

        <!-- About Section Start -->
        <div class="about-section section pt-80 pb-50">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-12 mb-30">
                        <div class="about-content">
                            <h3>Chào mừng bạn đến với <span>Poly Shop</span></h3>
                            <p class="mb-20">Được thành lập với khát vọng mang đến những giá trị tốt nhất cho khách hàng, Poly Shop tự hào là hệ thống cung cấp các sản phẩm chính hãng chất lượng cao, đón đầu xu hướng thời trang và công nghệ hiện đại.</p>
                            <p>Chúng tôi không chỉ bán sản phẩm, chúng tôi mang lại trải nghiệm mua sắm tuyệt vời cùng dịch vụ chăm sóc khách hàng tận tâm hàng đầu Việt Nam. Từng sản phẩm tại Poly Shop đều được tuyển chọn kỹ lưỡng, kiểm định nghiêm ngặt trước khi trao tay quý khách.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-12 mb-30">
                        <div class="about-image text-center">
                            <img src="${pageContext.request.contextPath}/assets/images/banner/about-banner.jpg" alt="Về Poly Shop" class="img-fluid rounded" onerror="this.src='https://placehold.co/600x400?text=Poly+Shop+Story'"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About Section End -->

        <!-- Features/Values Section Start -->
        <div class="features-section section bg-gray pt-70 pb-40">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-title text-center mb-50">
                            <h2>Giá trị cốt lõi</h2>
                            <p>Những cam kết giúp làm nên sự khác biệt tạo dựng niềm tin nơi khách hàng</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Feature 1 -->
                    <div class="col-lg-4 col-md-6 col-12 mb-30">
                        <div class="single-feature text-center p-4 bg-white shadow-sm rounded">
                            <div class="icon mb-3" style="font-size: 40px; color: #ff5400;">
                                <i class="fa fa-shield"></i>
                            </div>
                            <h4>Chất lượng hàng đầu</h4>
                            <p>Cam kết 100% sản phẩm chính hãng, nguồn gốc xuất xứ rõ ràng và an toàn tuyệt đối cho người tiêu dùng.</p>
                        </div>
                    </div>
                    <!-- Feature 2 -->
                    <div class="col-lg-4 col-md-6 col-12 mb-30">
                        <div class="single-feature text-center p-4 bg-white shadow-sm rounded">
                            <div class="icon mb-3" style="font-size: 40px; color: #ff5400;">
                                <i class="fa fa-truck"></i>
                            </div>
                            <h4>Giao hàng nhanh chóng</h4>
                            <p>Hỗ trợ vận chuyển thần tốc toàn quốc, đóng gói chuyên nghiệp để sản phẩm luôn hoàn hảo khi tới tay bạn.</p>
                        </div>
                    </div>
                    <!-- Feature 3 -->
                    <div class="col-lg-4 col-md-6 col-12 mb-30">
                        <div class="single-feature text-center p-4 bg-white shadow-sm rounded">
                            <div class="icon mb-3" style="font-size: 40px; color: #ff5400;">
                                <i class="fa fa-headphones"></i>
                            </div>
                            <h4>Hỗ trợ 24/7</h4>
                            <p>Đội ngũ tư vấn viên am hiểu sản phẩm, nhiệt tình, luôn sẵn sàng lắng nghe và giải đáp mọi thắc mắc.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features/Values Section End -->
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
                                <li><i class="fa fa-phone"></i><span><a href="#">(08) 123 456 789</a></span></li>
                                <li><i class="fa fa-envelope-o"></i><span><a href="#">www@gmail.com</a></span>
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
                                <p>Copyright &copy;2025 <a href="#">Poly Shop</a>. All rights reserved.</p>
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

    <!-- Tải các kịch bản cần thiết -->
    <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
