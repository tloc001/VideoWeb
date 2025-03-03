<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.js"></script>

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
</head>
<body style="width: 90%;" class="mx-auto">
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

	<!-- article -->
	<div class="row mt-2">
	
	<!-- Carosel -->
	
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/ASM_Java4/uploads/4.png" style="height: 600px" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/ASM_Java4/uploads/TN3.jpg" style="height: 600px" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="/ASM_Java4/uploads/7c8fa08bd7610f7d4a71686efe5036bb.jpg" style="height: 600px" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
		<h1 class="text-center mt-5">Video List</h1>
		<section class="mt-5">
		
		<div class="row row-cols-1 row-cols-md-3 g-4">
		<c:forEach var="item" items="${videoList}">
			<div class="col">
				<div class="card h-100">
					<img src="/ASM_Java4/${item.poster }" class="card-img-top" alt="...">
					<div class="card-body">
						<a style="text-decoration: none; font-size: 25px" href="/ASM_Java4/VideoServlet/detail?id=${item.id}" class="card-title">${item.title}</a>
						<p class="card-text">${item.description}</p>
					</div>
					<div class="card-footer">
								<a
									href="/ASM_Java4/HomeServlet/like?like-id=${item.id}"
									class="btn btn-success ">Thích</a> 
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
															id="recipient-name" required="required">
													</div>
													<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<button type="submit" formaction="/ASM_Java4/HomeServlet/share?share-id=${item.id}" class="btn btn-primary">
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

	</section>

		<!-- ch biet -->
		<div class="card text-center mt-5">
			<div class="card-header">...</div>
			<div class="card-body">
				<h5 class="card-title">Đăng kí để nhận được nhiều thông tin đặc
					biệt từ chúng tôi</h5>
				<p class="card-text">With supporting text below as a natural
					lead-in to additional content.</p>
				<a href="#" class="btn btn-primary">Đăng kí ngay !</a>
			</div>
			<div class="card-footer text-muted">2 days ago</div>
		</div>


	</div>
	
	<!-- Center-aligned -->
	 <nav>  
            <ul class="pagination justify-content-center">  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/HomeServlet/index?page=${1}"><<</a></li>  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/HomeServlet/index?page=${currentPage -1}">Previous</a></li>  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/HomeServlet/index?page=${currentPage + 1}">Next</a></li>  
                <li class="page-item"><a class="page-link" href="/ASM_Java4/HomeServlet/index?page=${totalPages}">>></a></li>  
            </ul>  
        </nav> 
	<!-- pagnation -->
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

</body>

</html>
