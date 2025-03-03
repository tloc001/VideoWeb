<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Edit Profile</title>  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">  
    <style>  
        .navbar {  
            background-color: #f8c74d;  
        }  
        .navbar-brand {  
            color: red;  
        }  
        .nav-link {  
            color: blue;  
        }  
        .form-container {  
            max-width: 600px;  
            margin: auto;  
            padding: 20px;  
            border: 1px solid #ccc;  
            border-radius: 5px;  
        }  
    </style>  
</head>  
<body>  
    <nav class="navbar navbar-expand-lg">  
        <div class="container-fluid">  
            <a class="navbar-brand" href="#">ONLINE ENTERTAINMENT</a>  
            <div class="collapse navbar-collapse" id="navbarNav">  
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">  
                    <li class="nav-item">  
                        <a class="nav-link" href="favorite-video.jsp">MY FAVORITES</a>  
                    </li>  
                    <li class="nav-item dropdown">  
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" data-bs-toggle="dropdown" aria-expanded="false">  
                            MY ACCOUNT  
                        </a>  
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">  
                            <li><a class="dropdown-item" href="login.jsp">Login</a></li>  
                            <li><a class="dropdown-item" href="forgot-pass.jsp">Forgot Password</a></li>  
                            <li><a class="dropdown-item" href="register.jsp">Registration</a></li>  
                            <li><a class="dropdown-item" href="#">Logoff</a></li>  
                            <li><a class="dropdown-item" href="#">Change Password</a></li>  
                            <li><a class="dropdown-item" href="#">Edit Profile</a></li>  
                        </ul>  
                    </li>  
                </ul>  
            </div>  
        </div>  
    </nav>  

    <div class="container my-4">  
        <h2 class="text-center">Edit Profile</h2>  
        <div class="form-container">  
            <form action="${pageContext.request.contextPath}/UserServlet/edit-profile" method="post">  
                <div class="mb-3">  
                    <label for="username" class="form-label">Username</label>  
                    <input type="text" readonly="readonly" value="${sessionScope.user.id }" name="id" class="form-control" id="username" placeholder="Enter your username">  
                </div>  
                <div class="mb-3">  
                    <label for="email" class="form-label">Email address</label>  
                    <input type="email"  value="${sessionScope.user.email }" name="email" class="form-control" id="email" placeholder="Enter your email">  
                </div>  
                <div class="mb-3">  
                    <label for="password" class="form-label">Password</label>  
                    <input type="password"  value="${sessionScope.user.password }" name="password" class="form-control" id="password" placeholder="Enter a new password">  
                </div>  
                <div class="mb-3">  
                    <label for="confirmPassword" class="form-label">Fullname</label>  
                    <input type="text"  value="${sessionScope.user.fullname }" name="fullname" class="form-control" id="confirmPassword" placeholder="Confirm your password">  
                </div>  
                <button type="submit" class="btn btn-primary">Save Changes</button>  
            </form>  
            ${messege}
        </div>  
    </div>  

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>  
</body>  
</html>