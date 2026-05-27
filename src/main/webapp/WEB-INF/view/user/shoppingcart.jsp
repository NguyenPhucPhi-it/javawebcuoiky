<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shoppingcart.css">
</head>
<body>
    <div class="page-banner-section section bg-gray">
        <h2 style="text-align:center; padding:20px">Giỏ hàng của bạn</h2>
    </div>

    <c:choose>
        <c:when test="${empty cartItems}">
            <p style="text-align:center; padding:30px; font-size:18px">
                Giỏ hàng trống.
                <a href="${pageContext.request.contextPath}/user/product">Tiếp tục mua sắm</a>
            </p>
        </c:when>
        <c:otherwise>
            <div style="padding: 20px;">
                <table border="1" width="100%" style="text-align:center; border-collapse:collapse;">
                 
                        <tr>
                            <th >STT</th>
                            <th>Tên sản phẩm</th>
                            <th>Hình ảnh</th>
                            <th>Đơn giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Hành động</th>
                        </tr>
                   
                
                        <c:forEach items="${cartItems}" var="item" varStatus="st">
                            <tr>
                                <td style="padding:10px;">${st.index + 1}</td>
                                <td style="padding:10px;">${item.product.name}</td>
                                <td style="padding:10px;">
                                    <img src="${pageContext.request.contextPath}/assets/uploads/${item.product.image}"
                                         alt="${item.product.name}"
                                         style="width:80px; height:80px; object-fit:cover;"
                                         onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'">
                                </td>
                                <td style="padding:10px;">
                                    <fmt:formatNumber value="${item.cart.price}" type="number"/> đ
                                </td>
                                <td style="padding:10px;">${item.cart.quantity}</td>
                                <td style="padding:10px; color:red;">
                                    <fmt:formatNumber value="${item.subtotal}" type="number"/> đ
                                </td>
                                <td style="padding:10px;">
                                    <form action="${pageContext.request.contextPath}/user/cart/remove" method="post">
                                        <input type="hidden" name="cartId" value="${item.cart.id}"/>
                                        <button type="submit"
                                                onclick="return confirm('Xóa sản phẩm này?')"
                                                style="background:red; color:white; border:none; padding:5px 10px; cursor:pointer;">
                                            Xóa
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                
                    <tfoot>
                        <tr style="font-weight:bold; background:#fff3cd;">
                            <td colspan="5" style="text-align:right; padding:10px;">Tổng cộng:</td>
                            <td colspan="2" style="color:red; font-size:16px; padding:10px;">
                                <fmt:formatNumber value="${total}" type="number"/> đ
                            </td>
                        </tr>
                    </tfoot>
                </table>

                <div style="text-align:right; margin-top:20px;">
                    <a href="${pageContext.request.contextPath}/user/product"
                       style="padding:10px 20px; background:#555; color:white; text-decoration:none; margin-right:10px;">
                        Tiếp tục mua sắm
                    </a>
                    <a href="${pageContext.request.contextPath}/user/checkout"
                       style="padding:10px 20px; background:#e91e63; color:white; text-decoration:none;">
                        Thanh toán
                    </a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</body>
</html>