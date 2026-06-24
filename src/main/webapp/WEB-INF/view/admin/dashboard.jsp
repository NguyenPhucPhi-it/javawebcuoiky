<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard – Admin</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <style>
        .stat-grid { display:grid; grid-template-columns:repeat(4,1fr);
                     gap:16px; margin-bottom:24px; }
        @media(max-width:900px){ .stat-grid{ grid-template-columns:repeat(2,1fr); } }
        @media(max-width:500px){ .stat-grid{ grid-template-columns:1fr; } }

        .stat-card { border-radius:10px; padding:20px 22px;
                     display:flex; align-items:center; gap:16px;
                     box-shadow:0 2px 8px rgba(0,0,0,.08); color:#fff; }
        .stat-card .icon { font-size:32px; opacity:.85; }
        .stat-card .info .num  { font-size:28px; font-weight:700; line-height:1; }
        .stat-card .info .lbl  { font-size:13px; opacity:.9; margin-top:4px; }

        .card-pink   { background: linear-gradient(135deg,#e91e63,#c2185b); }
        .card-blue   { background: linear-gradient(135deg,#2196f3,#1565c0); }
        .card-green  { background: linear-gradient(135deg,#4caf50,#2e7d32); }
        .card-orange { background: linear-gradient(135deg,#ff9800,#e65100); }

        .order-status-grid { display:grid; grid-template-columns:repeat(4,1fr);
                             gap:12px; margin-bottom:24px; }
        @media(max-width:800px){ .order-status-grid{ grid-template-columns:repeat(2,1fr); } }

        .os-card { background:#fff; border-radius:8px; padding:16px;
                   box-shadow:0 1px 5px rgba(0,0,0,.07);
                   display:flex; align-items:center; gap:12px; }
        .os-dot  { width:10px; height:10px; border-radius:50%; flex-shrink:0; }
        .os-card .num  { font-size:22px; font-weight:700; color:#333; }
        .os-card .lbl  { font-size:12px; color:#888; }

        .revenue-grid { display:grid; grid-template-columns:repeat(4,1fr);
                        gap:16px; margin-bottom:24px; }
        @media(max-width:900px){ .revenue-grid{ grid-template-columns:repeat(2,1fr); } }
        @media(max-width:500px){ .revenue-grid{ grid-template-columns:1fr; } }

        .revenue-card { background:#fff; border-radius:10px; padding:18px 20px;
                        box-shadow:0 1px 6px rgba(0,0,0,.08);
                        border-left:4px solid #ddd; position:relative; overflow:hidden; }
        .revenue-card .rev-lbl { font-size:12px; color:#999; font-weight:600;
                                  text-transform:uppercase; letter-spacing:.5px; }
        .revenue-card .rev-num { font-size:18px; font-weight:700; margin-top:8px; word-break:break-all; }
        .revenue-card .rev-icon { font-size:40px; position:absolute;
                                   right:14px; top:50%; transform:translateY(-50%);
                                   opacity:.08; }

        .rev-today  { border-left-color:#2196f3; }
        .rev-today .rev-num   { color:#2196f3; }
        .rev-week   { border-left-color:#4caf50; }
        .rev-week .rev-num    { color:#4caf50; }
        .rev-month  { border-left-color:#ff9800; }
        .rev-month .rev-num   { color:#ff9800; }
        .rev-year   { border-left-color:#e91e63; }
        .rev-year .rev-num    { color:#e91e63; }

        .section-card { background:#fff; border-radius:10px;
                        box-shadow:0 1px 6px rgba(0,0,0,.08);
                        margin-bottom:20px; overflow:hidden; }
        .section-card .sc-head { padding:14px 20px; font-weight:700;
                                  font-size:15px; border-bottom:1px solid #f0f0f0;
                                  display:flex; justify-content:space-between;
                                  align-items:center; }
        .section-card .sc-body { padding:0; }

        .badge-cho  { background:#fff3e0; color:#e65100; padding:3px 10px;
                      border-radius:12px; font-size:12px; font-weight:600; }
        .badge-ship { background:#f3e5f5; color:#6a1b9a; padding:3px 10px;
                      border-radius:12px; font-size:12px; font-weight:600; }
        .badge-ok   { background:#e8f5e9; color:#2e7d32; padding:3px 10px;
                      border-radius:12px; font-size:12px; font-weight:600; }
        .badge-huy  { background:#ffebee; color:#c62828; padding:3px 10px;
                      border-radius:12px; font-size:12px; font-weight:600; }
        .badge-nhan { background:#e3f2fd; color:#1565c0; padding:3px 10px;
                      border-radius:12px; font-size:12px; font-weight:600; }

        .alert-badge { background:#e91e63; color:#fff; border-radius:50%;
                       width:20px; height:20px; font-size:11px; font-weight:700;
                       display:inline-flex; align-items:center; justify-content:center; }
    </style>
</head>
<body>
<div class="container-fluid main-page">
    <div class="app-main">
        <nav class="sidebar">
            <ul>
                <li>
                    <a href="/admin/dashboard" style="color:#e91e63; font-weight:700;">
                        <i class="fa-solid fa-house ico-side"></i>Dashboards
                    </a>
                </li>
                <li><a href="/admin/brands">
                    <i class="fa-solid fa-folder-open ico-side"></i>Quản lí danh mục</a></li>
                <li><a href="/admin/products">
                    <i class="fa-solid fa-mug-hot ico-side"></i>Quản lí sản phẩm</a></li>
                <li><a href="/admin/comments">
                    <i class="fa-solid fa-comments ico-side"></i>Quản lí bình luận
                    <!-- <c:if test="${pendingComments > 0}">
                        <span class="alert-badge">${pendingComments}</span>
                    </c:if> -->
                </a></li>
                <li><a href="/admin/post">
                    <i class="fa-solid fa-newspaper ico-side"></i>Quản lý bài viết</a></li>
                <li><a href="/admin/orders">
                    <i class="fa-solid fa-cart-shopping ico-side"></i>Quản lý đơn hàng
                    <!-- <c:if test="${choXacNhan > 0}">
                        <span class="alert-badge">${choXacNhan}</span>
                    </c:if> -->
                </a></li>
                 <li><a href="/admin/chat">
                    <i class="fa-solid fa-mug-hot ico-side"></i>Quản lí chat</a></li>
                <li><a href="/auth/logout">
                    <i class="fa-solid fa-right-from-bracket ico-side"></i>Đăng xuất</a></li>
            </ul>
        </nav>

        <div class="main-content">
            <div class="container-fluid" style="padding:24px;">

                <h3 style="font-weight:700; color:#333; margin-bottom:24px;">
                    <i class="fa-solid fa-chart-line" style="color:#e91e63;"></i>
                    Tổng quan hệ thống
                </h3>

                <!-- Thống kê tổng -->
                <div class="stat-grid">
                    <div class="stat-card card-pink">
                        <div class="icon"><i class="fa-solid fa-box"></i></div>
                        <div class="info">
                            <div class="num">${totalProducts}</div>
                            <div class="lbl">Sản phẩm</div>
                        </div>
                    </div>
                    <div class="stat-card card-blue">
                        <div class="icon"><i class="fa-solid fa-cart-shopping"></i></div>
                        <div class="info">
                            <div class="num">${totalOrders}</div>
                            <div class="lbl">Đơn hàng</div>
                        </div>
                    </div>
                    <div class="stat-card card-green">
                        <div class="icon"><i class="fa-solid fa-folder-open"></i></div>
                        <div class="info">
                            <div class="num">${totalBrands}</div>
                            <div class="lbl">Danh mục</div>
                        </div>
                    </div>
                    <div class="stat-card card-orange">
                        <div class="icon"><i class="fa-solid fa-comments"></i></div>
                        <div class="info">
                            <div class="num">${totalComments}</div>
                            <div class="lbl">Bình luận</div>
                        </div>
                    </div>
                </div>

                <!-- Doanh thu -->
                <div class="section-card" style="margin-bottom:20px;">
                    <div class="sc-head">
                        <span>
                            <i class="fa fa-money" style="color:#e91e63;"></i>
                            Doanh thu
                        </span>
                    </div>
                    <div class="sc-body" style="padding:16px;">
                        <div class="revenue-grid">

                            <div class="revenue-card rev-today">
                                <div class="rev-lbl">
                                    <i class="fa fa-calendar-o"></i> Hôm nay
                                </div>
                                <i class="fa fa-money rev-icon"></i>
                                <div class="rev-num">
                                    <fmt:formatNumber value="${revenueToday}" type="number"/> đ
                                </div>
                            </div>

                            <div class="revenue-card rev-week">
                                <div class="rev-lbl">
                                    <i class="fa fa-calendar-o"></i> Tuần này (7 ngày)
                                </div>
                                <i class="fa fa-money rev-icon"></i>
                                <div class="rev-num">
                                    <fmt:formatNumber value="${revenueThisWeek}" type="number"/> đ
                                </div>
                            </div>

                            <div class="revenue-card rev-month">
                                <div class="rev-lbl">
                                    <i class="fa fa-calendar-o"></i> Tháng này
                                </div>
                                <i class="fa fa-money rev-icon"></i>
                                <div class="rev-num">
                                    <fmt:formatNumber value="${revenueThisMonth}" type="number"/> đ
                                </div>
                            </div>

                            <div class="revenue-card rev-year">
                                <div class="rev-lbl">
                                    <i class="fa fa-calendar-o"></i> Năm ${currentYear}
                                </div>
                                <i class="fa fa-money rev-icon"></i>
                                <div class="rev-num">
                                    <fmt:formatNumber value="${revenueThisYear}" type="number"/> đ
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

<div style="display:grid; grid-template-columns:repeat(5,1fr); gap:12px; margin-bottom:24px;">
    <div class="os-card">
        <div class="os-dot" style="background:#ff9800;"></div>
        <div>
            <div class="num">${choXacNhan}</div>
            <div class="lbl">Chờ xác nhận</div>
        </div>
    </div>
    <div class="os-card">
        <div class="os-dot" style="background:#3f51b5;"></div>
        <div>
            <div class="num">${daXacNhan}</div>
            <div class="lbl">Đã xác nhận</div>
        </div>
    </div>
    <div class="os-card">
        <div class="os-dot" style="background:#9c27b0;"></div>
        <div>
            <div class="num">${dangGiao}</div>
            <div class="lbl">Đang giao</div>
        </div>
    </div>
    <div class="os-card">
        <div class="os-dot" style="background:#4caf50;"></div>
        <div>
            <div class="num">${thanhCong}</div>
            <div class="lbl">Thành công</div>
        </div>
    </div>
    <div class="os-card">
        <div class="os-dot" style="background:#f44336;"></div>
        <div>
            <div class="num">${daHuy}</div>
            <div class="lbl">Đã hủy</div>
        </div>
    </div>
</div>


<c:choose>
    <c:when test="${o.status == 'Chờ xác nhận'}">
        <span class="badge-cho"><i class="fa fa-clock-o"></i> ${o.status}</span>
    </c:when>
    <c:when test="${o.status == 'Đã xác nhận'}">
        <span style="background:#e8eaf6;color:#283593;padding:3px 10px;border-radius:12px;font-size:12px;font-weight:600;">
            <i class="fa fa-check"></i> ${o.status}
        </span>
    </c:when>
    <c:when test="${o.status == 'Đang giao'}"> 
        <span class="badge-ship"><i class="fa fa-truck"></i> ${o.status}</span>
    </c:when>
    <c:when test="${o.status == 'Thành công'}">
        <span class="badge-ok"><i class="fa fa-check-circle"></i> ${o.status}</span>
    </c:when>
    <c:when test="${o.status == 'Đã hủy'}">
        <span class="badge-huy"><i class="fa fa-times-circle"></i> ${o.status}</span>
    </c:when>
    <c:otherwise>
        <span class="badge-cho">${o.status}</span>
    </c:otherwise>
</c:choose>

                <!-- Đơn hàng mới nhất -->
                <div class="section-card">
                    <div class="sc-head">
                        <span><i class="fa-solid fa-clock-rotate-left"
                                 style="color:#e91e63;"></i> Đơn hàng mới nhất</span>
                        <a href="/admin/orders"
                           style="font-size:13px; color:#e91e63; text-decoration:none;">
                            Xem tất cả →
                        </a>
                    </div>
                    <div class="sc-body">
                        <table class="table table-hover mb-0" style="font-size:14px;">
                            <thead style="background:#fafafa;">
                                <tr>
                                    <th>Mã đơn</th>
                                    <th>Người nhận</th>
                                    <th>Địa chỉ</th>
                                    <th style="text-align:center;">Trạng thái</th>
                                    <th style="text-align:center;">Chi tiết</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${recentOrders}" var="o">
                                    <tr>
                                        <td><strong style="color:#e91e63;">#${o.id}</strong></td>
                                        <td>${o.receiverName}</td>
                                        <td style="max-width:180px; overflow:hidden;
                                                   text-overflow:ellipsis; white-space:nowrap;">
                                            ${o.address}
                                        </td>
                                        <td style="text-align:center;">
                                            <c:choose>
                                                <c:when test="${o.status == 'Chờ xác nhận'}">
                                                    <span class="badge-cho">
                                                        <i class="fa fa-clock-o"></i> ${o.status}
                                                    </span>
                                                </c:when>
                                                <c:when test="${o.status == 'Đang giao hàng'}">
                                                    <span class="badge-ship">
                                                        <i class="fa fa-truck"></i> ${o.status}
                                                    </span>
                                                </c:when>
                                                <c:when test="${o.status == 'Thành công'}">
                                                    <span class="badge-ok">
                                                        <i class="fa fa-check-circle"></i> ${o.status}
                                                    </span>
                                                </c:when>
                                                <c:when test="${o.status == 'Đã nhận hàng'}">
                                                    <span class="badge-nhan">
                                                        <i class="fa fa-home"></i> ${o.status}
                                                    </span>
                                                </c:when>
                                                <c:when test="${o.status == 'Đã hủy'}">
                                                    <span class="badge-huy">
                                                        <i class="fa fa-times-circle"></i> ${o.status}
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge-cho">${o.status}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="text-align:center;">
                                            <a href="/admin/orders/${o.id}"
                                               style="background:#e91e63; color:#fff;
                                                      padding:4px 12px; border-radius:5px;
                                                      text-decoration:none; font-size:12px;">
                                                <i class="fa fa-eye"></i> Xem
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Bình luận chờ duyệt -->
                <c:if test="${pendingComments > 0}">
                    <div class="section-card">
                        <div class="sc-head">
                            <span><i class="fa-solid fa-comments" style="color:#e91e63;"></i>
                                Bình luận chờ duyệt
                                <span class="alert-badge" style="margin-left:6px;">
                                    ${pendingComments}
                                </span>
                            </span>
                            <a href="/admin/comments"
                               style="font-size:13px; color:#e91e63; text-decoration:none;">
                                Duyệt ngay →
                            </a>
                        </div>
                        <div class="sc-body" style="padding:16px; color:#888; font-size:14px;">
                            <i class="fa fa-info-circle"></i>
                            Có <strong style="color:#e91e63;">${pendingComments}</strong>
                            bình luận đang chờ được duyệt.
                        </div>
                    </div>
                </c:if>

            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>