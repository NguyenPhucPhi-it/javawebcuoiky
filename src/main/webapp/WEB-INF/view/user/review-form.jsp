<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đánh giá sản phẩm – Poly Shop</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/8c204d0fdf.js" crossorigin="anonymous"></script>
    <style>
        body { background: #f5f5f5; font-family: Arial, sans-serif; }
        .wrapper { max-width: 580px; margin: 50px auto; padding: 0 15px; }
        .card-box { background: #fff; border-radius: 10px;
                    box-shadow: 0 2px 10px rgba(0,0,0,.1); padding: 32px; }
        .card-box h4 { font-weight: 700; color: #333; margin-bottom: 24px;
                       border-left: 4px solid #e91e63; padding-left: 12px; }

        /* Sản phẩm */
        .prod-preview { display: flex; align-items: center; gap: 14px;
                        padding: 14px; background: #fafafa; border-radius: 8px;
                        border: 1px solid #f0f0f0; margin-bottom: 24px; }
        .prod-preview img { width: 64px; height: 64px; object-fit: cover;
                            border-radius: 6px; border: 1px solid #eee; }
        .prod-preview .name { font-weight: 600; font-size: 15px; color: #333; }
        .prod-preview .qty  { font-size: 13px; color: #999; margin-top: 3px; }

        /* Star rating */
        .star-group { display: flex; flex-direction: row-reverse;
                      justify-content: flex-end; gap: 4px; margin-bottom: 20px; }
        .star-group input { display: none; }
        .star-group label { font-size: 32px; color: #ddd; cursor: pointer;
                            transition: color .15s; }
        .star-group input:checked ~ label,
        .star-group label:hover,
        .star-group label:hover ~ label { color: #ff9800; }

        /* Textarea */
        .form-label { font-weight: 600; color: #555; font-size: 14px; }
        textarea.form-control { border-radius: 6px; font-size: 14px;
                                resize: vertical; min-height: 110px; }
        textarea.form-control:focus { border-color: #e91e63;
                                      box-shadow: 0 0 0 2px rgba(233,30,99,.15); }

        /* Buttons */
        .btn-submit { background: #e91e63; color: #fff; border: none;
                      padding: 11px 32px; border-radius: 6px; font-size: 15px;
                      font-weight: 600; cursor: pointer; width: 100%; margin-top: 8px; }
        .btn-submit:hover { background: #c2185b; }
        .btn-back { display: block; text-align: center; margin-top: 12px;
                    color: #888; font-size: 13px; text-decoration: none; }
        .btn-back:hover { color: #333; }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="card-box">
        <h4><i class="fa fa-star" style="color:#ff9800;"></i> Đánh giá sản phẩm</h4>

        <div class="prod-preview">
            <img src="${pageContext.request.contextPath}/assets/uploads/${product.image}"
                 onerror="this.src='${pageContext.request.contextPath}/assets/images/product/product-1.jpg'"
                 alt="${product.name}">
            <div>
                <div class="name">${product.name}</div>
                <div class="qty">Số lượng đã mua: x${detail.quantity}</div>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/user/review/submit" method="post">
            <input type="hidden" name="detailId"  value="${detail.id}">
            <input type="hidden" name="productId" value="${product.id}">
            <input type="hidden" name="orderId"   value="${detail.id_order}">

           
            <div class="mb-3">
                <label class="form-label">Đánh giá của bạn <span style="color:red">*</span></label>
                <div class="star-group">
                    <input type="radio" name="rating" id="s5" value="5" required>
                    <label for="s5"><i class="fa fa-star"></i></label>
                    <input type="radio" name="rating" id="s4" value="4">
                    <label for="s4"><i class="fa fa-star"></i></label>
                    <input type="radio" name="rating" id="s3" value="3">
                    <label for="s3"><i class="fa fa-star"></i></label>
                    <input type="radio" name="rating" id="s2" value="2">
                    <label for="s2"><i class="fa fa-star"></i></label>
                    <input type="radio" name="rating" id="s1" value="1">
                    <label for="s1"><i class="fa fa-star"></i></label>
                </div>
                <div id="ratingText" style="font-size:13px; color:#ff9800; margin-top:4px; min-height:18px;"></div>
            </div>

      
            <div class="mb-3">
                <label class="form-label">Nhận xét <span style="color:red">*</span></label>
                <textarea name="message" class="form-control"
                          placeholder="Chia sẻ trải nghiệm của bạn về sản phẩm này..."
                          required></textarea>
            </div>

            <button type="submit" class="btn-submit">
                <i class="fa fa-paper-plane"></i> Gửi đánh giá
            </button>
        </form>

        <a href="${pageContext.request.contextPath}/user/orders/${detail.id_order}"
           class="btn-back">
            <i class="fa fa-angle-left"></i> Quay lại đơn hàng
        </a>
    </div>
</div>

<script>
    const labels = ['', 'Tệ', 'Không hài lòng', 'Bình thường', 'Hài lòng', 'Rất hài lòng'];
    document.querySelectorAll('input[name="rating"]').forEach(function(el) {
        el.addEventListener('change', function() {
            document.getElementById('ratingText').textContent =
                '★ ' + labels[this.value];
        });
    });
</script>

<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
</body>
</html>