<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/products.css">
</head>

<body>
    <div class="container-fluid main-page">
        <div class="app-main">
            <nav class="sidebar bg-primary">
                <ul>
                    <li>
                        <a href="/admin/dashboard"><i class="fa-solid fa-house ico-side"></i>Dashboards</a>
                    </li>
                    
                    <li>
                        <a href="/admin/brands"><i class="fa-solid fa-folder-open ico-side"></i>Quản lí danh muc</a>
                    </li>
                    <li>
                        <a href="/admin/products"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí sản phẩm</a>
                    </li>
                    <li>
                        <a href="comment.html"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí bình luận</a>
                    </li>
                    <li>
                        <a href="user.html"><i class="fa-solid fa-user ico-side"></i>Quản lí thành viên</a>
                    </li>
                    <li>
                        <a href="order.html"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản kí đơn hàng</a>
                    </li>

                </ul>
            </nav>
            <div class="main-content">
                <div class="container">
                    <h3 class="title-page">
                        Sản phẩm
                    </h3>
                    <div class="d-flex justify-content-end">
                        <a href="${pageContext.request.contextPath}/admin/products/add" 
                            class="btn btn-primary mb-2">Thêm sản phẩm</a>
                    </div>
                    <table id="example" class="table table-striped" style="width:100%">
                        <thead>
                            <tr>
                                <th>Hình </th>
                                <th>Tên sản phẩm</th>
                                <th>Giá</th>
                                <th>Khuyến mãi</th>
                                <th>Danh mục</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                       <tbody>
                        <c:forEach var="p" items="${products}">
                            <tr>
                                <td>
                                    <img src="${pageContext.request.contextPath}/assets/uploads/${p.image}"
                                        width="60" height="60" style="object-fit:cover; border-radius:6px;"
                                        onerror="this.src='${pageContext.request.contextPath}/assets/images/no-image.png'"/>
                                </td>
                                <td>${p.name}</td>
                                <td>${p.price}</td>
                                <td>${p.discount}%</td>
                                <td>${brandMap[p.id_brand]}</td>
                                <td>
                                    <a href="#" class="btn btn-warning btn-sm">
                                        <i class="fa-solid fa-pen-to-square"></i> Sửa
                                    </a>
                                    <a href="#" class="btn btn-danger btn-sm">
                                        <i class="fa-solid fa-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                        
                    </table>
                </div>
            </div>
        </div>
    </div>
 <script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
    <script>
        new DataTable('#example');
    </script>
</body>

</html>