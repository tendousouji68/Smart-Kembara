  <!-- Login Form -->
<div class="form-container" id="login-form">
  <!-- Back Button -->
  <a href="javascript:history.back()" class="back-button">&#8592; Back</a> <!-- This is the back button -->

  <h2>Login</h2>
  <form>
    <input type="email" placeholder="Email" required>
    <input type="ntp" placeholder="No Telephone" required>
    <input type="submit" value="Login">
  </form>
</div>



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

.form-container {
  background-color: white;
  padding: 30px;
  border-radius: 10px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  width: 300px;
  text-align: center;
  position: relative; /* Make the container relative so the back button can be positioned inside it */
}

.back-button {
  position: absolute;
  top: 10px; /* Distance from the top of the form */
  left: 10px; /* Distance from the left of the form */
  font-size: 16px;
  color: #006747; /* Green color */
  text-decoration: none;
}

.back-button:hover {
  text-decoration: underline;
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
  color: #006747; /* Gold */
  text-decoration: none;
}

.form-container a:hover {
  text-decoration: underline;
}

.form-toggle {
  margin-top: 20px;
}

  </style>