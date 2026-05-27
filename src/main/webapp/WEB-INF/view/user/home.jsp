      <%@ page contentType="text/html;charset=UTF-8" language="java" %>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loggedUser" value="${sessionScope.loggedUser}" />
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
          <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/helper.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/iconfont.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
          <script src="${pageContext.request.contextPath}assets/js/vendor/modernizr-2.8.3.min.js"></script>
      </head>
      
     <body>
    <!--Header section start-->
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
                                    <li><a href="blog.html">Bài viết</a>
                                    </li>
                                    <li><a href="about.html">GIỚI THIỆU</a></li>
                                    <li><a href="contact.html">LIÊN HỆ</a></li>
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
                                <a href="/user/shoppingcart"><i class="fa fa-shopping-cart"></i><span>3</span></a>
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

        <!--slider section start-->
        <div class="hero-section section position-relative">
            <div class="tf-element-carousel slider-nav" data-slick-options='{
                "slidesToShow": 1,
                "slidesToScroll": 1,
                "infinite": true,
                "arrows": true,
                "dots": true
            }' data-slick-responsive='[
                {"breakpoint":768, "settings": {
                "slidesToShow": 1
                }},
                {"breakpoint":575, "settings": {
                "slidesToShow": 1,
                "arrows": false,
                "autoplay": true
                }}
            ]'>
                <!--Hero Item start-->
                <div class="hero-item bg-image" data-bg="https://images.unsplash.com/photo-1612817159949-195b6eb9e31a?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <!--Hero Content start-->
                                <div class="hero-content-2 color-2">
                                    <h2>Dành cho bạn</h2>
                                    <h1>Chăm sóc tóc</h1>
                                    <h3>Dành cho phái đẹp</h3>
                                    <a href="shop.html">Mua ngay</a>
                                </div>
                                <!--Hero Content end-->
                            </div>
                        </div>
                    </div>
                </div>
                <!--Hero Item end-->

                <!--Hero Item start-->
                <div class="hero-item bg-image" data-bg="https://plus.unsplash.com/premium_photo-1728324776761-a088b2b9fbbb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDIwfHx8ZW58MHx8fHx8">
                    <div class="container">
                        <div class="row">
                            <div class="col-12">
                                <!--Hero Content start-->
                                <div class="hero-content-2 color-2">
                                    <h2>Khuyến mãi</h2>
                                    <h1>Sản phẩm dưỡng da</h1>
                                    <h3>Dành cho mọi loại da</h3>
                                    <a href="shop.html">shop now</a>
                                </div>
                                <!--Hero Content end-->
                            </div>
                        </div>
                    </div>
                </div>
                <!--Hero Item end-->
            </div>
        </div>
        <!--slider section end-->

        <!-- Feature Section Start -->
        <div class="feature-section section pt-100 pt-md-75 pt-sm-60 pt-xs-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <!-- Single Faeture Start -->
                        <div class="single-feature feature-style-2 mb-30">
                            <div class="icon">
                                <i class="fa-truck fa"></i>
                            </div>
                            <div class="content">
                                <h2>Miễn Ship</h2>
                                <p>Hóa đơn trên 5 triệu đồng</p>
                            </div>
                        </div>
                        <!-- Single Faeture End -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <!-- Single Faeture Start -->
                        <div class="single-feature feature-style-2 mb-30">
                            <div class="icon">
                                <i class="fa fa-undo"></i>
                            </div>
                            <div class="content">
                                <h2>30 ngày hoàn tiền</h2>
                                <p>Nếu sản phẩm kém chất lượng</p>
                            </div>
                        </div>
                        <!-- Single Faeture End -->
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <!-- Single Faeture Start -->
                        <div class="single-feature feature-style-2 mb-30 br-0">
                            <div class="icon">
                                <i class="fa fa-thumbs-o-up"></i>
                            </div>
                            <div class="content">
                                <h2>Đăng ký đại lý</h2>
                                <p>Hoa hồng cao hơn bạn tưởng</p>
                            </div>
                        </div>
                        <!-- Single Faeture End -->
                    </div>
                </div>
            </div>
        </div>
        <!-- Feature Section End -->

        <!--Product section start-->
        <div class="product-section section pt-70 pt-lg-45 pt-md-40 pt-sm-30 pt-xs-15">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="product-tab-menu mb-40 mb-xs-20">
                            <ul class="nav">
                                <li><a class="active" data-toggle="tab" href="#products"> Sản phẩm mới</a></li>
                                <li><a data-toggle="tab" href="#onsale"> Sản phẩm khuyến mãi</a></li>
                                <li><a data-toggle="tab" href="#featureproducts"> Sắn phẩm "HOT"</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="tab-content">
                            <!-- sp new -->
                              <div class="tab-pane fade show active" id="products">
                                <div class="row tf-element-carousel" data-slick-options='{
                                    "slidesToShow": 4, "slidesToScroll": 1, "infinite": true,
                                    "rows": 2, "arrows": true,
                                    "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "fa fa-angle-left"},
                                    "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "fa fa-angle-right"}
                                }' data-slick-responsive='[
                                    {"breakpoint":1199, "settings": {"slidesToShow": 3}},
                                    {"breakpoint":992,  "settings": {"slidesToShow": 2}},
                                    {"breakpoint":768,  "settings": {"slidesToShow": 2, "arrows": false, "autoplay": true}},
                                    {"breakpoint":576,  "settings": {"slidesToShow": 1, "arrows": false, "autoplay": true}}
                                ]'>
                                    <c:forEach var="p" items="${newProducts}">
                                        <div class="col-12">
                                            <!-- Single Product Start -->
                                            <div class="single-product mb-30">
                                                <div class="product-img">
                                                    <a href="/user/productdetail/${p.id}">
                                                        <img src="${pageContext.request.contextPath}/assets/uploads/${p.image}"
                                                            alt="${p.name}"
                                                            onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'">
                                                    </a>
                                                  
                                                    <span class="sticker">New</span>
                                                    <div class="product-action d-flex justify-content-between">
                                                        <a class="product-btn" href="/user/productdetail/${p.id}">Mua hàng</a>
                                                        <ul class="d-flex">
                                                            <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                                            <li><a href="shoppingcart.jsp"><i class="fa-solid fa-shop"></i></i></a></li>
                                                            <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="product-content">
                                                    <h3><a href="/user/productdetail/${p.id}">${p.name}</a></h3>
                                                    <div class="ratting">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <h4 class="price">
                                                    <c:choose>
                                                        <c:when test="${p.discount != null && p.discount > 0 && p.discount <= 100}">
                                                            <c:set var="salePrice" value="${p.price * (100 - p.discount) / 100}"/>
                                                            <span class="new price-vnd" data-price="${salePrice}">---</span>
                                                            <span class="old price-vnd" data-price="${p.price}">---</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="new price-vnd" data-price="${p.price}">---</span>
                                                           
                                                            <span class="old" style="visibility:hidden;">---</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </h4>
                                                </div>
                                            </div>
                                            <!-- Single Product End -->
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- san pham sale -->
                           <div class="tab-pane fade" id="onsale">
                                <div class="row tf-element-carousel" data-slick-options='{
                                    "slidesToShow": 4, "slidesToScroll": 1, "infinite": true,
                                    "rows": 2, "arrows": true,
                                    "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "fa fa-angle-left"},
                                    "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "fa fa-angle-right"}
                                }' data-slick-responsive='[
                                    {"breakpoint":1199, "settings": {"slidesToShow": 3}},
                                    {"breakpoint":992,  "settings": {"slidesToShow": 2}},
                                    {"breakpoint":768,  "settings": {"slidesToShow": 2, "arrows": false, "autoplay": true}},
                                    {"breakpoint":576,  "settings": {"slidesToShow": 1, "arrows": false, "autoplay": true}}
                                ]'>
                                    <c:forEach var="p" items="${saleProducts}">
                                        <div class="col-12">
                                            <div class="single-product mb-30">
                                                <div class="product-img">
                                                    <a href="/user/product/${p.id}">
                                                        <img src="${pageContext.request.contextPath}/assets/uploads/${p.image}"
                                                            alt="${p.name}"                                                         
                                                            onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'">
                                                    </a>
                                                    <c:if test="${p.discount != null && p.discount > 0 && p.discount <= 100}">
                                                        <span class="descount-sticker">-<c:out value="${p.discount}"/>%</span>
                                                    </c:if>
                                                    <span class="sticker">Sale</span>
                                                    <div class="product-action d-flex justify-content-between">
                                                        <a class="product-btn" href="/user/product/${p.id}">Mua hàng</a>
                                                        <ul class="d-flex">
                                                            <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="product-content">
                                                    <h3><a href="/user/product/${p.id}">${p.name}</a></h3>
                                                    <div class="ratting">
                                                        <i class="fa fa-star"></i><i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i><i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <h4 class="price">
                                                        <c:choose>
                                                            <c:when test="${p.discount != null && p.discount > 0 && p.discount <= 100}">
                                                                <c:set var="salePriceOnsale" value="${p.price * (100 - p.discount) / 100}"/>
                                                                <span class="new price-vnd" data-price="${salePriceOnsale}">---</span>
                                                                <span class="old price-vnd" data-price="${p.price}">---</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="new price-vnd" data-price="${p.price}">---</span>
                                                                <span class="old" style="visibility:hidden;">---</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </h4>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>


                            <!-- san pham hot -->
                            <div class="tab-pane fade" id="featureproducts">
                                <div class="row tf-element-carousel" data-slick-options='{
                                    "slidesToShow": 4,
                                    "slidesToScroll": 1,
                                    "infinite": true,
                                    "rows": 2,
                                    "arrows": true,
                                    "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "fa fa-angle-left" },
                                    "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "fa fa-angle-right" }
                                    }' data-slick-responsive='[
                                    {"breakpoint":1199, "settings": {
                                    "slidesToShow": 3
                                    }},
                                    {"breakpoint":992, "settings": {
                                    "slidesToShow": 2
                                    }},
                                    {"breakpoint":768, "settings": {
                                    "slidesToShow": 2,
                                    "arrows": false,
                                    "autoplay": true
                                    }},
                                    {"breakpoint":576, "settings": {
                                    "slidesToShow": 1,
                                    "arrows": false,
                                    "autoplay": true
                                    }}
                                    ]'>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-1.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brush</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">110.00</span><span
                                                        class="old">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-2.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brux</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-3.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruz</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-8.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brusb</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">90.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-10.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brush</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-11.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brug</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">70.00</span><span
                                                        class="old">100.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-12.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruc</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">70.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-13.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brusb</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">90.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-4.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruk</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">115.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-5.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brush</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-6.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brug</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">70.00</span><span
                                                        class="old">100.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                    <div class="col-12">
                                        <!-- Single Product Start -->
                                        <div class="single-product mb-30">
                                            <div class="product-img">
                                                <a href="single-product.html">
                                                    <img src="./assets/images/product/product-7.jpg" alt="">
                                                </a>
                                                <span class="descount-sticker">-10%</span>
                                                <span class="sticker">New</span>
                                                <div class="product-action d-flex justify-content-between">
                                                    <a class="product-btn" href="#">Mua hàng</a>
                                                    <ul class="d-flex">
                                                        <li><a href="#quick-view-modal-container" data-toggle="modal"
                                                                title="Quick View"><i class="fa fa-eye"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-heart-o"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-exchange"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruc</a></h3>
                                                <div class="ratting">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <h4 class="price"><span class="new">70.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single Product End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--Product section end-->

        <!--Banner section start-->
        <div class="banner-section section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <!-- Single Banner Start -->
                        <div class="single-banner mb-30">
                            <a href="#">
                                <img src="https://images.unsplash.com/photo-1506193095-80bc749473f2?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
                            </a>
                        </div>
                        <!-- Single Banner End -->
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <!-- Single Banner Start -->
                        <div class="single-banner mb-30">
                            <a href="#">
                                <img src="https://plus.unsplash.com/premium_photo-1728759435328-9a5a417edef7?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
                            </a>
                        </div>
                        <!-- Single Banner End -->
                    </div>
                    <div class="col-lg-3 col-md-3">
                        <!-- Single Banner Start -->
                        <div class="single-banner mb-30">
                            <a href="#">
                                <img src="https://plus.unsplash.com/premium_photo-1723568571445-24c92fc4d566?q=80&w=1204&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="">
                            </a>
                        </div>
                        <!-- Single Banner End -->
                    </div>
                </div>
            </div>
        </div>
        <!--Banner section end-->

        <!--List Product section start-->
        <div
            class="list-section section pt-60 pt-lg-75 pt-md-65 pt-sm-55 pt-xs-45 pb-30 pb-lg-10 pb-md-0 pb-sm-0 pb-xs-0">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6 mb-40 mb-sm-30 mb-xs-20">
                        <div class="row">
                            <div class="col-12">
                                <!--List Product Section Title Start-->
                                <div class="list-product-section-title mb-30">
                                    <h2>Top rated </h2>
                                </div>
                                <!--List Product Section Title End-->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="tf-element-carousel" data-slick-options='{
                                    "slidesToShow": 1,
                                    "slidesToScroll": 1,
                                    "infinite": true,
                                    "arrows": true,
                                    "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "fa fa-angle-left" },
                                    "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "fa fa-angle-right" }
                                    }' data-slick-responsive='[
                                    {"breakpoint":768, "settings": {
                                    "slidesToShow": 1,
                                    "arrows": false,
                                    "autoplay": true
                                    }},
                                    {"breakpoint":575, "settings": {
                                    "slidesToShow": 1,
                                    "arrows": false,
                                    "autoplay": true
                                    }}
                                    ]'>
                                    <div class="list-product-group">
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-1.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Aftershave Lotion </a></h3>
                                                <h4 class="price"><span class="new">110.00</span><span
                                                        class="old">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-2.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruh </a></h3>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-3.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brux </a></h3>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                    </div>
                                    <div class="list-product-group">
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-4.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Aftershave Savlon </a></h3>
                                                <h4 class="price"><span class="new">70.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-5.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Brass Acces1 </a></h3>
                                                <h4 class="price"><span class="new">150.00</span><span
                                                        class="old">187.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-6.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Brass Accessory </a></h3>
                                                <h4 class="price"><span class="new">187.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                    </div>
                                    <div class="list-product-group">
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-7.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruw</a></h3>
                                                <h4 class="price"><span class="new">125.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-8.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brum </a></h3>
                                                <h4 class="price"><span class="new">60.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-9.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brun </a></h3>
                                                <h4 class="price"><span class="new">53.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 mb-40 mb-sm-30 mb-xs-20">
                        <div class="row">
                            <div class="col-12">
                                <!--List Product Section Title Start-->
                                <div class="list-product-section-title mb-30">
                                    <h2>On-sale</h2>
                                </div>
                                <!--List Product Section Title End-->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="tf-element-carousel" data-slick-options='{
                                    "slidesToShow": 1,
                                    "slidesToScroll": 1,
                                    "infinite": true,
                                    "arrows": true,
                                    "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "fa fa-angle-left" },
                                    "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "fa fa-angle-right" }
                                    }' data-slick-responsive='[
                                    {"breakpoint":768, "settings": {
                                    "slidesToShow": 1,
                                    "arrows": false,
                                    "autoplay": true
                                    }},
                                    {"breakpoint":575, "settings": {
                                    "slidesToShow": 1,
                                    "arrows": false,
                                    "autoplay": true
                                    }}
                                    ]'>
                                    <div class="list-product-group">
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-7.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruw</a></h3>
                                                <h4 class="price"><span class="new">125.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-8.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brum </a></h3>
                                                <h4 class="price"><span class="new">60.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-9.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brun </a></h3>
                                                <h4 class="price"><span class="new">53.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                    </div>
                                    <div class="list-product-group">
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-1.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Aftershave Lotion </a></h3>
                                                <h4 class="price"><span class="new">110.00</span><span
                                                        class="old">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-2.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruh </a></h3>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-3.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brux </a></h3>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                    </div>
                                    <div class="list-product-group">
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-4.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Aftershave Savlon </a></h3>
                                                <h4 class="price"><span class="new">70.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-5.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Brass Acces1 </a></h3>
                                                <h4 class="price"><span class="new">150.00</span><span
                                                        class="old">187.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-6.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Brass Accessory </a></h3>
                                                <h4 class="price"><span class="new">187.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 mb-40 mb-sm-30 mb-xs-20">
                        <div class="row">
                            <div class="col-12">
                                <!--List Product Section Title Start-->
                                <div class="list-product-section-title mb-30">
                                    <h2>Trending items</h2>
                                </div>
                                <!--List Product Section Title End-->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="tf-element-carousel" data-slick-options='{
                                    "slidesToShow": 1,
                                    "slidesToScroll": 1,
                                    "infinite": true,
                                    "arrows": true,
                                    "prevArrow": {"buttonClass": "slick-btn slick-prev", "iconClass": "fa fa-angle-left" },
                                    "nextArrow": {"buttonClass": "slick-btn slick-next", "iconClass": "fa fa-angle-right" }
                                    }' data-slick-responsive='[
                                    {"breakpoint":768, "settings": {
                                    "slidesToShow": 1,
                                    "arrows": false,
                                    "autoplay": true
                                    }},
                                    {"breakpoint":575, "settings": {
                                    "slidesToShow": 1,
                                    "arrows": false,
                                    "autoplay": true
                                    }}
                                    ]'>
                                    <div class="list-product-group">
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-4.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Aftershave Savlon </a></h3>
                                                <h4 class="price"><span class="new">70.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-5.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Brass Acces1 </a></h3>
                                                <h4 class="price"><span class="new">150.00</span><span
                                                        class="old">187.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-6.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Brass Accessory </a></h3>
                                                <h4 class="price"><span class="new">187.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                    </div>
                                    <div class="list-product-group">
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-7.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruw</a></h3>
                                                <h4 class="price"><span class="new">125.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-8.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brum </a></h3>
                                                <h4 class="price"><span class="new">60.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-9.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brun </a></h3>
                                                <h4 class="price"><span class="new">53.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                    </div>
                                    <div class="list-product-group">
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-1.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">Aftershave Lotion </a></h3>
                                                <h4 class="price"><span class="new">110.00</span><span
                                                        class="old">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-2.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Bruh </a></h3>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                        <!-- Single List Product Start -->
                                        <div class="single-list-product">
                                            <div class="product-image">
                                                <a href="single-product.html"><img
                                                        src="./assets/images/product/product-3.jpg" alt=""></a>
                                            </div>
                                            <div class="product-content">
                                                <h3><a href="single-product.html">White Shave Brux </a></h3>
                                                <h4 class="price"><span class="new">130.00</span></h4>
                                            </div>
                                        </div>
                                        <!-- Single List Product End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--List Product section end-->

        <!--Brand section start-->
        <div
            class="brand-section section pt-90 pt-lg-70 pt-md-65 pt-sm-55 pt-xs-40 pb-100 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
            <div class="container">
                <div class="row">
                    <!--Brand Slider start-->
                    <div class="tf-element-carousel section" data-slick-options='{
                        "slidesToShow": 5,
                        "slidesToScroll": 1,
                        "infinite": true,
                        "arrows": false,
                        "autoplay": true
                        }' data-slick-responsive='[
                        {"breakpoint":1199, "settings": {
                        "slidesToShow": 4
                        }},
                        {"breakpoint":992, "settings": {
                        "slidesToShow": 4
                        }},
                        {"breakpoint":768, "settings": {
                        "slidesToShow": 3
                        }},
                        {"breakpoint":576, "settings": {
                        "slidesToShow": 1
                        }}
                        ]'>
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-1.png" alt=""></a>
                        </div>
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-2.png" alt=""></a>
                        </div>
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-3.png" alt=""></a>
                        </div>
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-4.png" alt=""></a>
                        </div>
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-5.png" alt=""></a>
                        </div>
                    </div>
                    <!--Brand Slider end-->
                </div>
            </div>
        </div>
        <!--Brand section end-->

        <footer class="footer-section section bg-dark">

            <!--Footer Top start-->
            <div
                class="footer-top section pt-100 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50 pb-45 pb-lg-25 pb-md-15 pb-sm-5 pb-xs-0">
                <div class="container">
                    <div class="row row-25">

                        <!--Footer Widget start-->
                        <div class="footer-widget col-lg-3 col-md-6 col-sm-6 col-12 mb-40 mb-xs-35">
                            <h4 class="title"><span class="text">Poly Shop</span></h4>
                            <p>Poly Shop là website kinh doanh mỹ phẩm chính hãng, mang đến những sản phẩm chăm sóc sắc đẹp chất lượng cao, phù hợp với mọi loại da. Hãy ghé thăm Poly Shop để khám phá ngay những sản phẩm dành cho bạn!</p>
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
    </div>

</body>
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/plugins.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
<script>
function formatVND(price) {
    return new Intl.NumberFormat('vi-VN').format(Math.round(price)) + '₫';
}
document.querySelectorAll('.price-vnd').forEach(function(el) {
    var raw = parseFloat(el.getAttribute('data-price'));
    if (!isNaN(raw) && raw > 0) {
        el.textContent = formatVND(raw);
    } else {
        el.textContent = '---';
    }
});
</script>
</body>
      </html>
        