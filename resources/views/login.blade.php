  <!-- Login Form -->
  <div class="form-container" id="login-form">
    <h2>Login</h2>
    <form>
      <input type="email" placeholder="Email" required>
      <input type="ntp" placeholder="No Telephone" required>
      <input type="submit" value="Login">
    </form>
    <div class="form-toggle">
      <p>Don't have an account? <a href="javascript:void(0)" onclick="toggleForm()">Register here</a></p>
    </div>
  </div>

  <!-- Register Form -->
  <div class="form-container" id="register-form" style="display:none;">
    <h2>Register</h2>
    <form>
      <input type="text" placeholder="Username" required>
      <input type="email" placeholder="Email" required>
      <input type="ntp" placeholder="No Telephone" required>
      <input type="submit" value="Register">
    </form>
    <div class="form-toggle">
      <p>Already have an account? <a href="javascript:void(0)" onclick="toggleForm()">Login here</a></p>
    </div>
  </div>



  <script>
    function toggleForm() {
      const loginForm = document.getElementById('login-form');
      const registerForm = document.getElementById('register-form');
      if (loginForm.style.display === 'none') {
        loginForm.style.display = 'block';
        registerForm.style.display = 'none';
      } else {
        loginForm.style.display = 'none';
        registerForm.style.display = 'block';
      }
    }
  </script>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('assets/images/image_Searched.png'); /* Add the background image here */
      background-size: cover; /* Ensures the image covers the entire page */
      background-position: center; /* Keeps the image centered */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    
    /* Company name on the left */
    .company-name {
      position: absolute;
      top: 20px;
      left: 20px;
      font-size: 24px;
      font-weight: bold;
      color: #d3c618ff; /* Dark green */
      cursor: pointer;
    }

    .form-container {
      background-color: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      width: 300px;
      text-align: center;
    }

    .company-name:hover {
  color: #FFD700;
}

    h2 {
      color: #006747; /* Dark green */
    }

    .form-container input[type="text"],
    .form-container input[type="ntp"],
    .form-container input[type="email"] {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ddd;
      border-radius: 5px;
      box-sizing: border-box;
    }

    .form-container input[type="submit"] {
      background-color: #006747; /* Dark green */
      color: white;
      padding: 10px;
      border: none;
      border-radius: 5px;
      width: 100%;
      cursor: pointer;
      font-size: 16px;
      margin-top: 10px;
    }

    .form-container input[type="submit"]:hover {
      background-color: #FFD700; /* Gold */
    }

    .form-container a {
      color: #FFD700; /* Gold */
      text-decoration: none;
    }

    .form-container a:hover {
      text-decoration: underline;
    }
    
    .form-toggle {
      margin-top: 20px;
    }
  </style>