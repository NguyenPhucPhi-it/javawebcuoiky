
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
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

        .input-group input {
            width: 100%;
            padding: 14px 45px 14px 15px;
            border: 1px solid #e5e5e5;
            border-radius: 8px;
            font-size: 14px;
            color: #333333;
            transition: all 0.3s ease;
            background: #f8f8f8;
        }

        .input-group input:focus {
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

        .divider {
            text-align: center;
            margin: 25px 0;
            position: relative;
        }

        .divider::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            width: 100%;
            height: 1px;
            background: #e5e5e5;
        }

        .divider span {
            background: #ffffff;
            padding: 0 15px;
            color: #999999;
            font-size: 14px;
            position: relative;
            z-index: 1;
        }

        .social-login {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .social-btn {
            flex: 1;
            padding: 12px;
            border: 2px solid #e5e5e5;
            border-radius: 8px;
            background: #ffffff;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #333333;
        }

        .social-btn:hover {
            border-color: #cea679;
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }

        .social-btn i {
            font-size: 18px;
        }

        .social-btn.google i {
            color: #DB4437;
        }

        .social-btn.facebook i {
            color: #4267B2;
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

        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 15px 0;
            font-size: 14px;
        }

        .remember-forgot label {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            color: #666666;
        }

        .remember-forgot input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #cea679;
        }

        .remember-forgot a {
            color: #cea679;
            text-decoration: none;
            font-weight: 600;
        }

        .remember-forgot a:hover {
            text-decoration: underline;
        }
        

        @media (max-width: 768px) {
            .container {
                padding: 30px 20px;
            }

            .form-header h2 {
                font-size: 24px;
            }

            .social-login {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-header">
               <a href="/user/home"><i class="fa-solid fa-house"></i></a> 
            <h2>Đăng Nhập</h2>
        
            <p>Chào mừng bạn trở lại!</p>
        </div>

        <form action="/auth/login" method="POST">
            <div class="input-group">
                <label> Email: </label>
                <input type="text" name="email" placeholder="Nhập tên đăng nhập" required>
                <i class="fas fa-user"></i>
            </div>

            <div class="input-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" placeholder="Nhập mật khẩu" required>
                <i class="fas fa-lock"></i>
            </div>

            <div class="remember-forgot">
                <a href="index.php?act=forgot_password">Quên mật khẩu?</a>
            </div>

          <input type="submit" value="Đăng nhập"  class="btn" name="btnlogin" >

            <div class="divider">
                <span>Hoặc đăng nhập với</span>
            </div>

            <div class="social-login">
                <button type="button" class="social-btn google" onclick="loginWithGoogle()">
                    <i class="fab fa-google"></i>
                    Google
                </button>
                <button type="button" class="social-btn facebook" onclick="loginWithFacebook()">
                    <i class="fab fa-facebook-f"></i>
                    Facebook
                </button>
            </div>

            <div class="toggle-form">
                Chưa có tài khoản? <a href="/auth/register">Đăng ký ngay</a>
            </div>
        </form>

    </div>
</body>
</html>