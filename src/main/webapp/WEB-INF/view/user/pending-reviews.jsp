<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm chờ đánh giá – Poly Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body { background: #f5f5f5; font-family: Arial, sans-serif; }
        .wrapper { max-width: 860px; margin: 36px auto; padding: 0 15px; }

        .page-title {
            font-size: 22px; font-weight: 700; color: #333;
            margin-bottom: 24px; border-left: 4px solid #ff9800;
            padding-left: 14px;
        }

        .card-box {
            background: #fff; border-radius: 10px;
            box-shadow: 0 1px 6px rgba(0,0,0,.08);
            padding: 0; margin-bottom: 16px; overflow: hidden;
        }

        .product-row {
            display: flex; align-items: center; gap: 16px;
            padding: 18px 20px; border-bottom: 1px solid #f5f5f5;
            flex-wrap: wrap;
        }
        .product-row:last-child { border-bottom: none; }

        .prod-img {
            width: 80px; height: 80px; object-fit: cover;
            border-radius: 8px; border: 1px solid #eee; flex-shrink: 0;
        }

        .prod-info { flex: 1; min-width: 160px; }
        .prod-name { font-weight: 700; font-size: 15px; color: #333; margin-bottom: 4px; }
        .prod-meta { font-size: 13px; color: #999; line-height: 1.8; }

        .prod-price {
            min-width: 120px; text-align: right;
            font-weight: 700; font-size: 16px; color: #e91e63;
        }

        .btn-review {
            background: #ff9800; color: #fff; border: none;
            padding: 9px 20px; border-radius: 6px; font-size: 14px;
            font-weight: 600; cursor: pointer; white-space: nowrap;
            text-decoration: none; display: inline-block;
            transition: background .2s;
        }
        .btn-review:hover { background: #e65100; color: #fff; text-decoration: none; }

        .empty-box {
            text-align: center; padding: 60px 20px; color: #bbb;
            background: #fff; border-radius: 10px;
            box-shadow: 0 1px 6px rgba(0,0,0,.08);
        }
        .empty-box i { font-size: 52px; margin-bottom: 14px; display: block; }
        .empty-box p { font-size: 16px; margin: 0; }

        .count-badge {
            background: #ff9800; color: #fff;
            border-radius: 20px; padding: 2px 10px;
            font-size: 13px; font-weight: 700;
            margin-left: 8px; vertical-align: middle;
        }

        .btn-back {
            background: #555; color: #fff; padding: 10px 22px;
            border-radius: 6px; text-decoration: none;
            font-size: 14px; display: inline-block; margin-top: 20px;
        }
        .btn-back:hover { background: #333; color: #fff; }

        .order-ref {
            font-size: 12px; color: #aaa;
            background: #f9f9f9; padding: 3px 8px;
            border-radius: 4px; display: inline-block;
            margin-top: 4px;
        }
    </style>
</head>
<body>
<div class="wrapper">

    <div class="page-title">
        <i class="fa fa-star-o" style="color:#ff9800;"></i>
        Sản phẩm chờ đánh giá
        <c:if test="${not empty pendingItems}">
            <span class="count-badge">${pendingItems.size()}</span>
        </c:if>
    </div>

    <c:choose>
        <c:when test="${empty pendingItems}">
            <div class="empty-box">
                <i class="fa fa-check-circle" style="color:#4caf50;"></i>
                <p>Bạn đã đánh giá tất cả sản phẩm rồi!</p>
                <a href="${pageContext.request.contextPath}/user/orders"
                   style="color:#e91e63; font-size:14px; margin-top:10px; display:inline-block;">
                    <i class="fa fa-history"></i> Xem lịch sử đơn hàng
                </a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="card-box">
                <c:forEach items="${pendingItems}" var="item">
                    <div class="product-row">

                        <!-- Ảnh sản phẩm -->
                        <img src="${pageContext.request.contextPath}/assets/uploads/${item.product.image}"
                             class="prod-img"
                             onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'"
                             alt="${item.product.name}">

                        <!-- Thông tin -->
                        <div class="prod-info">
                            <div class="prod-name">${item.product.name}</div>
                            <div class="prod-meta">
                                Số lượng: x${item.detail.quantity}<br>
                                Đơn giá: <fmt:formatNumber value="${item.detail.unitPrice}" type="number"/> đ
                            </div>
                            <span class="order-ref">
                                <i class="fa fa-file-text-o"></i>
                                Đơn hàng #${item.detail.id_order}
                            </span>
                        </div>

                        <!-- Thành tiền -->
                        <div class="prod-price">
                            <fmt:formatNumber value="${item.lineTotal}" type="number"/> đ
                        </div>

                        <!-- Nút đánh giá -->
                        <div>
                            <a href="${pageContext.request.contextPath}/user/review/${item.detail.id}"
                               class="btn-review">
                                <i class="fa fa-star"></i> Đánh giá ngay
                            </a>
                        </div>

                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>

    <a href="${pageContext.request.contextPath}/user/orders" class="btn-back">
        <i class="fa fa-angle-left"></i> Quay lại lịch sử đơn hàng
    </a>

</div>

<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>