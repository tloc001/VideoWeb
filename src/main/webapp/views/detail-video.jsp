<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html> 
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Video Detail</title>  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">  
    <!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
    <style>  
        .video-container {  
            border: 2px solid orange;  
            padding: 15px;  
            margin-bottom: 20px;  
        }  
        .related-videos {  
            border: 1px solid green;  
            padding: 10px;  
            margin-bottom: 20px;  
        }  
        .poster {  
            height: 100px;  
            width: 100%;  
            background-color: #ddd; /* Placeholder for poster */  
            display: flex;  
            justify-content: center;  
            align-items: center;  
            font-weight: bold;  
            color: #555;  
            margin-bottom: 5px;  
        }  
        .btn-like {  
            background-color: blue;  
            color: white;  
        }  
        .btn-share {  
            background-color: orange;  
            color: black;  
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
						aria-current="page" href="/ASM_Java4/FavServlet">Danh
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
    <div class="container mt-4">  
        <div class="row">  
            <div class="col-md-8">  
                <div class="video-container">  
<iframe width="100%" height="415" 
        src="https://www.youtube.com/embed/${video.id}" 
        title="YouTube video player" 
        frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
        allowfullscreen>
</iframe>
                    <h5 class="mt-2">${video.title }</h5>  
                    <p>DESCRIPTION: ${video.description}</p>
                    <p>Lượt xem : ${video.views}</p>  
                    <button class="btn btn-like">Like</button>  
                    <button class="btn btn-share">Share</button>  
                </div>  
            </div>  
            <div class="col-md-4">  
                <div class="related-videos">  
                    <h5>New Videos</h5>  
                    <c:forEach var="item" items="${videoList2}">
                    	  <div class="mt-5 mb-5" ><img alt="" src="/ASM_Java4/${item.poster }" style="width: 400px ; height: 200px">  
                    	<a style="text-decoration: none; font-size: 20px" href="/ASM_Java4/VideoServlet/detail?id=${item.id}">${item.title}</a>  
                    	</div>
                    </c:forEach>
                  
                   
                </div>  
            </div>  
        </div>  
    </div>  
<footer class="py-5 mt-5 bg-light"
		style="box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
		<div class="row">
			<div class="col-2">
				<h5>Section</h5>
				<ul class="nav flex-column">
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">Home</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">Features</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">Pricing</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">FAQs</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">About</a></li>
				</ul>
			</div>

			<div class="col-2">
				<h5>Section</h5>
				<ul class="nav flex-column">
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">Home</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">Features</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">Pricing</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">FAQs</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">About</a></li>
				</ul>
			</div>

			<div class="col-2">
				<h5>Section</h5>
				<ul class="nav flex-column">
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">Home</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">Features</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">Pricing</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">FAQs</a></li>
					<li class="nav-item mb-2"><a href="#"
						class="nav-link p-0 text-muted">About</a></li>
				</ul>
			</div>

			<div class="col-4 offset-1">
				<form>
					<h5>Subscribe to our newsletter</h5>
					<p>Monthly digest of whats new and exciting from us.</p>
					<div class="d-flex w-100 gap-2">
						<label for="newsletter1" class="visually-hidden">Email
							address</label> <input id="newsletter1" type="text" class="form-control"
							placeholder="Email address">
						<button class="btn btn-primary" type="button">Subscribe</button>
					</div>
				</form>
			</div>
		</div>

		<div class="d-flex justify-content-between py-4 my-4 border-top">
			<p>© 2021 Company, Inc. All rights reserved.</p>
			<ul class="list-unstyled d-flex">
				<li class="ms-3"><a class="link-dark" href="#"><svg
							class="bi" width="24" height="24">
              <use xlink:href="#twitter"></use>
            </svg></a></li>
				<li class="ms-3"><a class="link-dark" href="#"><svg
							class="bi" width="24" height="24">
              <use xlink:href="#instagram"></use>
            </svg></a></li>
				<li class="ms-3"><a class="link-dark" href="#"><svg
							class="bi" width="24" height="24">
              <use xlink:href="#facebook"></use>
            </svg></a></li>
			</ul>
		</div>
	</footer>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>  
</body>  
</html>