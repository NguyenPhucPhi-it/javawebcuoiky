<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lịch sử mua hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body { background:#f5f5f5; font-family:Arial,sans-serif; }
        .wrapper { max-width:860px; margin:36px auto; padding:0 15px; }
        .page-title { font-size:22px; font-weight:700; color:#333;
                      margin-bottom:20px; border-left:4px solid #e91e63; padding-left:12px; }
        .order-card { background:#fff; border-radius:8px;
                      box-shadow:0 1px 6px rgba(0,0,0,.08);
                      margin-bottom:16px; overflow:hidden; }
        .order-header { display:flex; justify-content:space-between; align-items:center;
                        padding:12px 20px; background:#fafafa; border-bottom:1px solid #f0f0f0; }
        .order-id   { font-weight:700; color:#555; font-size:14px; }
        .order-date { font-size:13px; color:#999; }
        .badge-status { padding:4px 14px; border-radius:20px; font-size:12px; font-weight:700; }
        .s-cho     { background:#fff3e0; color:#e65100; }
        .s-confirm { background:#e3f2fd; color:#1565c0; }
        .s-ship    { background:#f3e5f5; color:#6a1b9a; }
        .s-ok      { background:#e8f5e9; color:#2e7d32; }
        .s-nhan    { background:#e3f2fd; color:#1565c0; }
        .s-huy     { background:#ffebee; color:#c62828; }
        .product-row { display:flex; align-items:center; gap:16px;
                       padding:16px 20px; border-bottom:1px solid #f9f9f9; }
        .prod-img  { width:72px; height:72px; object-fit:cover;
                     border-radius:6px; flex-shrink:0; border:1px solid #eee; }
        .prod-info { flex:1; }
        .prod-name { font-weight:600; font-size:15px; color:#333; margin-bottom:4px; }
        .prod-qty  { font-size:13px; color:#888; }
        .prod-price { text-align:right; min-width:120px; }
        .unit-price { font-size:13px; color:#999; }
        .line-total { font-weight:700; font-size:16px; color:#e91e63; }
        .order-footer { display:flex; justify-content:space-between; align-items:center;
                        padding:12px 20px; background:#fafafa; border-top:1px solid #f0f0f0; }
        .total-label  { font-size:14px; color:#555; }
        .total-amount { font-weight:700; font-size:18px; color:#e91e63; }
        .btn-detail { background:#fff; color:#555; border:1px solid #ccc;
                      text-decoration:none; padding:7px 18px; border-radius:5px;
                      font-size:13px; font-weight:600; display:inline-block; }
        .btn-detail:hover { background:#f5f5f5; color:#333; }
        .btn-cancel-order { background:#fff; color:#f44336; border:1px solid #f44336;
                            padding:7px 18px; border-radius:5px; font-size:13px;
                            font-weight:600; cursor:pointer; }
        .btn-cancel-order:hover { background:#f44336; color:#fff; }
        .empty { text-align:center; padding:80px 0; color:#bbb; }
        .btn-back { background:#555; color:#fff; padding:10px 22px;
                    border-radius:6px; text-decoration:none; font-size:14px;
                    display:inline-block; margin-top:20px; }
        .btn-back:hover { background:#333; color:#fff; }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="page-title">
        <i class="fa fa-history" style="color:#e91e63;"></i> Lịch sử mua hàng
    </div>

    <div style="text-align:right; margin-bottom:16px;">
        <a href="${pageContext.request.contextPath}/user/product"
           style="padding:10px 20px; background:#555; color:white; text-decoration:none; border-radius:4px;">
            Tiếp tục mua sắm
        </a>
    </div>

    <c:choose>
        <c:when test="${empty items}">
            <div class="empty">
                <i class="fa fa-inbox" style="font-size:56px;"></i>
                <p style="margin-top:14px; font-size:16px;">Bạn chưa mua sản phẩm nào.</p>
                <a href="${pageContext.request.contextPath}/user/product"
                   style="background:#e91e63;color:#fff;padding:10px 28px;
                          border-radius:6px;text-decoration:none;display:inline-block;margin-top:8px;">
                    Mua sắm ngay
                </a>
            </div>
        </c:when>
        <c:otherwise>

            <c:set var="currentOrderId"     value="-1"/>
            <c:set var="currentOrderStatus" value=""/>
            <c:set var="orderTotal"         value="0"/>

            <c:forEach items="${items}" var="item" varStatus="loop">

              
                <c:if test="${item.order.id != currentOrderId}">

            
                    <c:if test="${currentOrderId != -1}">
                        <div class="order-footer">
                            <div>
                                <span class="total-label">Tổng đơn:</span>
                                <span class="total-amount">
                                    <fmt:formatNumber value="${orderTotal}" type="number"/> đ
                                </span>
                            </div>
                            <div style="display:flex; gap:8px; align-items:center;">
                                <c:if test="${currentOrderStatus == 'Chờ xác nhận'}">
                                    <form action="${pageContext.request.contextPath}/user/orders/cancel"
                                          method="post"
                                          onsubmit="return confirm('Bạn chắc chắn muốn hủy đơn #${currentOrderId}?')">
                                        <input type="hidden" name="orderId" value="${currentOrderId}"/>
                                        <button type="submit" class="btn-cancel-order">
                                            <i class="fa fa-times"></i> Hủy đơn
                                        </button>
                                    </form>
                                </c:if>
                                <a href="${pageContext.request.contextPath}/user/orders/${currentOrderId}"
                                   class="btn-detail">
                                    <i class="fa fa-eye"></i> Chi tiết
                                </a>
                            </div>
                        </div>
                        </div>
                    </c:if>

         
                    <c:set var="orderTotal"         value="0"/>
                    <c:set var="currentOrderId"     value="${item.order.id}"/>
                    <c:set var="currentOrderStatus" value="${item.order.status}"/>

    
                    <c:set var="badgeClass" value="s-cho"/>
                    <c:if test="${item.order.status == 'Đã xác nhận'}"> <c:set var="badgeClass" value="s-confirm"/></c:if>
                    <c:if test="${item.order.status == 'Đang giao'}">   <c:set var="badgeClass" value="s-ship"/></c:if>
                    <c:if test="${item.order.status == 'Thành công'}">  <c:set var="badgeClass" value="s-ok"/></c:if>
                    <c:if test="${item.order.status == 'Đã nhận hàng'}"><c:set var="badgeClass" value="s-nhan"/></c:if>
                    <c:if test="${item.order.status == 'Đã hủy'}">      <c:set var="badgeClass" value="s-huy"/></c:if>

                    <div class="order-card">
                        <div class="order-header">
                            <div>
                                <span class="order-id">
                                    <i class="fa fa-shopping-bag" style="color:#e91e63;"></i>
                                    Đơn #${item.order.id}
                                </span>
                                <span class="order-date" style="margin-left:12px;">
                                    ${item.order.orderDate}
                                </span>
                            </div>
                            <span class="badge-status ${badgeClass}">
                                <c:choose>
                                    <c:when test="${item.order.status == 'Đã xác nhận'}">  <i class="fa fa-check"></i></c:when>
                                    <c:when test="${item.order.status == 'Đang giao'}">    <i class="fa fa-truck"></i></c:when>
                                    <c:when test="${item.order.status == 'Thành công'}">   <i class="fa fa-check-circle"></i></c:when>
                                    <c:when test="${item.order.status == 'Đã nhận hàng'}"><i class="fa fa-home"></i></c:when>
                                    <c:when test="${item.order.status == 'Đã hủy'}">       <i class="fa fa-times-circle"></i></c:when>
                                    <c:otherwise>                                           <i class="fa fa-clock-o"></i></c:otherwise>
                                </c:choose>
                                ${item.order.status}
                            </span>
                        </div>
                </c:if>

                <c:set var="lineTotal" value="${item.detail.unitPrice * item.detail.quantity}"/>
                <c:set var="orderTotal" value="${orderTotal + lineTotal}"/>
                <div class="product-row">
                    <img src="${pageContext.request.contextPath}/assets/uploads/${item.product.image}"
                         class="prod-img"
                         onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'"
                         alt="${item.product.name}">
                    <div class="prod-info">
                        <div class="prod-name">${item.product.name}</div>
                        <div class="prod-qty">Số lượng: x${item.detail.quantity}</div>
                    </div>
                    <div class="prod-price">
                        <div class="unit-price">
                            <fmt:formatNumber value="${item.detail.unitPrice}" type="number"/> đ / cái
                        </div>
                        <div class="line-total">
                            <fmt:formatNumber value="${lineTotal}" type="number"/> đ
                        </div>
                    </div>
                </div>

                <c:if test="${loop.last}">
                    <div class="order-footer">
                        <div>
                            <span class="total-label">Tổng đơn:</span>
                            <span class="total-amount">
                                <fmt:formatNumber value="${orderTotal}" type="number"/> đ
                            </span>
                        </div>
                        <div style="display:flex; gap:8px; align-items:center;">
                            <c:if test="${item.order.status == 'Chờ xác nhận'}">
                                <form action="${pageContext.request.contextPath}/user/orders/cancel"
                                      method="post"
                                      onsubmit="return confirm('Bạn chắc chắn muốn hủy đơn #${item.order.id}?')">
                                    <input type="hidden" name="orderId" value="${item.order.id}"/>
                                    <button type="submit" class="btn-cancel-order">
                                        <i class="fa fa-times"></i> Hủy đơn
                                    </button>
                                </form>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/user/orders/${item.order.id}"
                               class="btn-detail">
                                <i class="fa fa-eye"></i> Chi tiết
                            </a>
                        </div>
                    </div>
                    </div>
                </c:if>

            </c:forEach>

        </c:otherwise>
    </c:choose>

    <a href="${pageContext.request.contextPath}/user/home" class="btn-back">
        <i class="fa fa-angle-left"></i> Trang chủ
    </a>
</div>

<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>