<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Change Password</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
    integrity="geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

  <style>
    .form-container {
      max-width: 400px;
      margin: 50px auto;
      padding: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      background-color: #fff;
    }

    .form-container h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #007bff;
    }

    .btn-primary {
      width: 100%;
    }
  </style>
</head>

<body>
  <div class="form-container">
    <h2>Change Password</h2>
    <!-- Form gửi dữ liệu tới servlet -->
    <form id="changePasswordForm" action="${pageContext.request.contextPath}/UserServlet/change-pass" method="post" onsubmit="return handleChangePassword(event)">
      <!-- Username -->
      <div class="mb-3">
        <label for="username"  class="form-label">Username</label>
        <input type="text" name="id" class="form-control" id="username" name="username" required />
      </div>

      <!-- Current Password -->
      <div class="mb-3">
        <label for="currentPassword" class="form-label">Current Password</label>
        <input type="password" name="password" class="form-control" id="currentPassword" name="currentPassword" required />
      </div>

      <!-- New Password -->
      <div class="mb-3">
        <label for="newPassword" class="form-label">New Password</label>
        <input type="password" name="newpass" class="form-control" id="newPassword" name="newPassword" required />
      </div>

      <!-- Confirm New Password -->
      <div class="mb-3">
        <label for="confirmPassword" class="form-label">Confirm New Password</label>
        <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" name="confirmPassword" required />
      </div>

      <button type="submit" class="btn btn-primary">Change Password</button>
    </form>
    ${messege}
  </div>

  <script>
    function handleChangePassword(event) {
      const newPassword = document.getElementById('newPassword').value;
      const confirmPassword = document.getElementById('confirmPassword').value;

      if (newPassword !== confirmPassword) {
        alert('New Password and Confirm Password do not match!');
        return false; // Ngăn form gửi dữ liệu
      }

      return true; // Cho phép form gửi dữ liệu
    }
  </script>
</body>

</html>
