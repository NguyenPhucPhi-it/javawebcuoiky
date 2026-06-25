<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý bình luận – Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <style>
        .star-display { color: #ff9800; font-size: 15px; letter-spacing: 1px; }
        .badge-approved { background:#e8f5e9; color:#2e7d32; padding:4px 12px;
                          border-radius:12px; font-size:12px; font-weight:700; }
        .badge-pending  { background:#fff3e0; color:#e65100; padding:4px 12px;
                          border-radius:12px; font-size:12px; font-weight:700; }
        .badge-hidden   { background:#ffebee; color:#c62828; padding:4px 12px;
                          border-radius:12px; font-size:12px; font-weight:700; }
        .prod-cell { display:flex; align-items:center; gap:10px; }
        .prod-cell img { width:46px; height:46px; object-fit:cover;
                         border-radius:5px; border:1px solid #eee; flex-shrink:0; }
        .message-cell { max-width:220px; overflow:hidden;
                        text-overflow:ellipsis; white-space:nowrap; }
        .filter-bar { display:flex; gap:10px; align-items:center;
                      margin-bottom:18px; flex-wrap:wrap; }
        .filter-bar select, .filter-bar input {
            border:1px solid #ddd; border-radius:5px;
            padding:6px 12px; font-size:13px; }
        .btn-show { background:#4caf50; color:#fff; border:none;
                    padding:5px 12px; border-radius:5px; font-size:12px;
                    font-weight:600; cursor:pointer; white-space:nowrap; }
        .btn-show:hover { background:#388e3c; }
        .btn-hide { background:#f44336; color:#fff; border:none;
                    padding:5px 12px; border-radius:5px; font-size:12px;
                    font-weight:600; cursor:pointer; white-space:nowrap; }
        .btn-hide:hover { background:#d32f2f; }
        .stats-row { display:flex; gap:12px; margin-bottom:20px; flex-wrap:wrap; }
        .stat-card { background:#fff; border-radius:8px; padding:14px 20px;
                     box-shadow:0 1px 4px rgba(0,0,0,.08);
                     text-align:center; min-width:110px; }
        .stat-card .num { font-size:24px; font-weight:700; }
        .stat-card .lbl { font-size:12px; color:#888; margin-top:2px; }
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
                <li><a href="/admin/comments" style="color:#e91e63; font-weight:700;">
                    <i class="fa-solid fa-comments ico-side"></i>Quản lí bình luận</a></li>
                <li><a href="/admin/post"><i class="fa-solid fa-user ico-side"></i>Quản lý bài viết</a></li>
                <li><a href="/admin/orders"><i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng</a></li>
                  <li><a href="/admin/chat"><i class="fa-solid fa-message ico-side"></i>Chat khách hàng</a></li>
                <li><a href="/auth/logout"><i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li>
            </ul>
        </nav>

        <div class="main-content">
            <div class="container">
                <h3 class="title-page">
                    <i class="fa-solid fa-comments" style="color:#e91e63;"></i>
                    Quản lý bình luận
                </h3>

                <!-- Thống kê -->
                <div class="stats-row">
                    <div class="stat-card">
                        <div class="num" style="color:#555;">${totalCount}</div>
                        <div class="lbl">Tổng</div>
                    </div>
                    <div class="stat-card">
                        <div class="num" style="color:#e65100;">${pendingCount}</div>
                        <div class="lbl">Chờ duyệt</div>
                    </div>
                    <div class="stat-card">
                        <div class="num" style="color:#2e7d32;">${approvedCount}</div>
                        <div class="lbl">Đang hiển thị</div>
                    </div>
                    <div class="stat-card">
                        <div class="num" style="color:#c62828;">${hiddenCount}</div>
                        <div class="lbl">Đã ẩn</div>
                    </div>
                </div>

                <!-- Bộ lọc -->
                <div class="filter-bar">
                    <label style="font-weight:600; font-size:14px;">Lọc:</label>
                    <select id="filterStatus" onchange="filterTable()">
                        <option value="all">Tất cả</option>
                        <option value="0">Chờ duyệt</option>
                        <option value="1">Đang hiển thị</option>
                        <option value="2">Đã ẩn</option>
                    </select>
                    <input type="text" id="filterSearch"
                           placeholder="Tìm theo tên SP hoặc nội dung..."
                           oninput="filterTable()" style="width:260px;">
                </div>

                <!-- Bảng -->
                <div style="background:#fff; border-radius:8px;
                            box-shadow:0 1px 6px rgba(0,0,0,.08); overflow:hidden;">
                    <table class="table table-hover mb-0" id="commentTable" style="font-size:14px;">
                        <thead style="background:#fafafa;">
                            <tr>
                                <th style="width:40px;">#</th>
                                <th>Sản phẩm</th>
                                <th style="width:200px;">Nội dung</th>
                                <th style="width:110px; text-align:center;">Đánh giá</th>
                                <th style="width:90px;">Người dùng</th>
                                <th style="width:140px;">Thời gian</th>
                                <th style="width:110px; text-align:center;">Trạng thái</th>
                                <th style="width:120px; text-align:center;">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${comments}" var="c" varStatus="st">
                                <tr data-status="${c.status}"
                                    data-search="${c.productName} ${c.message}">

                                    <td style="color:#aaa;">${st.index + 1}</td>

                                    <!-- Sản phẩm -->
                                    <td>
                                        <div class="prod-cell">
                                            <img src="${pageContext.request.contextPath}/assets/uploads/${c.productImage}"
                                                 onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'"
                                                 alt="${c.productName}">
                                            <span style="font-weight:600;">${c.productName}</span>
                                        </div>
                                    </td>

                                    <!-- Nội dung -->
                                    <td>
                                        <div class="message-cell" title="${c.message}">
                                            ${c.message}
                                        </div>
                                    </td>

                                    <!-- Đánh giá sao -->
                                    <td style="text-align:center;">
                                        <div class="star-display">
                                            <c:forEach begin="1" end="5" var="i">
                                                <c:choose>
                                                    <c:when test="${i <= c.rating}">★</c:when>
                                                    <c:otherwise><span style="color:#ddd;">★</span></c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                        <div style="font-size:12px; color:#888;">${c.rating}/5</div>
                                    </td>

                                    <!-- Người dùng -->
                                    <td style="color:#666;">
                                        <i class="fa fa-user-circle-o"></i> #${c.id_user}
                                    </td>

                                    <!-- Thời gian -->
                                    <td style="font-size:12px; color:#999;">
                                        ${c.created_at}
                                    </td>

                                    <!-- Trạng thái -->
                                    <td style="text-align:center;">
                                        <c:choose>
                                            <c:when test="${c.status == 1}">
                                                <span class="badge-approved">
                                                    <i class="fa fa-eye"></i> Hiển thị
                                                </span>
                                            </c:when>
                                            <c:when test="${c.status == 2}">
                                                <span class="badge-hidden">
                                                    <i class="fa fa-eye-slash"></i> Đã ẩn
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge-pending">
                                                    <i class="fa fa-clock-o"></i> Chờ duyệt
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <!-- Hành động -->
                                    <td style="text-align:center;">
                                        <div style="display:flex; gap:6px; justify-content:center; flex-wrap:wrap;">

                                        
                                            <c:if test="${c.status != 1}">
                                                <form action="${pageContext.request.contextPath}/admin/comments/updateStatus"
                                                      method="post">
                                                    <input type="hidden" name="commentId" value="${c.id}">
                                                    <input type="hidden" name="status" value="1">
                                                    <button type="submit" class="btn-show">
                                                        <i class="fa fa-eye"></i> Hiện
                                                    </button>
                                                </form>
                                            </c:if>

                                           
                                            <c:if test="${c.status != 2}">
                                                <form action="${pageContext.request.contextPath}/admin/comments/updateStatus"
                                                      method="post">
                                                    <input type="hidden" name="commentId" value="${c.id}">
                                                    <input type="hidden" name="status" value="2">
                                                    <button type="submit" class="btn-hide">
                                                        <i class="fa fa-eye-slash"></i> Ẩn
                                                    </button>
                                                </form>
                                            </c:if>

                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <c:if test="${empty comments}">
                        <div style="text-align:center; padding:50px; color:#bbb;">
                            <i class="fa fa-comments-o" style="font-size:40px;"></i>
                            <p style="margin-top:10px;">Chưa có bình luận nào.</p>
                        </div>
                    </c:if>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
function filterTable() {
    const status = document.getElementById('filterStatus').value;
    const search = document.getElementById('filterSearch').value.toLowerCase();
    document.querySelectorAll('#commentTable tbody tr').forEach(function(row) {
        const rowStatus = row.getAttribute('data-status');
        const rowSearch = row.getAttribute('data-search').toLowerCase();
        const matchStatus = (status === 'all' || rowStatus === status);
        const matchSearch = (search === '' || rowSearch.includes(search));
        row.style.display = (matchStatus && matchSearch) ? '' : 'none';
    });
}
</script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>