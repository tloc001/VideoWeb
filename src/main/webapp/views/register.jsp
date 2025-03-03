<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Registration Page</title>  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">  
    <style>  
        body {  
            background-color: #f5f5f5;  
        }  
        .registration-container {  
            max-width: 400px;  
            margin: 50px auto;  
            padding: 20px;  
            background-color: #ffffff;  
            border: 1px solid orange;  
            border-radius: 8px;  
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  
        }  
        .registration-title {  
            font-size: 24px;  
            font-weight: bold;  
            color: #333;  
            margin-bottom: 20px;  
            text-align: center;  
            background-color: #d5e8d4; /* Màu nền cho tiêu đề */  
            padding: 10px;  
            border-radius: 6px;  
        }  
        .btn-signup {  
            width: 100%;  
            background-color: orange;  
            color: white;  
        }  
    </style>  
</head>  
<body>  
    <div class="registration-container">  
        <div class="registration-title">REGISTRATION</div>  
        <form action="register" method="post">  
            <div class="mb-3">  
                <label for="username" class="form-label">USERNAME?</label>  
                <input type="text" name="id" class="form-control" id="username" name="username" placeholder="Enter your username" required>  
            </div>  
            <div class="mb-3">  
                <label for="fullname" class="form-label">FULLNAME?</label>  
                <input type="text" name="fullname" class="form-control" id="fullname" name="fullname" placeholder="Enter your full name" required>  
            </div>  
            <div class="mb-3">  
                <label for="password" class="form-label">PASSWORD?</label>  
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>  
            </div>  
            <div class="mb-3">  
                <label for="email" class="form-label">EMAIL ADDRESS?</label>  
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email address" required>  
            </div>  
            <button type="submit" class="btn btn-signup">Sign Up</button>  
        </form>  
    </div>  

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>  
</body>  
</html>