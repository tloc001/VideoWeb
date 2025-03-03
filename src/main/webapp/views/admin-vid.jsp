<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Administration Tool - Video Management</title>  
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

    <div class="header">  
        <h2>VIDEO EDITION</h2>  
    </div>  

    <div class="form-container">  
        <c:if test="${videoEdit != null}"> <img alt="" class="poster" style="height: 300px; width: 500px" src="/ASM_Java4/${videoEdit.poster }"></c:if>
        <form action="/ASM_Java4/videos" method="post" enctype="multipart/form-data" >  
            <div class="mb-3">  
                <label for="youtubeId" class="form-label">Youtube ID?</label>  
                <input type="text" name="id" value="${videoEdit.id }" ${videoEdit == null ? '' : 'readonly' } class="form-control" id="youtubeId"  placeholder="Enter Youtube ID" required>  
            </div>  
             <div class="mb-3">  
                <label for="youtubeId" class="form-label">Poster ?</label>  
                <input type="file" name="poster"  class="form-control" id="youtubeId" name="youtubeId" placeholder="Enter Youtube ID" ${videoEdit != null ? '' : 'required'  }>  
            </div>  
            <div class="mb-3">  
                <label for="videoTitle" class="form-label">Video Title?</label>  
                <input type="text" name="title" value="${videoEdit.title }" class="form-control" id="videoTitle" name="videoTitle" placeholder="Enter Video Title" required>  
            </div>  
            <div class="mb-3">  
                <label for="viewCount" class="form-label">View Count?</label>  
                <input type="number" min="0" name="views" value="${videoEdit.views }" class="form-control" id="viewCount" name="viewCount" value="0">  
            </div>  
            <div class="mb-3">  
                <label>Status?</label><br />  
                <input type="radio" id="active" name="active" value="true" ${videoEdit.active ? 'checked' : '' }>  
                <label for="active">Active</label>  
                <input type="radio" id="inactive" name="active" value="false" ${!videoEdit.active ? 'checked' : '' }>  
                <label for="inactive">Inactive</label>  
            </div>  
            <div class="mb-3">  
                <label for="description" class="form-label">Description?</label>  
                <textarea class="form-control"  name="description" id="description"  placeholder="Enter description">${videoEdit.description }</textarea>  
            </div>  
            <button type="submit" class="btn btn-success btn-custom" name="action"  value="create">Create</button>
            <button type="submit" class="btn btn-info btn-custom" name="action" formaction="/ASM_Java4/videos/${videoEdit.id}" value="update">Update</button>  
            <button type="submit" class="btn btn-danger btn-custom" name="action" formaction="/ASM_Java4/videos/${videoEdit.id}" value="delete">Delete</button>  
            <button type="reset" class="btn btn-secondary btn-custom">Reset</button>  
        </form>  
        ${message}
    </div>  

    <div class="video-list">  
        <h4>VIDEO LIST</h4>  
        <table class="table table-bordered">  
            <thead>  
                <tr>  
                    <th>Youtube Id</th>  
                    <th>Video Title</th>  
                    <th>View Count</th>  
                    <th>Poster</th>
                    <th>Description</th>  
                    <th>Action</th>  
                    <th>Edit</th>
                </tr>  
            </thead>  
            <tbody>  
                <c:forEach var="video" items="${videoList}">  
                    <tr>  
                        <td>${video.id}</td>  
                        <td>${video.title}</td>  
                        <td>${video.views}</td>
                        <td><img alt="" style="height: 300px; width: 500px" src="/ASM_Java4/${video.poster}"></td>  
                        <td>${video.description}</td>
                        <td>${video.active}</td>  
                        <td><a class="btn btn-warning btn-sm"  href="/ASM_Java4/videos/${video.id}">Edit</a></td>  
                    </tr>  
                </c:forEach>  
            </tbody>  
        </table>  
        <p>${totalVideos} videos</p>  
        <nav>  
            <ul class="pagination justify-content-center">  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/videos?page=${1}"><<</a></li>  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/videos?page=${currentPage -1}">Previous</a></li>  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/videos?page=${currentPage + 1}">Next</a></li>  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/videos?page=${totalPages}">>></a></li>  
            </ul>  
        </nav>  
    </div>  

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>  
</body>  
</html>