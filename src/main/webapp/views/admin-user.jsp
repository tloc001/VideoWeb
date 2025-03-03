<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>User Management - Administration Tool</title>  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">  
    <style>  
        body {  
            font-family: Arial, sans-serif;  
            background-color: #f2f2f2;  
        }  
        .navbar {  
            background-color: #000;  
            color: #fff;  
        }  
        .navbar a {  
            color: #f8c74d;  
        }  
        .header {  
            background-color: #f8c74d;  
            padding: 10px;  
            text-align: center;  
            font-weight: bold;  
        }  
        .form-container, .user-list-container {  
            background-color: white;  
            border: 1px solid #ccc;  
            border-radius: 5px;  
            padding: 20px;  
            margin: 20px;  
        }  
        .btn-custom {  
            width: 100px;  
            margin: 5px;  
        }  
        .table th, .table td {  
            text-align: center;  
        }  
    </style>  
</head>  
<body>  

    <nav class="navbar navbar-expand-lg navbar-dark">  
        <div class="container-fluid">  
            <a class="navbar-brand" href="#">ADMINISTRATION TOOL</a>  
            <div class="collapse navbar-collapse" id="navbarNav">  
                <ul class="navbar-nav">  
                    <li class="nav-item"><a class="nav-link" href="/ASM_Java4/HomeServlet/index">Home</a></li>  
                    <li class="nav-item"><a class="nav-link" href="/ASM_Java4/videos">Videos</a></li>  
                    <li class="nav-item"><a class="nav-link" href="/ASM_Java4/users">Users</a></li>  
                    <li class="nav-item"><a class="nav-link" href="/ASM_Java4/reports">Reports</a></li>  
                </ul>  
            </div>  
        </div>  
    </nav>  
    <div class="header">  
        <h2>USER EDITION</h2>  
    </div>  

    <div class="form-container">  
        <form action="UserServlet" id="addUserForm" method="post" autocomplete="on">  
            <div class="mb-3">  
                <label for="username" class="form-label">Username?</label>  
                <input type="text" class="form-control" ${userEdit != null ? 'readonly' : ''}  id="username" name="id" value="${userEdit.id }" placeholder="Enter username" required>  
            </div>  
            <div class="mb-3">  
                <label for="password" class="form-label">Password?</label>  
                <input type="password" class="form-control" id="password" value="${userEdit.password }" autocomplete="password" name="password" placeholder="Enter password" required>  
            </div>  
            <div class="mb-3">  
                <label for="fullname" class="form-label">Fullname?</label>  
                <input type="text" class="form-control" id="fullname" value="${userEdit.fullname }" name="fullname" autocomplete="fullname" placeholder="Enter fullname" required>  
            </div>  
            <div class="mb-3">  
                <label for="email" class="form-label">Email Address?</label>  
                <input type="email" class="form-control" id="email" value="${userEdit.email }" name="email" autocomplete="email" placeholder="Enter email address" required>  
            </div>  
             <div class="mb-3">  
                <label>Status?</label><br />  
                <input type="radio" id="active" name="admin" value=true ${userEdit.admin ? 'checked' : '' }>  
                <label for="active">Admin</label>  
                <input type="radio" id="inactive" name="admin" value=false ${!userEdit.admin ? 'checked' : '' }>  
                <label for="inactive">User</label>  
            </div>  
            <button type="submit" class="btn btn-success btn-custom" name="action" ${userEdit == null ? 'formaction="/ASM_Java4/users/create"' : 'formaction="/ASM_Java4/users/update"' } value="update">${userEdit == null ? 'Create' : 'Update' }</button>  
            <button type="submit" class="btn btn-danger btn-custom" formaction="/ASM_Java4/users/delete?id-user=${userEdit.id }" ${userEdit == null ? 'disabled' : ''} name="action" value="delete">Delete</button>  
        </form>  
        ${messege}
    </div>  	
    <div class="user-list-container">  
        <h4>USER LIST</h4>  
        <table class="table table-bordered">  
            <thead>  
                <tr>  
                    <th>Username</th>  
                    <th>Password</th>  
                    <th>Fullname</th>  
                    <th>Email</th>  
                    <th>Role</th>  
                    <th>Action</th>  
                </tr>  
            </thead>  
            <tbody>  
                <c:forEach var="user" items="${userList}">  
                    <tr>  
                        <td>${user.id}</td>  
                        <td>${user.password}</td>  
                        <td>${user.fullname}</td>  
                        <td>${user.email}</td>  
                        <td>${user.admin ? 'Admin' : 'User'}</td>  
                        <td><a class="btn btn-warning btn-sm" href="/ASM_Java4/users/edit?id-user=${user.id}">Edit</a></td>                         
                    </tr>  
                </c:forEach>  
            </tbody>  
        </table>  
        <p>${totalUsers} users</p>  
         <nav>  
            <ul class="pagination justify-content-center">  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/users?page=${1}"><<</a></li>  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/users?page=${currentPage -1}">Previous</a></li>  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/users?page=${currentPage + 1}">Next</a></li>  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/users?page=${totalPages}">>></a></li>  
            </ul>  
        </nav> 
    </div>  

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
  

</body>  
</html>