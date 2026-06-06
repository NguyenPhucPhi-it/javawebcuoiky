<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt hàng thành công – Poly Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <style>
        body { background: #f7f7f7; font-family: Arial, sans-serif; }
        .wrapper { max-width: 600px; margin: 60px auto; padding: 0 15px; text-align: center; }
        .icon { font-size: 80px; color: #4caf50; }
        .title { font-size: 28px; font-weight: 700; margin: 16px 0 8px; }
        .sub { color: #777; margin-bottom: 30px; }
        .box { background: #fff; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,.1); padding: 24px; text-align: left; margin-bottom: 24px; }
        .box h5 { font-weight: 700; color: #e91e63; border-bottom: 2px solid #e91e63; padding-bottom: 8px; margin-bottom: 16px; }
        .row-info { display: flex; justify-content: space-between; padding: 8px 0; border-bottom: 1px solid #f0f0f0; font-size: 15px; }
        .row-info:last-child { border: none; }
        .lbl { color: #888; }
        .val { font-weight: 600; }
        .btn-pink { background: #e91e63; color: #fff; padding: 12px 28px; border-radius: 6px; text-decoration: none; display: inline-block; margin: 4px; }
        .btn-pink:hover { background: #c2185b; color: #fff; }
        .btn-gray { background: #555; color: #fff; padding: 12px 28px; border-radius: 6px; text-decoration: none; display: inline-block; margin: 4px; }
        .btn-gray:hover { background: #333; color: #fff; }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="icon"><i class="fa fa-check-circle"></i></div>
    <div class="title">Đặt hàng thành công!</div>
    <div class="sub">Cảm ơn bạn đã mua sắm tại <strong>Poly Shop</strong>.<br>Chúng tôi sẽ liên hệ xác nhận đơn hàng sớm nhất.</div>

    <div class="box">
        <h5><i class="fa fa-file-text-o"></i> Thông tin đơn hàng</h5>
        <div class="row-info">
            <span class="lbl">Mã đơn hàng</span>
            <span class="val" style="color:#e91e63;">#${order.id}</span>
        </div>
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
            <span class="lbl">Địa chỉ</span>
            <span class="val">${order.address}</span>
        </div>
        <div class="row-info">
            <span class="lbl">Trạng thái</span>
            <span class="val" style="color:#ff9800;"><i class="fa fa-clock-o"></i> ${order.status}</span>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/user/home" class="btn-pink">
        <i class="fa fa-home"></i> Trang chủ
    </a>
    <a href="${pageContext.request.contextPath}/user/product" class="btn-gray">
        <i class="fa fa-shopping-bag"></i> Mua tiếp
    </a>
</div>

<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>