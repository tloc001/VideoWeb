<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login & Register</title>

  <!-- MDB -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.1/mdb.min.js"></script>

  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
    integrity="geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</head>

<body>
 <!-- Pills navs -->
  <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
    <li class="nav-item" role="presentation">
      <a class="nav-link ${showAc == null ? 'active' : '' }" id="tab-login" data-bs-toggle="pill" href="#pills-login" role="tab"
        aria-controls="pills-login" aria-selected="true">Login</a>
    </li>
    <li class="nav-item" role="presentation">
      <a class="nav-link ${showAc == null ? '' : 'active' }" id="tab-register" data-bs-toggle="pill" href="#pills-register" role="tab"
        aria-controls="pills-register" aria-selected="false">Register</a>
    </li>
  </ul>
  <!-- Pills navs -->

  <!-- Pills content -->
  <div class="tab-content">
    <!-- Login Tab -->
    <div class="tab-pane fade ${showAc == null ? 'active show' : '' }" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
      <form action="/ASM_Java4/UserServlet/login" method="post">
        <div class="text-center mb-3">
          <p>Sign in with:</p>
          <button type="button" class="btn btn-link btn-floating mx-1">
            <i class="fab fa-facebook-f"></i>
          </button>
          <button type="button" class="btn btn-link btn-floating mx-1">
            <i class="fab fa-google"></i>
          </button>
          <button type="button" class="btn btn-link btn-floating mx-1">
            <i class="fab fa-twitter"></i>
          </button>
          <button type="button" class="btn btn-link btn-floating mx-1">
            <i class="fab fa-github"></i>
          </button>
        </div>

        <p class="text-center">or:</p>

        <div class="form-outline mb-4">
          <input type="text" id="loginName" name="id" class="form-control" required />
          <label class="form-label" for="loginName"> username</label>
        </div>

        <div class="form-outline mb-4">
          <input type="password" name="password" id="loginPassword" class="form-control" required />
          <label class="form-label" for="loginPassword">Password</label>
        </div>

        <div class="row mb-4">
          <div class="col-md-6 d-flex justify-content-center">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" name="remember" id="loginCheck" />
              <label class="form-check-label" for="loginCheck"> Remember me </label>
            </div>
          </div>
          <div class="col-md-6 text-end">
            <a href="#!">Forgot password?</a>
          </div>
        </div>

        <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>
      </form>
      ${messeges}
      ${applicationScope.visitors}
    </div>

    <!-- Register Tab -->
    <div class="tab-pane fade ${showAc == null ? '' : 'active show' }" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
      <form onsubmit="return validatePassword()" action="${pageContext.request.contextPath}/UserServlet/register" method="post">
        <div class="text-center mb-3">
          <p>Sign up with:</p>
          <button type="button" class="btn btn-link btn-floating mx-1">
            <i class="fab fa-facebook-f"></i>
          </button>
          <button type="button" class="btn btn-link btn-floating mx-1">
            <i class="fab fa-google"></i>
          </button>
          <button type="button" class="btn btn-link btn-floating mx-1">
            <i class="fab fa-twitter"></i>
          </button>
          <button type="button" class="btn btn-link btn-floating mx-1">
            <i class="fab fa-github"></i>
          </button>
        </div>

        <p class="text-center">or:</p>

        <div class="form-outline mb-4"> 
          <input type="text" id="registerName" name="fullname" class="form-control" required />
          <label class="form-label"  for="registerName">Name</label>
        </div>
        <div class="form-outline mb-4">
          <input type="text" id="registerUsername" name="id" class="form-control" required />
          <label class="form-label"  for="registerUsername">Username</label>
        </div>
        <div class="form-outline mb-4">
          <input type="email" id="registerEmail" name="email" class="form-control" required />
          <label class="form-label" for="registerEmail">Email</label>
        </div>
        <div class="form-outline mb-4">
          <input type="password" id="registerPassword" name="password" class="form-control" required />
          <label class="form-label" for="registerPassword">Password</label>
        </div>
        <div class="form-outline mb-4">
          <input type="password" id="registerRepeatPassword" class="form-control" required />
          <label class="form-label" for="registerRepeatPassword">Repeat password</label>
        </div>

        <div class="form-check d-flex justify-content-center mb-4">
          <input class="form-check-input me-2" type="checkbox" id="registerCheck" required />
          <label class="form-check-label" for="registerCheck"> I agree to the terms </label>
        </div>

        <button type="submit" class="btn btn-primary btn-block mb-3">Sign up</button>
      </form>
      ${messege}
    </div>
  </div>
  <!-- Pills content -->
</body>
 <script type="text/javascript">
        function validatePassword() {
            // Lấy giá trị của mật khẩu và mật khẩu nhập lại từ form
            var password = document.getElementById("registerPassword").value;
            var confirmPassword = document.getElementById("registerRepeatPassword").value;

            // Kiểm tra nếu mật khẩu và mật khẩu nhập lại khác nhau
            if (password !== confirmPassword) {
                alert("Mật khẩu nhập lại không khớp!");
                return false;  // Dừng việc gửi form
            }

            // Kiểm tra độ dài mật khẩu nếu cần thiết
            if (password.length < 3) {
                alert("Mật khẩu phải có ít nhất 3 ký tự.");
                return false;  // Dừng việc gửi form
            }

            // Nếu tất cả điều kiện đều hợp lệ, cho phép gửi form
            return true;
        }
    </script>
</html>
