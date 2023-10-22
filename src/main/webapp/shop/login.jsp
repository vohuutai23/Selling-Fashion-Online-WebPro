
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
      <form action="#">
        <h1>Create Account</h1>
        <div class="social-container">
          <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <span>or use your email for registration</span>
        <input type="text" placeholder="Name" id="nameSignUp" />
        <input type="tel" placeholder="Phone" id="phoneSignUp" />
        <input type="email" placeholder="Email" id="emailSignUp" />
        <input type="password" placeholder="Password" id="passSignUp" />
        <button>Sign Up</button>
      </form>
    </div>
    <div class="form-container sign-in-container">

      <form action="#">
        <h1>Sign in</h1>
        <div class="social-container">
          <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
          <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
          <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
        </div>
        <span>or use your account</span>
        <input type="email" placeholder="Email" id="emailSignIn" />
        <input type="password" placeholder="Password" id="passSignIn" />
        <a href="#">Forgot your password?</a>
        <button>Sign In</button>
      </form>
    </div>
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-left">
          <h1>Welcome Back!</h1>
          <p>To keep connected with us please login with your personal info</p>
          <button class="ghost" id="signIn">Sign In</button>
        </div>
        <div class="overlay-panel overlay-right">
          <h1>Hello, Friend!</h1>
          <p>Enter your personal details and start journey with us</p>
          <button class="ghost" id="signUp">Sign Up</button>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="shop/js/login.js"></script>
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
