<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng #${order.id}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <style>
        .badge-pending  { background:#ff9800; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
        .badge-confirm  { background:#2196f3; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
        .badge-shipping { background:#9c27b0; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
        .badge-done     { background:#4caf50; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
        .badge-cancel   { background:#f44336; color:#fff; padding:4px 10px; border-radius:12px; font-size:12px; }
    </style>
</head>
<body>
<div class="container-fluid main-page">
    <div class="app-main">
        <nav class="sidebar">
            <ul>
                <li><a href="/admin/dashboard"><i class="fa-solid fa-house ico-side"></i>Dashboards</a></li>
                <li><a href="/admin/brands"><i class="fa-solid fa-folder-open ico-side"></i>Quản lí danh mục</a></li>
                <li><a href="/admin/products"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí sản phẩm</a></li>
                <li><a href="/admin/comments"><i class="fa-solid fa-mug-hot ico-side"></i>Quản lí bình luận</a></li>
                <li><a href="/admin/post"><i class="fa-solid fa-user ico-side"></i>Quản lý bài viết</a></li>
                <li><a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a></li>
                <li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li>
            </ul>
        </nav>

        <div class="main-content">
            <div class="container">
                <h3 class="title-page">Chi tiết đơn hàng #${order.id}</h3>

                <%-- ── Thông tin người nhận ── --%>
                <div class="card mb-4" style="padding:20px; background:#fff; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,.08);">
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Người nhận:</strong> ${order.receiverName}</p>
                            <p><strong>Email:</strong> ${order.receiverEmail}</p>
                            <p><strong>SĐT:</strong> ${order.receiverPhone}</p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Địa chỉ:</strong> ${order.address}</p>
                            <p>
                                <strong>Trạng thái đơn hàng:</strong>
                                <c:choose>
                                    <c:when test="${order.status == 'Chờ xác nhận'}"><span class="badge-pending">${order.status}</span></c:when>
                                    <c:when test="${order.status == 'Đã xác nhận'}"><span class="badge-confirm">${order.status}</span></c:when>
                                    <c:when test="${order.status == 'Đang giao'}"><span class="badge-shipping">${order.status}</span></c:when>
                                    <c:when test="${order.status == 'Thành công'}"><span class="badge-done">${order.status}</span></c:when>
                                    <c:when test="${order.status == 'Đã hủy'}"><span class="badge-cancel">${order.status}</span></c:when>
                                    <c:otherwise><span class="badge-pending">${order.status}</span></c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>

                    <%-- ── Cập nhật trạng thái ĐƠN HÀNG ── --%>
                    <form action="${pageContext.request.contextPath}/admin/orders/updateStatus"
                          method="post" style="display:flex; gap:10px; align-items:center; margin-top:10px;">
                        <input type="hidden" name="orderId" value="${order.id}"/>
                        <select name="status" class="form-control" style="width:200px;">
                            <option value="Chờ xác nhận" ${order.status == 'Chờ xác nhận' ? 'selected' : ''}>Chờ xác nhận</option>
                            <option value="Đã xác nhận"  ${order.status == 'Đã xác nhận'  ? 'selected' : ''}>Đã xác nhận</option>
                            <option value="Đang giao"    ${order.status == 'Đang giao'    ? 'selected' : ''}>Đang giao</option>
                            <option value="Thành công"   ${order.status == 'Thành công'   ? 'selected' : ''}>Thành công</option>
                            <option value="Đã hủy"       ${order.status == 'Đã hủy'       ? 'selected' : ''}>Đã hủy</option>
                        </select>
                        <button type="submit" class="btn btn-primary">Cập nhật trạng thái</button>
                    </form>
                </div>

                <%-- ── Danh sách sản phẩm (chỉ xem, không sửa trạng thái từng SP) ── --%>
                <table class="table table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>STT</th>
                            <th>Sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="tongTien" value="0"/>
                        <c:forEach var="item" items="${details}" varStatus="st">
                            <c:set var="lineTotal" value="${item.detail.unitPrice * item.detail.quantity}"/>
                            <c:set var="tongTien"  value="${tongTien + lineTotal}"/>
                            <tr>
                                <td>${st.index + 1}</td>
                                <td>
                                    <div style="display:flex; align-items:center; gap:10px;">
                                        <img src="${pageContext.request.contextPath}/assets/uploads/${item.product.image}"
                                             style="width:52px;height:52px;object-fit:cover;border-radius:4px;border:1px solid #eee;"
                                             onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'"
                                             alt="${item.product.name}">
                                        <span style="font-weight:600;">${item.product.name}</span>
                                    </div>
                                </td>
                                <td>${item.detail.quantity}</td>
                                <td><fmt:formatNumber value="${item.detail.unitPrice}" type="number"/> đ</td>
                                <td><fmt:formatNumber value="${lineTotal}" type="number"/> đ</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" class="text-end"><strong>Tổng cộng:</strong></td>
                            <td style="color:#e91e63; font-weight:700;">
                                <fmt:formatNumber value="${tongTien}" type="number"/> đ
                            </td>
                        </tr>
                    </tfoot>
                </table>

                <a href="${pageContext.request.contextPath}/admin/orders" class="btn btn-secondary">
                    <i class="fa-solid fa-arrow-left"></i> Quay lại
                </a>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>