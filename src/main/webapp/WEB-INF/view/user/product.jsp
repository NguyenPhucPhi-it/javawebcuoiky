<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="loggedUser" value="${sessionScope.loggedUser}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link href="assets/images/favicon.ico" type="img/x-icon" rel="shortcut icon"> -->
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/helper.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/iconfont.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <title>Trang chủ</title>
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
                                    </li>
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
                                    <li><a href="shop.html">CỬA HÀNG</a>
                                        <!-- 
                                            <ul class="mega-menu four-column">
                                                <li><a href="#" class="item-link">Pages</a>
                                                    <ul>
                                                        <li><a href="compare.html">Compare</a></li>
                                                        <li><a href="cart.html">Shopping Cart</a></li>
                                                        <li><a href="checkout.html">Checkout</a></li>
                                                        <li><a href="wishlist.html">Wishlist</a></li>
                                                        <li><a href="my-account.html">My Account</a></li>
                                                        <li><a href="login-register.html">Login Register</a></li>
                                                        <li><a href="faq.html">Frequently Questions</a></li>
                                                        <li><a href="404.html">Error 404</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#" class="item-link">Shop Layout</a>
                                                    <ul>
                                                        <li><a href="shop.html">Shop</a></li>
                                                        <li><a href="shop-three-column.html">Shop Three Column</a></li>
                                                        <li><a href="shop-four-column.html">Shop Four Column</a></li>
                                                        <li><a href="shop-right-sidebar.html">Shop Right Sidebar</a></li>
                                                        <li><a href="shop-list-nosidebar.html">Shop List No Sidebar</a></li>
                                                        <li><a href="shop-list-left-sidebar.html">Shop List Left Sidebar</a>
                                                        </li>
                                                        <li><a href="shop-list-right-sidebar.html">Shop List Right
                                                                Sidebar</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#" class="item-link">Product Details</a>
                                                    <ul>
                                                        <li><a href="single-product.html">Single Product</a></li>
                                                        <li><a href="single-product-variable.html">Variable Product</a></li>
                                                        <li><a href="single-product-affiliate.html">Affiliate Product</a>
                                                        </li>
                                                        <li><a href="single-product-group.html">Group Product</a></li>
                                                        <li><a href="single-product-tabstyle-2.html">Product Left Tab</a>
                                                        </li>
                                                        <li><a href="single-product-tabstyle-3.html">Product Right Tab</a>
                                                        </li>
                                                        <li><a href="single-product-gallery-left.html">Product Gallery
                                                                Left</a></li>
                                                        <li><a href="single-product-gallery-right.html">Product Gallery
                                                                Right</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#" class="item-link">Product Details</a>
                                                    <ul>
                                                        <li><a href="single-product-sticky-left.html">Product Sticky
                                                                Left</a></li>
                                                        <li><a href="single-product-sticky-right.html">Product Sticky
                                                                Right</a></li>
                                                        <li><a href="single-product-slider-box.html">Product Box Slider</a>
                                                        </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                         -->
                                    </li>
                                    <li><a href="blog.html">Bài viết</a>
                                    </li>
                                    <li><a href="about.html">GIỚI THIỆU</a></li>
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
                                        <input type="text" placeholder="Type and hit enter">
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
        <div class="page-banner-section section bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="page-banner text-center">
                            <h1 style="margin: 0 !important;">Cửa hàng</h1>
                            <ul class="page-breadcrumb">
                                <li><a href="index.html">Trang chủ</a></li>
                                <li>Sản phẩm</li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div
            class="shop-section section pt-30 pt-lg-80 pt-md-70 pt-sm-60 pt-xs-50 pb-70 pb-lg-50 pb-md-40 pb-sm-60 pb-xs-50">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 order-lg-1 order-2">
                        <div class="common-sidebar-widget">
                            <h3 class="sidebar-title">Danh mục</h3>
                            <ul class="sidebar-list">
                             
                                <li class="${selectedBrand == null ? 'active' : ''}">
                                    <a href="${pageContext.request.contextPath}/user/product?page=0&size=9">
                                        <i class="fa fa-angle-right"></i>Tất cả
                                    </a>
                                </li>
                          
                                <c:forEach var="b" items="${brands}">
                                    <li class="${selectedBrand == b.id ? 'active' : ''}">
                                        <a href="${pageContext.request.contextPath}/user/product?page=0&size=9&brandId=${b.id}">
                                            <i class="fa fa-angle-right"></i>${b.brandName}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <!-- Single Sidebar End  -->
                        <!-- Single Sidebar Start  -->
                        <div class="common-sidebar-widget">
                            <h3 class="sidebar-title">Tìm sản phẩm theo giá</h3>
                            <c:set var="brandParam" value="${selectedBrand != null ? '&brandId='.concat(selectedBrand) : ''}"/>
                            <ul class="sidebar-list">
                                <li class="${minPrice == 0 && maxPrice == 500000 ? 'active' : ''}">
                                    <a href="${pageContext.request.contextPath}/user/product?page=0&size=9${brandParam}&minPrice=0&maxPrice=500000">
                                        <i class="fa fa-angle-right"></i>0 - 500.000 đ
                                    </a>
                                </li>
                                <li class="${minPrice == 500000 && maxPrice == 1000000 ? 'active' : ''}">
                                    <a href="${pageContext.request.contextPath}/user/product?page=0&size=9${brandParam}&minPrice=500000&maxPrice=1000000">
                                        <i class="fa fa-angle-right"></i>500.000 - 1.000.000 đ
                                    </a>
                                </li>
                                <li class="${minPrice == 1000000 && maxPrice == 3000000 ? 'active' : ''}">
                                    <a href="${pageContext.request.contextPath}/user/product?page=0&size=9${brandParam}&minPrice=1000000&maxPrice=3000000">
                                        <i class="fa fa-angle-right"></i>1.000.000 - 3.000.000 đ
                                    </a>
                                </li>
                                <li class="${minPrice == 3000000 && maxPrice == 5000000 ? 'active' : ''}">
                                    <a href="${pageContext.request.contextPath}/user/product?page=0&size=9${brandParam}&minPrice=3000000&maxPrice=5000000">
                                        <i class="fa fa-angle-right"></i>3.000.000 - 5.000.000 đ
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- Single Sidebar End  -->
                        <!-- Single Sidebar Start  -->
                        <!-- <div class="common-sidebar-widget">
                            <div class="single-banner">
                                <a href="#">
                                    <img src="assets/images/banner/h4-banner-2.png" alt="">
                                </a>
                            </div>
                        </div> -->
                        <!-- Single Sidebar End  -->
                    </div>
                    <div class="col-lg-9 order-lg-2 order-1">
                        <!-- <div class="row">
                            <div class="col-12">
                                <div class="shop-banner mb-35 mb-xs-20">
                                    <img src="./assets/images/banner/category-image.jpg" alt="">
                                </div>
                                <div class="shop-banner-title">
                                    <h2>Shop</h2>
                                </div>
                            </div>
                        </div> -->
                        <div class="row">
                            <div class="col-12">
                                <!-- Grid & List View Start -->
                                <div
                                    class="shop-topbar-wrapper d-md-flex justify-content-md-between align-items-center">
                                    <div class="grid-list-option">
                                        <!-- <ul class="nav">
                                            <li>
                                                <a class="active show" data-toggle="tab" href="#grid"><i
                                                        class="fa fa-th"></i></a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#list" class=""><i
                                                        class="fa fa-th-list"></i></a>
                                            </li>
                                        </ul> -->
                                    </div>
                                    <!--Toolbar Short Area Start-->
                                    <div class="toolbar-short-area d-md-flex align-items-center">
                                        <div class="toolbar-shorter ">
                                            <label>Sắp xếp:</label>
                                            <select class="wide">
                                                <option data-display="Chọn">Mới nhất</option>
                                                <option value="Name, A to Z">theo tên, tăng dần</option>
                                                <option value="Name, Z to A">theo tên, giảm dần</option>
                                                <option value="Price, low to high">theo giá, từ thấp đến cao</option>
                                                <option value="Price, high to low">theo giá, từ cao đến thấp</option>
                                            </select>
                                        </div>
                                        <div class="toolbar-shorter ">
                                            <label>Hiển thị</label>
                                            <select class="small">
                                                <option data-display="Chọn">9</option>
                                                <option value="15">15</option>
                                                <option value="30">30</option>
                                            </select>
                                            <span>trên trang</span>
                                        </div>

                                    </div>
                                    <!--Toolbar Short Area End-->
                                </div>
                                <!-- Grid & List View End -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="shop-product">
                                    <div id="myTabContent-2" class="tab-content">
                                        <div id="grid" class="tab-pane fade active show">
                                            <!-- san pham  -->
                                             <div class="product-grid-view">
                                        <div class="row">
                                            <c:forEach var="p" items="${products}">
                                                <div class="col-lg-4 col-md-6 col-sm-6">
                                                    <div class="single-product mb-30">
                                                        <div class="product-img">
                                                            <a href="${pageContext.request.contextPath}/user/productDetails/${p.id}">
                                                                <img src="${pageContext.request.contextPath}/assets/uploads/${p.image}"
                                                                    alt="${p.name}"
                                                                    onerror="this.src='${pageContext.request.contextPath}/assets/images/no-image.png'"/>
                                                            </a>
                                                            <c:if test="${p.discount > 0}">
                                                                <span class="descount-sticker">-${p.discount}%</span>
                                                            </c:if>
                                                            <div class="product-action d-flex justify-content-between">

                                                                    <form action="${pageContext.request.contextPath}/user/cart/add" method="post" style="display:inline;">
                                                                        <input type="hidden" name="productId" value="${p.id}"/>
                                                                        <input type="hidden" name="quantity" value="1"/>
                                                                        <input type="hidden" name="returnUrl" value="/user/product"/>
                                                                        <button type="submit" class="product-btn" title="Thêm vào giỏ hàng">
                                                                            <i class="fa fa-shopping-cart"></i>
                                                                        </button>
                                                                    </form>
                                                                  
                                                                </div>
                                                        </div>
                                                        <div class="product-content">
                                                            <h3><a href="${pageContext.request.contextPath}/user/productDetails/${p.id}">${p.name}</a></h3>
                                                            <h4 class="price">
                                                                <c:choose>
                                                                    <c:when test="${p.discount > 0}">
                                                                        <span class="new">${p.price * (1 - p.discount/100)}</span>
                                                                        <span class="old">${p.price}</span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="new">${p.price}</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </h4>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                            <!--  -->
                                        </div>
                                        <div id="list" class="tab-pane fade">
                                            <div class="product-list-view">
                                                <!-- Single List Product Start -->
                                                <div class="product-list-item mb-40">
                                                    <div class="row align-items-center">
                                                        <div class="col-md-4 col-sm-6">
                                                            <div class="single-product">
                                                                <div class="product-img mb-0 mb-xs-25">
                                                                    <a href="single-product.html">
                                                                        <img src="./assets/images/product/product-18.jpg"
                                                                            alt="">
                                                                    </a>
                                                                    <span class="descount-sticker">-10%</span>
                                                                    <span class="sticker">New</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-6">
                                                            <div class="product-content-shop-list">
                                                                <div class="product-content">
                                                                    <h3><a href="single-product.html">White Shave
                                                                            Brux</a></h3>
                                                                    <h4 class="price"><span class="new">90.00</span>
                                                                    </h4>
                                                                    <div class="ratting">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                    </div>
                                                                    <p>Pellentesque habitant morbi tristique senectus et
                                                                        netus et malesuada fames ac turpis egestas.
                                                                        Vestibulum tortor quam, feugiat vitae, ultricies
                                                                        eget, tempor sit amet, ante. Donec eu libero sit
                                                                        amet quam egestas semper. Aenean ultricies mi
                                                                        vitae est. Mauris placerat eleifend leo.</p>
                                                                    <div
                                                                        class="product-action d-flex justify-content-between">
                                                                        <a class="product-btn" href="#">Mua hàng</a>
                                                                        <ul class="d-flex">
                                                                            <li><a href="#quick-view-modal-container"
                                                                                    data-toggle="modal"
                                                                                    title="Quick View"><i
                                                                                        class="fa fa-eye"></i></a></li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-heart-o"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-exchange"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Single List Product Start -->
                                                <!-- Single List Product Start -->
                                                <div class="product-list-item mb-40">
                                                    <div class="row align-items-center">
                                                        <div class="col-md-4 col-sm-6">
                                                            <div class="single-product">
                                                                <div class="product-img mb-0 mb-xs-25">
                                                                    <a href="single-product.html">
                                                                        <img src="./assets/images/product/product-17.jpg"
                                                                            alt="">
                                                                    </a>
                                                                    <span class="descount-sticker">-10%</span>
                                                                    <span class="sticker">New</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-6">
                                                            <div class="product-content-shop-list">
                                                                <div class="product-content">
                                                                    <h3><a href="single-product.html">Aftershave
                                                                            Lotion</a></h3>
                                                                    <h4 class="price"><span
                                                                            class="new">90.00</span><span
                                                                            class="old">150.00</span></h4>
                                                                    <div class="ratting">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                    </div>
                                                                    <p>Pellentesque habitant morbi tristique senectus et
                                                                        netus et malesuada fames ac turpis egestas.
                                                                        Vestibulum tortor quam, feugiat vitae, ultricies
                                                                        eget, tempor sit amet, ante. Donec eu libero sit
                                                                        amet quam egestas semper. Aenean ultricies mi
                                                                        vitae est. Mauris placerat eleifend leo.</p>
                                                                    <div
                                                                        class="product-action d-flex justify-content-between">
                                                                        <a class="product-btn" href="#">Mua hàng</a>
                                                                        <ul class="d-flex">
                                                                            <li><a href="#quick-view-modal-container"
                                                                                    data-toggle="modal"
                                                                                    title="Quick View"><i
                                                                                        class="fa fa-eye"></i></a></li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-heart-o"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-exchange"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Single List Product Start -->
                                                <!-- Single List Product Start -->
                                                <div class="product-list-item mb-40">
                                                    <div class="row align-items-center">
                                                        <div class="col-md-4 col-sm-6">
                                                            <div class="single-product">
                                                                <div class="product-img mb-0 mb-xs-25">
                                                                    <a href="single-product.html">
                                                                        <img src="./assets/images/product/product-15.jpg"
                                                                            alt="">
                                                                    </a>
                                                                    <span class="descount-sticker">-10%</span>
                                                                    <span class="sticker">New</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-6">
                                                            <div class="product-content-shop-list">
                                                                <div class="product-content">
                                                                    <h3><a href="single-product.html">White Shave
                                                                            Brush</a></h3>
                                                                    <h4 class="price"><span
                                                                            class="new">110.00</span><span
                                                                            class="old">130.00</span></h4>
                                                                    <div class="ratting">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                    </div>
                                                                    <p>Pellentesque habitant morbi tristique senectus et
                                                                        netus et malesuada fames ac turpis egestas.
                                                                        Vestibulum tortor quam, feugiat vitae, ultricies
                                                                        eget, tempor sit amet, ante. Donec eu libero sit
                                                                        amet quam egestas semper. Aenean ultricies mi
                                                                        vitae est. Mauris placerat eleifend leo.</p>
                                                                    <div
                                                                        class="product-action d-flex justify-content-between">
                                                                        <a class="product-btn" href="#">Mua hàng</a>
                                                                        <ul class="d-flex">
                                                                            <li><a href="#quick-view-modal-container"
                                                                                    data-toggle="modal"
                                                                                    title="Quick View"><i
                                                                                        class="fa fa-eye"></i></a></li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-heart-o"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-exchange"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Single List Product Start -->
                                                <!-- Single List Product Start -->
                                                <div class="product-list-item mb-40">
                                                    <div class="row align-items-center">
                                                        <div class="col-md-4 col-sm-6">
                                                            <div class="single-product">
                                                                <div class="product-img mb-0 mb-xs-25">
                                                                    <a href="single-product.html">
                                                                        <img src="./assets/images/product/product-12.jpg"
                                                                            alt="">
                                                                    </a>
                                                                    <span class="descount-sticker">-10%</span>
                                                                    <span class="sticker">New</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-6">
                                                            <div class="product-content-shop-list">
                                                                <div class="product-content">
                                                                    <h3><a href="single-product.html">White Shave
                                                                            Bruj</a></h3>
                                                                    <h4 class="price"><span class="new">80.00</span>
                                                                    </h4>
                                                                    <div class="ratting">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                    </div>
                                                                    <p>Pellentesque habitant morbi tristique senectus et
                                                                        netus et malesuada fames ac turpis egestas.
                                                                        Vestibulum tortor quam, feugiat vitae, ultricies
                                                                        eget, tempor sit amet, ante. Donec eu libero sit
                                                                        amet quam egestas semper. Aenean ultricies mi
                                                                        vitae est. Mauris placerat eleifend leo.</p>
                                                                    <div
                                                                        class="product-action d-flex justify-content-between">
                                                                        <a class="product-btn" href="#">Mua hàng</a>
                                                                        <ul class="d-flex">
                                                                            <li><a href="#quick-view-modal-container"
                                                                                    data-toggle="modal"
                                                                                    title="Quick View"><i
                                                                                        class="fa fa-eye"></i></a></li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-heart-o"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-exchange"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Single List Product Start -->
                                                <!-- Single List Product Start -->
                                                <div class="product-list-item mb-40">
                                                    <div class="row align-items-center">
                                                        <div class="col-md-4 col-sm-6">
                                                            <div class="single-product">
                                                                <div class="product-img mb-0 mb-xs-25">
                                                                    <a href="single-product.html">
                                                                        <img src="./assets/images/product/product-13.jpg"
                                                                            alt="">
                                                                    </a>
                                                                    <span class="descount-sticker">-10%</span>
                                                                    <span class="sticker">New</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8 col-sm-6">
                                                            <div class="product-content-shop-list">
                                                                <div class="product-content">
                                                                    <h3><a href="single-product.html">White Shave
                                                                            Bruk</a></h3>
                                                                    <h4 class="price"><span class="new">60.00</span>
                                                                    </h4>
                                                                    <div class="ratting">
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                        <i class="fa fa-star"></i>
                                                                    </div>
                                                                    <p>Pellentesque habitant morbi tristique senectus et
                                                                        netus et malesuada fames ac turpis egestas.
                                                                        Vestibulum tortor quam, feugiat vitae, ultricies
                                                                        eget, tempor sit amet, ante. Donec eu libero sit
                                                                        amet quam egestas semper. Aenean ultricies mi
                                                                        vitae est. Mauris placerat eleifend leo.</p>
                                                                    <div
                                                                        class="product-action d-flex justify-content-between">
                                                                        <a class="product-btn" href="#">Mua hàng</a>
                                                                        <ul class="d-flex">
                                                                            <li><a href="#quick-view-modal-container"
                                                                                    data-toggle="modal"
                                                                                    title="Quick View"><i
                                                                                        class="fa fa-eye"></i></a></li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-heart-o"></i></a>
                                                                            </li>
                                                                            <li><a href="#"><i
                                                                                        class="fa fa-exchange"></i></a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Single List Product Start -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-30 mb-sm-40 mb-xs-30">
                            <div class="col">
                                <!-- phan trang -->
                               <ul class="page-pagination">
    <li>
        <a href="${pageContext.request.contextPath}/user/product?page=${currentPage - 1}&size=9"
        class="${currentPage == 0 ? 'disabled' : ''}">
            <i class="fa fa-angle-left"></i>
        </a>
    </li>

    <c:forEach begin="0" end="${totalPages - 1}" var="i">
        <li class="${i == currentPage ? 'active' : ''}">
            <a href="${pageContext.request.contextPath}/user/product?page=${i}&size=9">
                ${i + 1}
            </a>
        </li>
    </c:forEach>

    <li>
        <a href="${pageContext.request.contextPath}/user/product?page=${currentPage + 1}&size=9"
        class="${currentPage == totalPages - 1 ? 'disabled' : ''}">
            <i class="fa fa-angle-right"></i>
        </a>
    </li>
</ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Section End -->

        <!--Brand section start-->
        <div
            class="brand-section section border-top pt-90 pt-lg-70 pt-md-65 pt-sm-55 pt-xs-40 pb-100 pb-lg-80 pb-md-70 pb-sm-60 pb-xs-50">
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
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-1.png" alt=""></a></div>
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-2.png" alt=""></a></div>
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-3.png" alt=""></a></div>
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-4.png" alt=""></a></div>
                        <div class="brand col"><a href="#"><img src="assets/images/brands/brand-5.png" alt=""></a></div>
                    </div>
                    <!--Brand Slider end-->

                </div>
            </div>
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
                                <li><i class="fa fa-home"></i><span>FPT Polytechnic</span>
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
</body>

</html>