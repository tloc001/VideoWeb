<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>My Favorites</title>  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> 
    <link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet"> 
    <style>  
        body {  
            background-color: #f8f9fa;  
        }  
        .video-card {  
            border: 2px solid orange;  
            margin: 15px 0;  
            border-radius: 5px;  
            overflow: hidden;  
        }  
        .poster {  
            height: 200px;  
            background-color: #e9ecef;  
            display: flex;  
            justify-content: center;  
            align-items: center;  
            font-weight: bold;  
            color: #6c757d;  
        }  
        .card-title {  
            background-color: #d5e8d4;  
            padding: 10px;  
            margin: 0;  
            text-align: center;  
        }  
        .btn {  
            margin: 5px;  
        }  
        .btn-unlike {  
            background-color: blue;  
            color: white;  
        }  
        .btn-share {  
            background-color: orange;  
            color: white;  
        }  
    </style>  
</head>  
<body>  

<!-- nav -->
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
		
			<a class="navbar-brand" href="#"><i class="fas fa-icons fa-lg" style="color: #B197FC;"></i> Hello
				${sessionScope.user == null ? 'Guest' : sessionScope.user.fullname} !</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/ASM_Java4/views/favorite-video.jsp">Danh
							sách yêu thích</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="far fa-user-circle fa-lg" style="color: #74C0FC;"></i>
					</a>
						<ul class="dropdown-menu">
							${sessionScope.user == null ? '              <li><a class="dropdown-item" href="/ASM_Java4/views/forgot-pass.jsp"><i class="fas fa-wrench fa-lg" style="color: #74C0FC;"></i> Quên mật khẩu</a></li>
' : ''  }

							${sessionScope.user == null ? '              <li><a class="dropdown-item" href="/ASM_Java4/UserServlet/register"><i class="far fa-registered fa-lg" style="color: #74C0FC;"></i> Đăng kí</a></li>' : ''  }
							${sessionScope.user == null ? '' : '<li><a class="dropdown-item" href="/ASM_Java4/UserServlet/edit-profile"><i
									class="fas fa-user-edit fa-lg" style="color: #74C0FC;"></i>
									Chỉnh sửa trang cá nhân </a></li>'  }
							
							${sessionScope.user == null ? '' : '<li><a class="dropdown-item" href="/ASM_Java4/views/change-pass.jsp"><i class="fas fa-undo fa-lg" style="color: #74C0FC;"></i>
									Thay đổi mật khẩu </a></li>'  }
							<li><a class="dropdown-item"
								href="${pageContext.request.contextPath}/${sessionScope.user == null ? '/views/login.jsp' : 'UserServlet/logout'  }">${sessionScope.user == null ? '<i class="fas fa-sign-in-alt fa-lg" style="color: #74C0FC;"></i> Đăng nhập' : '<i class="fas fa-sign-out-alt fa-lg" style="color: #74C0FC;"></i> Đăng xuất'  }</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- nav  -->  

	<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach var="item" items="${videoList1}">
			<div class="col">
				<div class="card h-100">
					<img src="/ASM_Java4/${item.poster }" class="card-img-top" alt="...">
					<div class="card-body">
						<a style="text-decoration: none; font-size: 25px" href="/ASM_Java4/VideoServlet/detail?id=${item.idvideo}" class="card-title">${item.title}</a>
						<p class="card-text">${item.description}</p>
					</div>
					<div class="card-footer">
								<a
									href="/ASM_Java4/FavServlet/unlike?unlike-id=${item.id}"
									class="btn btn-danger ">Hủy Thích</a> 
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal"
									data-bs-whatever="@mdo">Share</button>

								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">New
													message</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<form method="post">
													<div class="mb-3">
														<label for="recipient-name" class="col-form-label">Email người nhận:</label>
														<input type="text" name="email" class="form-control"
															id="recipient-name">
													</div>
													<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<button type="submit" formaction="/ASM_Java4/FavServlet/share?share-id=${item.id}" class="btn btn-primary">
													Send</button>
											</div>
												</form>
											</div>
											
										</div>
									</div>
								</div>
							</div>
				</div>
			</div>
		</c:forEach>		
			
		</div> 

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>  
</body>  
</html>