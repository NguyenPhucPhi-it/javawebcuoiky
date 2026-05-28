<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/productDetails.css">
</head>
<body>

<!-- Page Banner -->
<div class="page-banner-section section bg-gray">
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="page-banner text-center">
                    <h1>Chi tiết sản phẩm</h1>
                    <ul class="page-breadcrumb">
                        <li><a href="/user/home">Trang chủ</a></li>
                        <li><a href="/user/product">Sản phẩm</a></li>
                        <li>${product.name}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Product Details -->
<div class="product-details-section section">
    <div class="container">
        <div class="row">


            <div class="col-lg-6 col-12 mb-50">
                <div class="product-details-images">
                    <div class="lg-image">
                        <img id="mainImage"
                             src="${pageContext.request.contextPath}/assets/uploads/${product.image}"
                             alt="${product.name}"
                             style="width:100%; max-height:450px; object-fit:cover;"
                             onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'">
                    </div>
                </div>
            </div>

     
            <div class="col-lg-6 col-12 mb-50">
                <div class="product-details-content">

                    <h2>${product.name}</h2>

                    <div class="single-product-reviews" style="margin:10px 0;">
                        <div class="ratting">
                            <i class="fa fa-star" style="color:#f5a623;"></i>
                            <i class="fa fa-star" style="color:#f5a623;"></i>
                            <i class="fa fa-star" style="color:#f5a623;"></i>
                            <i class="fa fa-star" style="color:#f5a623;"></i>
                            <i class="fa fa-star" style="color:#f5a623;"></i>
                        </div>
                    </div>

            
                    <div class="single-product-price" style="margin:15px 0;">
                        <c:choose>
                            <c:when test="${product.discount != null && product.discount > 0}">
                                <c:set var="salePrice" value="${product.price * (100 - product.discount) / 100}"/>
                                <span class="price new-price" style="font-size:24px; color:#e91e63; font-weight:bold;">
                                    <fmt:formatNumber value="${salePrice}" type="number"/> đ
                                </span>
                                <span class="regular-price" style="text-decoration:line-through; color:#999; margin-left:10px;">
                                    <fmt:formatNumber value="${product.price}" type="number"/> đ
                                </span>
                                <span class="price-off" style="background:#e91e63; color:white; padding:2px 8px; border-radius:3px; margin-left:10px; font-size:13px;">
                                    -${product.discount}%
                                </span>
                            </c:when>
                            <c:otherwise>
                                <span class="price new-price" style="font-size:24px; color:#e91e63; font-weight:bold;">
                                    <fmt:formatNumber value="${product.price}" type="number"/> đ
                                </span>
                            </c:otherwise>
                        </c:choose>
                    </div>

              
                    <div class="product-description" style="margin:15px 0; color:#555;">
                        <p>${product.description}</p>
                    </div>

            
                    <div style="margin:10px 0;">
                        <c:choose>
                            <c:when test="${product.quantity > 0}">
                                <span style="color:#30b878;"><i class="fa fa-check"></i> Còn hàng (${product.quantity} sản phẩm)</span>
                            </c:when>
                            <c:otherwise>
                                <span style="color:red;"><i class="fa fa-times"></i> Hết hàng</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

           
                    <form action="${pageContext.request.contextPath}/user/cart/add" method="post" style="margin:20px 0;">
                        <input type="hidden" name="productId" value="${product.id}"/>
                        <div class="single-product-quantity d-flex align-items-center" style="gap:10px;">
                            <div class="product-quantity">
                                <input type="number" name="quantity" value="1" min="1"
                                       max="${product.quantity}"
                                       style="width:70px; padding:8px; border:1px solid #ddd; text-align:center;">
                            </div>
                            <button type="submit" class="product-add-btn"
                                    style="padding:10px 25px; background:#cea679; color:white; border:none; cursor:pointer; font-size:15px;">
                                <i class="fa fa-shopping-cart"></i> Thêm vào giỏ
                            </button>
                        </div>
                    </form>

       
                    <form action="${pageContext.request.contextPath}/user/cart/add" method="post">
                        <input type="hidden" name="productId" value="${product.id}"/>
                        <input type="hidden" name="quantity" value="1"/>
                        <button type="submit" style="width:100%; padding:12px; background:#e91e63; color:white; border:none; cursor:pointer; font-size:16px; margin-bottom:15px;">
                            <i class="fa fa-bolt"></i> Mua ngay
                        </button>
                    </form>

            
                    <div class="wishlist-compare-btn" style="margin:10px 0;">
                        <a href="#" style="margin-right:20px; color:#555;">
                            <i class="fa fa-heart-o"></i> Yêu thích
                        </a>
                        <a href="#" style="color:#555;">
                            <i class="fa fa-exchange"></i> So sánh
                        </a>
                    </div>

          
                    <div class="product-meta" style="margin-top:15px; padding-top:15px; border-top:1px solid #eee; color:#777; font-size:13px;">
                        <span>Mã SP: #${product.id}</span>
                    </div>
                </div>
            </div>
        </div>

    
        <div class="row">
            <div class="col-12">
                <div class="product-details-tab-content section" style="margin-top:30px;">
                    <ul class="nav dec-and-review-menu" style="border-bottom:2px solid #eee; list-style:none; padding:0; display:flex; gap:5px;">
                        <li>
                            <a class="active tab-link" data-target="#description"
                               style="display:block; padding:10px 20px; background:#cea679; color:white; text-decoration:none; cursor:pointer;">
                               Mô tả
                            </a>
                        </li>
                        <li>
                            <a class="tab-link" data-target="#additional-info"
                               style="display:block; padding:10px 20px; background:#f5f5f5; color:#333; text-decoration:none; cursor:pointer;">
                               Thông tin bổ sung
                            </a>
                        </li>
                    </ul>

                    <div style="padding:20px; border:1px solid #eee; border-top:none;">
                        <div id="description" class="tab-panel" style="display:block;">
                            <h4>Mô tả sản phẩm</h4>
                            <p>${product.description}</p>
                        </div>

                        <div id="additional-info" class="tab-panel" style="display:none;">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr><th>Tên sản phẩm</th><td>${product.name}</td></tr>
                                    <tr><th>Giá gốc</th>
                                        <td><fmt:formatNumber value="${product.price}" type="number"/> đ</td>
                                    </tr>
                                    <tr><th>Giảm giá</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${product.discount != null && product.discount > 0}">
                                                    ${product.discount}%
                                                </c:when>
                                                <c:otherwise>Không có</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    <tr><th>Tồn kho</th><td>${product.quantity} sản phẩm</td></tr>
                                    <tr><th>Mã sản phẩm</th><td>#${product.id}</td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
// Tab switching
document.querySelectorAll('.tab-link').forEach(function(link) {
    link.addEventListener('click', function(e) {
        e.preventDefault();
        document.querySelectorAll('.tab-link').forEach(function(l) {
            l.style.background = '#f5f5f5';
            l.style.color = '#333';
        });
        this.style.background = '#cea679';
        this.style.color = 'white';

        document.querySelectorAll('.tab-panel').forEach(function(p) {
            p.style.display = 'none';
        });
        var target = this.getAttribute('data-target');
        document.querySelector(target).style.display = 'block';
    });
});
</script>
</body>
</html>