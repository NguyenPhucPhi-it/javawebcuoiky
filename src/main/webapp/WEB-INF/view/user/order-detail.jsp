<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng #${order.id} – Poly Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body { background:#f5f5f5; font-family:Arial,sans-serif; }
        .wrapper { max-width:820px; margin:36px auto; padding:0 15px; }
        .page-title { font-size:20px; font-weight:700; color:#333;
                      margin-bottom:20px; border-left:4px solid #e91e63; padding-left:12px; }
        .card-box { background:#fff; border-radius:8px;
                    box-shadow:0 1px 6px rgba(0,0,0,.08);
                    padding:24px; margin-bottom:16px; }
        .card-box h5 { font-weight:700; color:#e91e63;
                       border-bottom:2px solid #e91e63;
                       padding-bottom:8px; margin-bottom:16px; font-size:16px; }
        .row-info { display:flex; justify-content:space-between;
                    padding:9px 0; border-bottom:1px solid #f5f5f5; font-size:14px; }
        .row-info:last-child { border:none; }
        .lbl { color:#999; }
        .val { font-weight:600; color:#333; }
        .badge-status { padding:4px 13px; border-radius:20px;
                        font-size:12px; font-weight:700; white-space:nowrap; }
        .status-cho    { background:#fff3e0; color:#e65100; }
        .status-confirm{ background:#e8eaf6; color:#283593; }
        .status-ship   { background:#f3e5f5; color:#6a1b9a; }
        .status-ok     { background:#e8f5e9; color:#2e7d32; }
        .status-nhan   { background:#e3f2fd; color:#1565c0; }
        .status-huy    { background:#ffebee; color:#c62828; }

        /* Timeline */
        .timeline { list-style:none; padding:0; margin:0; }
        .timeline li { display:flex; align-items:center; gap:14px;
                       padding:11px 0; border-bottom:1px solid #f5f5f5; font-size:14px; }
        .timeline li:last-child { border:none; }
        .tl-dot { width:13px; height:13px; border-radius:50%; flex-shrink:0; }
        .dot-cho     { background:#ff9800; }
        .dot-confirm { background:#3f51b5; }
        .dot-ship    { background:#9c27b0; }
        .dot-ok      { background:#4caf50; }
        .dot-huy     { background:#f44336; }
        .dot-off     { background:#ddd; }

        /* Product row */
        .product-row { display:flex; align-items:center; gap:14px;
                       padding:16px 0; border-bottom:1px solid #f5f5f5; flex-wrap:wrap; }
        .product-row:last-of-type { border-bottom:none; }
        .prod-img  { width:74px; height:74px; object-fit:cover;
                     border-radius:6px; border:1px solid #eee; flex-shrink:0; }
        .prod-info { flex:1; min-width:140px; }
        .prod-name { font-weight:600; font-size:15px; color:#333; margin-bottom:4px; }
        .prod-meta { font-size:13px; color:#999; line-height:1.7; }
        .prod-total { min-width:110px; text-align:right; }
        .prod-total .amount { font-weight:700; font-size:16px; color:#e91e63; }

        .btn-back { background:#555; color:#fff; padding:10px 22px;
                    border-radius:6px; text-decoration:none;
                    font-size:14px; display:inline-block; }
        .btn-back:hover { background:#333; color:#fff; }
        .btn-cancel-order { background:#fff; color:#f44336; border:1px solid #f44336;
                            padding:9px 22px; border-radius:6px; font-size:14px;
                            font-weight:600; cursor:pointer; }
        .btn-cancel-order:hover { background:#f44336; color:#fff; }
        .grand-total { display:flex; justify-content:flex-end;
                       padding-top:14px; font-size:16px; font-weight:700;
                       border-top:2px solid #f5f5f5; margin-top:4px; }
        .grand-total .label  { color:#555; margin-right:16px; }
        .grand-total .amount { color:#e91e63; font-size:20px; }
    </style>
</head>
<body>
<div class="wrapper">

    <div class="page-title">
        <i class="fa fa-file-text-o" style="color:#e91e63;"></i>
        Chi tiết đơn hàng #${order.id}
    </div>

    <%-- ── Thông tin người nhận ── --%>
    <div class="card-box">
        <h5><i class="fa fa-user-o"></i> Thông tin người nhận</h5>
        <div class="row-info">
            <span class="lbl">Người nhận</span>
            <span class="val">${order.receiverName}</span>
        </div>
        <div class="row-info">
            <span class="lbl">Email</span>
            <span class="val">${order.receiverEmail}</span>
        </div>
        <div class="row-info">
            <span class="lbl">Điện thoại</span>
            <span class="val">${order.receiverPhone}</span>
        </div>
        <div class="row-info">
            <span class="lbl">Địa chỉ giao hàng</span>
            <span class="val">${order.address}</span>
        </div>
        <div class="row-info">
            <span class="lbl">Ngày đặt</span>
            <span class="val">${order.orderDate}</span>
        </div>
        <div class="row-info">
            <span class="lbl">Trạng thái đơn hàng</span>
            <span class="val">
                <c:set var="s" value="${order.status}"/>
                <c:choose>
                    <c:when test="${s == 'Chờ xác nhận'}">
                        <span class="badge-status status-cho"><i class="fa fa-clock-o"></i> ${s}</span>
                    </c:when>
                    <c:when test="${s == 'Đã xác nhận'}">
                        <span class="badge-status status-confirm"><i class="fa fa-check"></i> ${s}</span>
                    </c:when>
                    <c:when test="${s == 'Đang giao'}">
                        <span class="badge-status status-ship"><i class="fa fa-truck"></i> ${s}</span>
                    </c:when>
                    <c:when test="${s == 'Thành công'}">
                        <span class="badge-status status-ok"><i class="fa fa-check-circle"></i> ${s}</span>
                    </c:when>
                    <c:when test="${s == 'Đã hủy'}">
                        <span class="badge-status status-huy"><i class="fa fa-times-circle"></i> ${s}</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge-status status-cho"><i class="fa fa-clock-o"></i> ${s}</span>
                    </c:otherwise>
                </c:choose>
            </span>
        </div>

        <%-- Nút hủy đơn: chỉ hiện khi Chờ xác nhận --%>
        <c:if test="${order.status == 'Chờ xác nhận'}">
            <div style="margin-top:14px;">
                <form action="${pageContext.request.contextPath}/user/orders/cancel"
                      method="post"
                      onsubmit="return confirm('Bạn chắc chắn muốn hủy đơn hàng #${order.id}?')">
                    <input type="hidden" name="orderId" value="${order.id}"/>
                    <button type="submit" class="btn-cancel-order">
                        <i class="fa fa-times"></i> Hủy đơn hàng
                    </button>
                </form>
            </div>
        </c:if>
    </div>

    <%-- ── Timeline tiến trình ── --%>
    <div class="card-box">
        <h5><i class="fa fa-map-marker"></i> Tiến trình đơn hàng</h5>
        <c:set var="isCancelled" value="${order.status == 'Đã hủy'}"/>
        <ul class="timeline">
            <li>
                <span class="tl-dot dot-cho"></span>
                <span><strong>Chờ xác nhận</strong> – <em style="color:#999;">Đơn hàng đã được đặt</em></span>
            </li>
            <li>
                <c:choose>
                    <c:when test="${order.status == 'Đã xác nhận' or order.status == 'Đang giao' or order.status == 'Thành công'}">
                        <span class="tl-dot dot-confirm"></span>
                        <span><strong>Đã xác nhận</strong></span>
                    </c:when>
                    <c:otherwise>
                        <span class="tl-dot dot-off"></span>
                        <span style="color:#bbb;">Đã xác nhận</span>
                    </c:otherwise>
                </c:choose>
            </li>
            <li>
                <c:choose>
                    <c:when test="${order.status == 'Đang giao' or order.status == 'Thành công'}">
                        <span class="tl-dot dot-ship"></span>
                        <span><strong>Đang giao hàng</strong></span>
                    </c:when>
                    <c:otherwise>
                        <span class="tl-dot dot-off"></span>
                        <span style="color:#bbb;">Đang giao hàng</span>
                    </c:otherwise>
                </c:choose>
            </li>
            <li>
                <c:choose>
                    <c:when test="${order.status == 'Thành công'}">
                        <span class="tl-dot dot-ok"></span>
                        <span><strong>Giao thành công</strong></span>
                    </c:when>
                    <c:otherwise>
                        <span class="tl-dot dot-off"></span>
                        <span style="color:#bbb;">Giao thành công</span>
                    </c:otherwise>
                </c:choose>
            </li>
            <c:if test="${isCancelled}">
                <li>
                    <span class="tl-dot dot-huy"></span>
                    <span style="color:#c62828; font-weight:700;">
                        <i class="fa fa-times-circle"></i> Đơn hàng đã bị hủy
                    </span>
                </li>
            </c:if>
        </ul>
    </div>

    <%-- ── Danh sách sản phẩm (chỉ xem, không có action) ── --%>
    <div class="card-box">
        <h5><i class="fa fa-shopping-bag"></i> Sản phẩm trong đơn</h5>
        <c:set var="grandTotal" value="0"/>
        <c:forEach items="${details}" var="item">
            <c:set var="lineTotal"  value="${item.detail.unitPrice * item.detail.quantity}"/>
            <c:set var="grandTotal" value="${grandTotal + lineTotal}"/>
            <div class="product-row">
                <img src="${pageContext.request.contextPath}/assets/uploads/${item.product.image}"
                     class="prod-img"
                     onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'"
                     alt="${item.product.name}">
                <div class="prod-info">
                    <div class="prod-name">${item.product.name}</div>
                    <div class="prod-meta">
                        Số lượng: x${item.detail.quantity}<br>
                        Đơn giá: <fmt:formatNumber value="${item.detail.unitPrice}" type="number"/> đ
                    </div>
                </div>
                <div class="prod-total">
                    <div class="amount">
                        <fmt:formatNumber value="${lineTotal}" type="number"/> đ
                    </div>
                </div>
            </div>
        </c:forEach>
        <div class="grand-total">
            <span class="label">Tổng cộng đơn hàng:</span>
            <span class="amount">
                <fmt:formatNumber value="${grandTotal}" type="number"/> đ
            </span>
        </div>
    </div>

    <div style="margin-bottom:40px;">
        <a href="${pageContext.request.contextPath}/user/orders" class="btn-back">
            <i class="fa fa-angle-left"></i> Quay lại lịch sử
        </a>
    </div>

</div>
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>