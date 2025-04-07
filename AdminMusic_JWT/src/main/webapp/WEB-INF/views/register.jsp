<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Signup | Music Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        
        .signup-container {
            max-width: 500px;
            width: 100%;
        }
        
        .signup-wrapper {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        
        .signup-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .signup-form-container {
            padding: 30px;
        }
        
        .form-control {
            padding: 10px 15px;
            border: 1px solid #ddd;
        }
        
        .btn-signup {
            background-color: #4361ee;
            border: none;
            padding: 10px;
            color: white;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-signup:hover {
            background-color: #3f37c9;
        }
        
        .login-text {
            margin-top: 20px;
            text-align: center;
            font-size: 0.9rem;
        }
        
        .login-link {
            color: #4361ee;
            text-decoration: none;
        }
        
        .alert-custom {
            padding: 10px;
            margin-bottom: 20px;
            border-left: 4px solid #dc3545;
            background-color: #fff5f5;
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container signup-container">
        <div class="signup-wrapper">
            <!-- Signup Form Section -->
            <div class="signup-form-container">
                <div class="signup-header">
                    <h2><i class="fas fa-user-plus me-2"></i>Admin Signup</h2>
                    <p>Create your admin account</p>
                </div>
                
                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert-custom" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
                    </div>
                <% } %>
                
                <form action="register" method="post" class="signup-form" id="signupForm">
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" id="name" name="name" class="form-control" placeholder="Enter your full name" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="email" class="form-label">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Create a password" required>
                            <span class="input-group-text" onclick="togglePassword()">
                                <i class="fas fa-eye" id="toggleIcon"></i>
                            </span>
                        </div>
                        <small class="text-muted">Password must be at least 8 characters</small>
                    </div>
                    
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="agreeTerms" required>
                        <label class="form-check-label" for="agreeTerms">I agree to the terms and conditions</label>
                    </div>
                    
                    <button type="submit" class="btn btn-signup w-100" id="signupButton">
                        <i class="fas fa-user-plus me-2"></i>Create Account
                    </button>
                    
                    <div class="login-text">
                        Already have an account? <a href="login" class="login-link">Login here</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script>
        // Toggle password visibility
        function togglePassword() {
            const passwordField = document.getElementById('password');
            const toggleIcon = document.getElementById('toggleIcon');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }
    </script>
</body>
</html>