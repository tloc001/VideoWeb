<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Report - Video Favorites</title>  
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
        .form-container {  
            background-color: white;  
            border: 1px solid #ccc;  
            border-radius: 5px;  
            padding: 20px;  
            margin: 20px;  
        }  
        .video-list {  
            margin: 20px;  
        }  
       
        .btn-custom {  
            width: 100px;  
            margin: 5px;  
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

    <div class="container mt-4">  
        <ul class="nav nav-tabs" id="myTab" role="tablist">  
            <li class="nav-item" role="presentation">  
                <a class="nav-link active" id="favorites-tab" data-bs-toggle="tab" href="#favorites" role="tab" aria-controls="favorites" aria-selected="true">Favorites</a>  
            </li>  
            <li class="nav-item" role="presentation">  
                <a class="nav-link" id="favorite-users-tab" data-bs-toggle="tab" href="#favoriteUsers" role="tab" aria-controls="favoriteUsers" aria-selected="false">Favorite Users</a>  
            </li>  
            <li class="nav-item" role="presentation">  
                <a class="nav-link" id="shared-friends-tab" data-bs-toggle="tab" href="#sharedFriends" role="tab" aria-controls="sharedFriends" aria-selected="false">Shared Friends</a>  
            </li>  
        </ul>  
        <div class="tab-content" id="myTabContent">  
            <div class="tab-pane fade show active" id="favorites" role="tabpanel" aria-labelledby="favorites-tab">  
                <h4>Favorites</h4>  
               <table  class="table table-bordered">
        <thead>
            <tr>
                <th>Video ID</th>
              
                <th>Count Like</th>
                <th>Oldest Like Date</th>
                <th>Newest Like Date</th>
            </tr>
        </thead>
        <tbody>
            <!-- Duyệt qua kết quả và hiển thị dữ liệu -->
            <c:forEach var="result" items="${results}">
                <tr>
                    <td>${result[1]}</td>
                   <!-- Video ID -->
                    <td>${result[0]}</td>  <!-- User Count -->
                    <td>${result[2]}</td>  <!-- Oldest Like Date -->
                    <td>${result[3]}</td>  <!-- Newest Like Date -->
                </tr>
            </c:forEach>
        </tbody>
    </table>
            </div>  

            <div class="tab-pane fade" id="favoriteUsers" role="tabpanel" aria-labelledby="favorite-users-tab">  
                <h4>Favorite Users</h4>  
                 <form action="/ASM_Java4/reports" method="get">
        <label for="videoSelect">Chọn Video:</label>
        <select name="video-id" id="videoSelect" name="videoId">
         
            <!-- Các option khác -->
            <c:forEach  var="item" items="${videoList}">
            <option value = "${item.id }">${item.title}</option>
            </c:forEach>
        </select>
        <button formaction="/ASM_Java4/reports" type="submit">Gửi</button>
    </form>
                <table class="table table-bordered">  
                    <thead>  
                        <tr>  
                             
                            <th>Username</th>
                            <th>Title</th>  
                            <th>Fullname</th>  
                            <th>Email</th>  
                            <th>Favorite Date</th>  
                        </tr>  
                    </thead>  
                     <tbody>
            <c:forEach var="fav" items="${favoritesData}">
                <tr>
                    <td>${fav.userId}</td>
                    <td>${fav.title}</td>
                    <td>${fav.fullname}</td>
                    <td>${fav.email}</td>
                    <td>${fav.likeDate}</td>
                </tr>
            </c:forEach>
        </tbody>
                </table>  
              
            </div>  

            <div class="tab-pane fade" id="sharedFriends" role="tabpanel" aria-labelledby="shared-friends-tab">  
                <h4>Shared Friends</h4>  
                 <form action="/ASM_Java4/reports" method="get">
        <label for="videoSelect">Chọn Video:</label>
        <select name="video-id2" id="videoSelect" name="videoId">
         
            <!-- Các option khác -->
            <c:forEach  var="item" items="${videoList}">
            <option value = "${item.id }">${item.title}</option>
            </c:forEach>
        </select>
        <button formaction="/ASM_Java4/reports" type="submit">Gửi</button>
    </form>
                <table class="table table-bordered">  
                    <thead>  
                        <tr>  
                            <th>Sender Name</th>  
                            <th>Sender Email</th>  
                            <th>Receiver Email</th>  
                            <th>Sent Date</th>  
                        </tr>  
                    </thead>  
                    <tbody>  
                      <c:forEach var="fav" items="${shareList}">
                <tr>
                    <td>${fav.fullname}</td>
                    <td>${fav.email}</td>
                    <td>${fav.emails}</td>
                    <td>${fav.sentDate}</td>
                </tr>
            </c:forEach>
                    </tbody>  
                </table>  
            </div>  
        </div>  
    </div>  

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>  
</body>  
</html>