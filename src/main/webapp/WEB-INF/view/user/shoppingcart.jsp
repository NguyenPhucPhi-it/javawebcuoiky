<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng – Poly Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body { background:#f5f5f5; font-family:Arial,sans-serif; }
        .wrapper { max-width:960px; margin:36px auto; padding:0 15px; }
        .page-title { font-size:22px; font-weight:700; color:#333;
                      margin-bottom:20px; border-left:4px solid #333333; padding-left:12px; }
        .cart-card { background:#fff; border-radius:8px;
                     box-shadow:0 1px 6px rgba(0,0,0,.08); overflow:hidden; margin-bottom:16px; }
        .cart-header { display:grid;
                       grid-template-columns:40px 80px 1fr 130px 130px 130px 110px;
                       align-items:center; gap:10px;
                       padding:12px 20px; background:#fafafa;
                       border-bottom:2px solid #f0f0f0;
                       font-weight:700; font-size:13px; color:#777; }
        .cart-row { display:grid;
                    grid-template-columns:40px 80px 1fr 130px 130px 130px 110px;
                    align-items:center; gap:10px;
                    padding:14px 20px; border-bottom:1px solid #f9f9f9; }
        .cart-row:last-child { border-bottom:none; }
        .prod-img { width:72px; height:72px; object-fit:cover;
                    border-radius:6px; border:1px solid #eee; }
        .prod-name { font-weight:600; font-size:14px; color:#333; margin-bottom:4px; }
        .prod-brand { font-size:12px; color:#aaa; }
        .qty-form { display:flex; align-items:center; gap:4px; }
        .qty-btn { width:28px; height:28px; border:1px solid #ddd; background:#fff;
                   cursor:pointer; border-radius:4px; font-size:15px; line-height:1;
                   display:flex; align-items:center; justify-content:center; }
        .qty-btn:hover { background:#f0f0f0; }
        .qty-btn:disabled { opacity:.4; cursor:not-allowed; }
        .qty-num { min-width:30px; text-align:center; font-weight:600; font-size:14px; }
        .price-col { font-size:14px; color:#555; }
        .subtotal-col { font-weight:700; color:#333333; font-size:15px; }
        .btn-buy { background:#333333; color:#fff; border:none;
                   padding:6px 14px; border-radius:5px; font-size:13px;
                   font-weight:600; cursor:pointer; width:100%; margin-bottom:5px; }
        .btn-buy:hover { background:#333333; }
        .btn-del { background:#fff; color:#f44336; border:1px solid #f44336;
                   padding:6px 14px; border-radius:5px; font-size:13px;
                   font-weight:600; cursor:pointer; width:100%; }
        .btn-del:hover { background:#f44336; color:#fff; }
        .cart-footer { background:#fff; border-radius:8px;
                       box-shadow:0 1px 6px rgba(0,0,0,.08);
                       padding:20px 24px;
                       display:flex; justify-content:space-between; align-items:center; }
        .total-text { font-size:18px; font-weight:700; color:#333; }
        .total-amount { font-size:24px; font-weight:700; color:#333333; margin-left:12px; }
        .btn-checkout { background:#333333; color:#fff; border:none;
                        padding:12px 32px; border-radius:6px; font-size:15px;
                        font-weight:700; cursor:pointer; }
        .btn-checkout:hover { background:#333333; }
        .btn-continue { background:#555; color:#fff; text-decoration:none;
                        padding:12px 24px; border-radius:6px; font-size:15px;
                        font-weight:600; display:inline-block; }
        .btn-continue:hover { background:#333; color:#fff; }
        .empty { text-align:center; padding:80px 0; color:#bbb; }
        input[type="checkbox"] { width:16px; height:16px; cursor:pointer; accent-color:#333333; }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="page-title">
        <i class="fa fa-shopping-cart" style="color:#e91e63;"></i> Giỏ hàng của bạn
    </div>

    <c:choose>
        <c:when test="${empty cartItems}">
            <div class="empty">
                <i class="fa fa-shopping-cart" style="font-size:60px;"></i>
                <p style="margin-top:16px; font-size:16px;">Giỏ hàng của bạn đang trống.</p>
                <a href="${pageContext.request.contextPath}/user/product"
                   style="background:#e91e63;color:#fff;padding:10px 28px;
                          border-radius:6px;text-decoration:none;display:inline-block;margin-top:10px;">
                    <i class="fa fa-arrow-left"></i> Tiếp tục mua sắm
                </a>
            </div>
        </c:when>
        <c:otherwise>

            <div id="selectedWrapper">

                <div class="cart-card">
                    <div class="cart-header">
                        <div><input type="checkbox" id="checkAll" title="Chọn tất cả"/></div>
                        <div>Ảnh</div>
                        <div>Sản phẩm</div>
                        <div style="text-align:center;">Đơn giá</div>
                        <div style="text-align:center;">Số lượng</div>
                        <div style="text-align:center;">Thành tiền</div>
                        <div style="text-align:center;">Hành động</div>
                    </div>

                    <c:forEach items="${cartItems}" var="item" varStatus="st">
                        <div class="cart-row">
                            <div>
                                <input type="checkbox" name="selectedIds"
                                       value="${item.cart.id}" class="item-checkbox"/>
                            </div>
                            <div>
                                <img src="${pageContext.request.contextPath}/assets/uploads/${item.product.image}"
                                     class="prod-img"
                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'"
                                     alt="${item.product.name}"/>
                            </div>
                            <div>
                                <div class="prod-name">${item.product.name}</div>
                            </div>
                            <div class="price-col" style="text-align:center;">
                                <fmt:formatNumber value="${item.cart.price}" type="number"/> đ
                            </div>
                            <div style="text-align:center;">
                                <form action="${pageContext.request.contextPath}/user/cart/update"
                                      method="post" class="qty-form" style="justify-content:center;">
                                    <input type="hidden" name="cartId" value="${item.cart.id}"/>
                                    <button type="submit" name="quantity"
                                            value="${item.cart.quantity - 1}"
                                            class="qty-btn"
                                            ${item.cart.quantity <= 1 ? 'disabled' : ''}>−</button>
                                    <span class="qty-num">${item.cart.quantity}</span>
                                    <button type="submit" name="quantity"
                                            value="${item.cart.quantity + 1}"
                                            class="qty-btn">+</button>
                                </form>
                            </div>
                            <div class="subtotal-col" style="text-align:center;">
                                <fmt:formatNumber value="${item.subtotal}" type="number"/> đ
                            </div>
                            <div>
                                <form action="${pageContext.request.contextPath}/user/cart/buy-single"
                                      method="post">
                                    <input type="hidden" name="cartId" value="${item.cart.id}"/>
                                    <button type="submit" class="btn-buy">
                                        <i class="fa fa-bolt"></i> Mua
                                    </button>
                                </form>
                                <form action="${pageContext.request.contextPath}/user/cart/remove"
                                      method="post">
                                    <input type="hidden" name="cartId" value="${item.cart.id}"/>
                                    <button type="submit" class="btn-del"
                                            onclick="return confirm('Xóa sản phẩm này khỏi giỏ?')">
                                        <i class="fa fa-trash"></i> Xóa
                                    </button>
                                </form>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="cart-footer">
                    <div>
                        <a href="${pageContext.request.contextPath}/user/product"
                           class="btn-continue">
                            <i class="fa fa-arrow-left"></i> Tiếp tục mua sắm
                        </a>
                    </div>
                    <div style="display:flex; align-items:center; gap:20px;">
                        <div>
                            <span class="total-text">Tổng cộng:</span>
                            <span class="total-amount">
                                <fmt:formatNumber value="${total}" type="number"/> đ
                            </span>
                        </div>
                        <button type="button" class="btn-checkout" onclick="submitCheckout()">
                            <i class="fa fa-credit-card"></i> Thanh toán
                        </button>
                    </div>
                </div>

            </div>

            <form id="checkoutForm" action="${pageContext.request.contextPath}/user/cart/buy-selected" method="post" style="display:none;"></form>

            <script>
                document.getElementById('checkAll').addEventListener('change', function() {
                    document.querySelectorAll('.item-checkbox').forEach(cb => cb.checked = this.checked);
                });
                document.querySelectorAll('.item-checkbox').forEach(cb => {
                    cb.addEventListener('change', function() {
                        const all = document.querySelectorAll('.item-checkbox');
                        const checked = document.querySelectorAll('.item-checkbox:checked');
                        document.getElementById('checkAll').checked = all.length === checked.length;
                    });
                });

                function submitCheckout() {
                    const form = document.getElementById('checkoutForm');
                    form.innerHTML = '';

                    const checked = document.querySelectorAll('.item-checkbox:checked');
                    checked.forEach(function(cb) {
                        const input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = 'selectedIds';
                        input.value = cb.value;
                        form.appendChild(input);
                    });

                    form.submit();
                }
            </script>

        </c:otherwise>
    </c:choose>
</div>
</body>
</html>