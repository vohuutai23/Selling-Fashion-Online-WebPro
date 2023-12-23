<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=in, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="shop/css/login.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>

<body>

<button class="js-login">Đăng nhập</button>
<br>
<button class="js-login">Đăng kí</button>
<div class="modal js-modal">
  <div class="container js-modal-container" id="container">
    <div class="modal-close js-modal-close">
      <span id="close" class="close">&times;</span>
    </div>
    <div class="form-container sign-up-container">
      <form action="register_customer" method="post">
        <h1>Tạo tài khoản</h1>
        <%--<c:if test="${message != null}">
          <div align="center">
            <h4>${message}</h4>
          </div>
        </c:if>--%>
        <c:if test="${registerFailed}">
          <div class="alert alert-danger">
              ${message}
          </div>
        </c:if>
        <input type="text" name="nameCustomer" placeholder="Tên" id="nameSignUp" />
        <input type="tel" name="phone" placeholder="Số điện thoại" id="phoneSignUp" />
        <input type="email" name="email" placeholder="Email" id="emailSignUp" />
        <input type="password" name="password" placeholder="Mật khẩu" id="passSignUp" />
        <button>Đăng kí</button>
      </form>
    </div>
    <div class="form-container sign-in-container">
      <c:if test="${message != null}">
        <div align="center">
          <h4>${message}</h4>
        </div>
      </c:if>
      <form action="login" method="post">
        <h1>Đăng nhập</h1>
        <input type="email" name="email" placeholder="Email" id="emailSignIn" />
        <input type="password" name="password"  placeholder="Mật khẩu" id="passSignIn" />
        <a href="#" id="forgotPasswordBtn">Quên mật khẩu</a>
        <button>Đăng nhập</button>
      </form>
    </div>
    <form action="${pageContext.request.contextPath}/reset_pass" method="post" id="resetPasswordForm" style="display:none;">
      <input type="email" name="email" placeholder="Enter your email" required />
      <button type="submit">Send Reset Link</button>
    </form>
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-left">
          <h1>Xin chào</h1>

          <button class="ghost" type="submit" name="signin" id="signIn">Đăng nhập</button>
        </div>
        <div class="overlay-panel overlay-right">
          <h1>Xin chào</h1>

          <button class="ghost" type="submit" name="signup" id="signUp">Đăng kí</button>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="shop/js/login.js"></script>
<script>
  window.onload = function() {
    const registerFailed = ${registerFailed};
    if (registerFailed) {
      const container = document.getElementById('container');
      container.classList.add("right-panel-active"); // Kích hoạt hiển thị phần đăng ký
    }
  };
</script>

<%-- At the beginning of your JSP file --%>
<%
  String action = (String) request.getAttribute("action");
%>

<%-- Later in your JSP file, inside the script tag --%>
<script>
  function showRegisterForm() {
    // Thêm các class hoặc style để hiển thị form đăng ký
    // Ví dụ: nếu bạn dùng Bootstrap modal, bạn có thể gọi $('#registerModal').modal('show');
    // Hoặc nếu bạn dùng class để kiểm soát hiển thị:
    var container = document.getElementById('container');
    container.classList.add("right-panel-active");
  }


  window.onload = function() {
    var action = "<%= action %>";
    if (action === "showRegisterForm") {
      // Tự động hiển thị form đăng ký
      // Đảm bảo rằng bạn có logic tương tự trong JavaScript của bạn để xử lý việc hiển thị form
      showRegisterForm(); // Giả sử showRegisterForm là hàm của bạn để hiển thị form đăng ký
    }
  };
</script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    const forgotPasswordBtn = document.getElementById('forgotPasswordBtn');
    const emailInput = document.getElementById('emailSignIn');

    forgotPasswordBtn.addEventListener('click', function() {
      const email = emailInput.value;
      if (email) {
        // Gửi email đến địa chỉ đã nhập
        resetPassword(email);
      } else {
        alert('Vui lòng nhập địa chỉ email của bạn.');
      }
    });
  });

  function resetPassword(email) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "${pageContext.request.contextPath}/reset_pass", true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
      if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
        // Giả sử rằng phản hồi là một chuỗi văn bản
        var responseText = this.responseText;
        if (responseText === "Email không tồn tại") {
          alert('Email không tồn tại trong hệ thống của chúng tôi.');
        } else {
          alert('Một liên kết đặt lại mật khẩu đã được gửi tới email của bạn.');
        }
      }
    }
    xhr.send('email=' + encodeURIComponent(email));
  }

</script>

<%--<script>
  window.onload = function() {
    // Kiểm tra cờ được đặt trong request để hiển thị phần đăng ký
    var showRegisterForm = ${showRegisterForm != null ? showRegisterForm : false};
    var container = document.getElementById('container');
    if (showRegisterForm) {
      container.classList.add("right-panel-active");
    }
  };
</script>--%>

<!-- <script>
    const loginBtns = document.querySelectorAll('.js-login')
    const modal = document.querySelector('.js-modal')
    const modalClose = document.querySelector('.js-modal-close')

    function showLogin() {
        modal.classList.add('open')
    }

    function hideLogin() {
        modal.classList.remove('open')

    }
    for (const loginBtn of loginBtns) {
        loginBtn.addEventListener('click', showLogin)
    }
    modalClose.addEventListener('click', hideLogin)
</script>
<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
</script> -->
</body>

</html>
