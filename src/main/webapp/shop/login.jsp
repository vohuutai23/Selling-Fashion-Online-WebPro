
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

<button class="js-login">Login</button>
<br>
<button class="js-login">register</button>
<div class="modal js-modal">
  <div class="container js-modal-container" id="container">
    <div class="modal-close js-modal-close">
      <span id="close" class="close">&times;</span>
    </div>
    <div class="form-container sign-up-container">
      <form action="register_customer" method="post">
        <h1>Create Account</h1>
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
        <div class="social-container">
          <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <span>or use your email for registration</span>
        <input type="text" name="nameCustomer" placeholder="Name" id="nameSignUp" />
        <input type="tel" name="phone" placeholder="Phone" id="phoneSignUp" />
        <input type="email" name="email" placeholder="Email" id="emailSignUp" />
        <input type="password" name="password" placeholder="Password" id="passSignUp" />
        <button>Sign Up</button>
      </form>
    </div>
    <div class="form-container sign-in-container">
      <c:if test="${message != null}">
        <div align="center">
          <h4>${message}</h4>
        </div>
      </c:if>
      <form action="login" method="post">
        <h1>Sign in</h1>
        <div class="social-container">
          <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <span>or use your account</span>
        <input type="email" name="email" placeholder="Email" id="emailSignIn" />
        <input type="password" name="password"  placeholder="Password" id="passSignIn" />
        <a href="#">Forgot your password?</a>
        <button>Sign In</button>
      </form>
    </div>
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-left">
          <h1>Welcome Back!</h1>
          <p>To keep connected with us please login with your personal info</p>
          <button class="ghost" type="submit" name="signin" id="signIn">Sign In</button>
        </div>
        <div class="overlay-panel overlay-right">
          <h1>Hello, Friend!</h1>
          <p>Enter your personal details and start journey with us</p>
          <button class="ghost" type="submit" name="signup" id="signUp">Sign Up</button>
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
