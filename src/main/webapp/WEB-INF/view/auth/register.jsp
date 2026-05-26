<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Open Sans', sans-serif;
            background: linear-gradient(135deg, #f5f5f5 0%, #e0e0e0 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 400px;
            padding: 50px 40px;
        }

        .form-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .form-header h2 {
            color: #333333;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .form-header p {
            color: #666666;
            font-size: 14px;
        }

        .input-group {
            margin-bottom: 20px;
            position: relative;
        }

        .input-group label {
            display: block;
            color: #333333;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            text-transform: capitalize;
        }

        .input-group input,
        .input-group select {
            width: 100%;
            padding: 14px 45px 14px 15px;
            border: 1px solid #e5e5e5;
            border-radius: 8px;
            font-size: 14px;
            color: #333333;
            transition: all 0.3s ease;
            background: #f8f8f8;
        }

        .input-group input:focus,
        .input-group select:focus {
            outline: none;
            border-color: #cea679;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(206, 166, 121, 0.1);
        }

        .input-group i {
            position: absolute;
            right: 15px;
            top: 43px;
            color: #cea679;
            font-size: 16px;
        }

        .input-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .btn {
            width: 100%;
            padding: 15px;
            background: #cea679;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 700;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .btn:hover {
            background: #333333;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(206, 166, 121, 0.3);
        }

        .toggle-form {
            text-align: center;
            margin-top: 25px;
            color: #666666;
            font-size: 14px;
        }

        .toggle-form a {
            color: #cea679;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .toggle-form a:hover {
            color: #333333;
            text-decoration: underline;
        }

        .terms {
            margin: 15px 0;
            font-size: 13px;
            color: #666666;
        }

        .terms label {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            cursor: pointer;
        }

        .terms input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #cea679;
            margin-top: 2px;
            flex-shrink: 0;
        }

        .terms a {
            color: #cea679;
            text-decoration: none;
            font-weight: 600;
        }

        .terms a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .container {
                padding: 30px 20px;
            }

            .input-row {
                grid-template-columns: 1fr;
            }

            .form-header h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h2>Đăng Ký</h2>
            <p>Tạo tài khoản mới để bắt đầu</p>
        </div>
        <form action="/auth/register" method="POST">
            <div class="input-group">
                <label>tên <span style="color: red;">*</span></label>
                <input type="text" name="username" placeholder="Nhập họ và tên đầy đủ" required>
                <i class="fas fa-user"></i>
            </div>

            <div class="input-group">
                <label>Email <span style="color: red;">*</span></label>
                <input type="email" name="email" placeholder="Nhập địa chỉ email" required>
                <i class="fas fa-envelope"></i>
            </div>

            <div class="input-row">
                <div class="input-group">
                    <label>Mật khẩu <span style="color: red;">*</span></label>
                    <input type="password" name="password" placeholder="Tối thiểu 6 ký tự" required minlength="6">
                    <i class="fas fa-lock"></i>
                </div>

                <div class="input-group">
                    <label>Xác nhận mật khẩu <span style="color: red;">*</span></label>
                    <input type="password" name="confirm_password" placeholder="Nhập lại mật khẩu" required>
                    <i class="fas fa-lock"></i>
                </div>
            </div>


            <input type="submit" class="btn" value="Đăng Ký" name="btnregister"></input>

            <div class="toggle-form">
                Đã có tài khoản? <a href="/auth/login">Đăng nhập ngay</a>
            </div>
        </form>
    </div>

    <script>
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {
            const password = document.querySelector('input[name="password"]').value;
            const confirmPassword = document.querySelector('input[name="confirm_password"]').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Mật khẩu xác nhận không khớp!');
            }
        });
    </script>
</body>
</html> 