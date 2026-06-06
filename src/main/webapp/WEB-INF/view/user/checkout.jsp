<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán – Poly Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <style>
        body { background: #f7f7f7; }
        .checkout-wrapper { max-width: 980px; margin: 40px auto; padding: 0 15px; }
        .card-box { background: #fff; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,.08); padding: 28px; margin-bottom: 24px; }
        .card-box h4 { font-weight: 700; margin-bottom: 20px; border-bottom: 2px solid #e91e63; padding-bottom: 8px; color: #333; }
        .form-label { font-weight: 600; color: #555; }
        .total-row td { font-weight: 700; font-size: 16px; color: #e91e63; }
        .btn-checkout { background: #e91e63; color: #fff; border: none; padding: 12px 36px; font-size: 16px; border-radius: 6px; cursor: pointer; }
        .btn-checkout:hover { background: #c2185b; }
        .btn-back { background: #555; color: #fff; padding: 12px 24px; font-size: 15px; border-radius: 6px; text-decoration: none; display: inline-block; }
        .btn-back:hover { background: #333; color: #fff; }
    </style>
</head>
<body>

<div class="page-banner-section section bg-gray" style="padding:20px 0; text-align:center;">
    <h2 style="margin:0;">Thanh toán</h2>
    <ul style="list-style:none;padding:0;margin:6px 0 0;display:flex;justify-content:center;gap:6px;font-size:14px;color:#888;">
        <li><a href="${pageContext.request.contextPath}/user/home">Trang chủ</a></li>
        <li>/</li>
        <li><a href="${pageContext.request.contextPath}/user/shoppingcart">Giỏ hàng</a></li>
        <li>/</li>
        <li style="color:#e91e63;">Thanh toán</li>
    </ul>
</div>

<div class="checkout-wrapper">
    <div class="row">

        <!-- Form thông tin người nhận -->
        <div class="col-lg-6 col-md-12">
            <div class="card-box">
                <h4><i class="fa fa-user-o" style="color:#e91e63;"></i> Thông tin người nhận</h4>
                <form action="${pageContext.request.contextPath}/user/checkout" method="post">

                    <div class="mb-3">
                        <label class="form-label">Họ và tên <span style="color:red">*</span></label>
                        <input type="text" name="receiverName" class="form-control"
                               value="${loggedUser.username}" placeholder="Nhập họ và tên" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email <span style="color:red">*</span></label>
                        <input type="email" name="receiverEmail" class="form-control"
                               value="${loggedUser.email}" placeholder="Nhập email" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Số điện thoại <span style="color:red">*</span></label>
                        <input type="tel" name="receiverPhone" class="form-control"
                               value="" placeholder="VD: 0901234567" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Địa chỉ giao hàng <span style="color:red">*</span></label>
                        <textarea name="address" class="form-control" rows="3"
                                  placeholder="Số nhà, đường, phường, quận, tỉnh/thành" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phương thức thanh toán</label><br>
                        <label style="cursor:pointer; margin-right:20px;">
                            <input type="radio" name="paymentMethod" value="COD" checked>
                            &nbsp;<i class="fa fa-money" style="color:#4caf50;"></i> Thanh toán khi nhận hàng (COD)
                        </label><br><br>
                        <label style="cursor:pointer;">
                            <input type="radio" name="paymentMethod" value="BANK">
                            &nbsp;<i class="fa fa-credit-card" style="color:#2196f3;"></i> Chuyển khoản ngân hàng
                        </label>
                    </div>

                    <div style="display:flex; gap:12px; margin-top:24px;">
                        <a href="${pageContext.request.contextPath}/user/shoppingcart" class="btn-back">
                            <i class="fa fa-angle-left"></i> Quay lại
                        </a>
                        <button type="submit" class="btn-checkout">
                            <i class="fa fa-check-circle"></i> Đặt hàng
                        </button>
                    </div>

                </form>
            </div>
        </div>

        <!-- Tóm tắt đơn hàng -->
        <div class="col-lg-6 col-md-12">
            <div class="card-box">
                <h4><i class="fa fa-shopping-bag" style="color:#e91e63;"></i> Đơn hàng của bạn</h4>
                <table class="table" style="font-size:14px;">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th class="text-center">SL</th>
                            <th class="text-end">Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${cartItems}" var="item">
                            <tr>
                                <td>
                                    <div style="display:flex; align-items:center; gap:10px;">
                                        <img src="${pageContext.request.contextPath}/assets/uploads/${item.product.image}"
                                             alt="${item.product.name}"
                                             style="width:50px;height:50px;object-fit:cover;border-radius:4px;"
                                             onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'">
                                        <span>${item.product.name}</span>
                                    </div>
                                </td>
                                <td class="text-center">${item.cart.quantity}</td>
                                <td class="text-end">
                                    <fmt:formatNumber value="${item.subtotal}" type="number"/> đ
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="2">Phí vận chuyển</td>
                            <td class="text-end" style="color:#4caf50; font-weight:600;">Miễn phí</td>
                        </tr>
                        <tr class="total-row">
                            <td colspan="2">Tổng cộng</td>
                            <td class="text-end">
                                <fmt:formatNumber value="${total}" type="number"/> đ
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>