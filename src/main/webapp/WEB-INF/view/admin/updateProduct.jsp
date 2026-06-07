<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
</head>
<body>
<div class="container-fluid main-page">
    <div class="app-main">
        <nav class="sidebar bg-primary">
            <ul>
                <li><a href="/admin/dashboard"><i class="fa-solid fa-house ico-side"></i>Dashboards</a></li>
                <li><a href="/admin/brands"><i class="fa-solid fa-folder-open ico-side"></i>Quản lí danh mục</a></li>
                <li><a href="/admin/products"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí sản phẩm</a></li>
                <li><a href="comment.html"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí bình luận</a></li>
                <li> <a href="/admin/post"><i class="fa-solid fa-user ico-side"></i>Quản lý bài viết</a></li>
                <li><a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a></li>
                <li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li>
            </ul>
        </nav>

        <div class="main-content">
            <div class="container" style="max-width: 700px;">
                <h3 class="title-page">Cập nhật sản phẩm</h3>

                <form action="${pageContext.request.contextPath}/admin/products/update"
                      method="post" enctype="multipart/form-data">

                    <%-- Giữ id và ảnh cũ --%>
                    <input type="hidden" name="id" value="${product.id}" />
                    <input type="hidden" name="image" value="${product.image}" />

                    <div class="mb-3">
                        <label class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" name="name"
                               value="${product.name}" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Giá</label>
                        <input type="number" class="form-control" name="price"
                               value="${product.price}" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Khuyến mãi (%)</label>
                        <input type="number" class="form-control" name="discount"
                               value="${product.discount}" min="0" max="100" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mô tả</label>
                        <textarea class="form-control" name="description"
                                  rows="3">${product.description}</textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Danh mục</label>
                        <select class="form-select" name="id_brand">
                            <c:forEach var="b" items="${brands}">
                                <option value="${b.id}"
                                    <c:if test="${b.id == product.id_brand}">selected</c:if>>
                                    ${b.brandName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Ảnh hiện tại</label><br/>
                        <c:if test="${not empty product.image}">
                            <img src="${pageContext.request.contextPath}/assets/uploads/${product.image}"
                                 width="100" height="100"
                                 style="object-fit:cover; border-radius:6px; margin-bottom:8px;"
                                 onerror="this.src='${pageContext.request.contextPath}/assets/images/no-image.png'"/>
                        </c:if>
                        <input type="file" class="form-control" name="imageFile" accept="image/*" />
                        <small class="text-muted">Để trống nếu không muốn thay ảnh</small>
                    </div>

                    <div class="d-flex gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa-solid fa-floppy-disk"></i> Lưu thay đổi
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/products"
                           class="btn btn-secondary">
                            <i class="fa-solid fa-xmark"></i> Hủy
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/vendor/main.js"></script>
</body>
</html>