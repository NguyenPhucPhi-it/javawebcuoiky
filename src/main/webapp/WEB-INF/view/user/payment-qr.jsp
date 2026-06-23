<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán QR – Poly Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <style>
        body { background:#f7f7f7; }
        .qr-wrapper { max-width:480px; margin:50px auto; background:#fff; border-radius:10px;
                      box-shadow:0 2px 10px rgba(0,0,0,.1); padding:30px; text-align:center; }
        .qr-wrapper h3 { color:#333; margin-bottom:6px; }
        .qr-wrapper .amount { font-size:24px; font-weight:700; color:#e91e63; margin:14px 0; }
        .qr-wrapper img { border:1px solid #eee; border-radius:8px; margin:14px 0; }
        .qr-info { text-align:left; background:#fafafa; border-radius:8px; padding:14px 18px; margin:16px 0; font-size:14px; }
        .qr-info div { margin-bottom:6px; }
        .btn-confirm { background:#4caf50; color:#fff; border:none; padding:12px 30px;
                       font-size:16px; border-radius:6px; cursor:pointer; width:100%; }
        .btn-confirm:hover { background:#388e3c; }
        .note { font-size:13px; color:#999; margin-top:14px; }
    </style>
</head>
<body>

<div class="qr-wrapper">
    <h3><i class="fa fa-qrcode" style="color:#e91e63;"></i> Quét mã để thanh toán</h3>
    <p style="color:#888;">Đơn hàng #${order.id} – Poly Shop</p>

    <div class="amount">
        <fmt:formatNumber value="${payment.amount}" type="number"/> đ
    </div>

    <!-- QR giả lập, sinh tự động từ nội dung chuyển khoản -->
    <img src="https://api.qrserver.com/v1/create-qr-code/?size=220x220&data=POLYSHOP-ORDER-${order.id}-AMOUNT-${payment.amount}"
         alt="QR thanh toán" width="220" height="220">

    <div class="qr-info">
        <div><b>Ngân hàng:</b> Vietcombank (giả lập)</div>
        <div><b>Số tài khoản:</b> 0123456789</div>
        <div><b>Chủ tài khoản:</b> POLY SHOP</div>
        <div><b>Nội dung CK:</b> DH${order.id} ${loggedUser.username}</div>
    </div>

    <form action="${pageContext.request.contextPath}/user/payment-qr/confirm" method="post">
        <input type="hidden" name="orderId" value="${order.id}"/>
        <button type="submit" class="btn-confirm">
            <i class="fa fa-check-circle"></i> Tôi đã thanh toán
        </button>
    </form>

    <p class="note">* Đây là mã QR giả lập dùng cho mục đích demo, không phát sinh giao dịch thật.</p>
</div>

</body>
</html>