<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shoppingcart.css">
</head>
<body>
    <div class="page-banner-section section bg-gray">
        <h2 style="text-align:center; padding:20px">Giỏ hàng của bạn</h2>
    </div>
    <table border="1" width="100%" style="text-align:center;">
        <tr>
            <th>STT</th>
            <th>Tên SP</th>
            <th>Giá</th>
            <th>Số lượng</th>
            <th>Hình</th>
            <th>Thành tiền</th>
            <th>Hành động</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Tên sản phẩm</td>
            <td>0</td>
            <td>0</td>
            <td></td>
            <td>0</td>
            <td><a href="#">Xóa</a></td>
        </tr>
    </table>
</body>
</html>