<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Signup | Music Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <!-- Custom CSS -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #e6f5f9;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            margin: 0;
        }
        
        .signup-container {
            max-width: 500px;
            width: 100%;
        }
        
        .card {
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
            border: none;
            overflow: hidden;
        }
        
        .card-header {
            background-color: #2a303c;
            color: white;
            text-align: left;
            padding: 25px;
            border-bottom: none;
        }
        
        .card-header h3 {
            font-weight: 600;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }
        
        .card-header i {
            color: #ff6347;
            margin-right: 10px;
        }
        
        .card-body {
            padding: 30px;
            background-color: #ffffff;
        }
        
        .form-label {
            font-weight: 500;
            color: #444;
            margin-bottom: 8px;
        }
        
        .form-control {
            padding: 12px 15px;
            border: 1px solid #e1e5eb;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 14px;
        }
        
        .form-control:focus {
            border-color: #ff6347;
            box-shadow: 0 0 0 3px rgba(255, 99, 71, 0.15);
        }
        
        .input-group-text {
            background-color: #f8f9fa;
            border: 1px solid #e1e5eb;
            color: #6c757d;
        }
        
        .btn-primary {
            background-color: #ff6347;
            border: none;
            padding: 12px;
            font-weight: 500;
            border-radius: 30px;
            transition: all 0.3s ease;
            font-size: 16px;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #e5573d;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 99, 71, 0.3);
        }
        
        .btn-secondary {
            background-color: #4175af;
            border: none;
            padding: 12px;
            font-weight: 500;
            border-radius: 30px;
            transition: all 0.3s ease;
            font-size: 16px;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #356599;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(65, 117, 175, 0.3);
        }
        
        .password-toggle {
            cursor: pointer;
            color: #6c757d;
            background-color: #f8f9fa;
        }
        
        .login-link {
            color: #4175af;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s ease;
        }
        
        .login-link:hover {
            color: #ff6347;
            text-decoration: none;
        }
        
        .alert-custom {
            border-left: 4px solid #ff6347;
            background-color: #fff5f7;
            color: #ff6347;
            border-radius: 8px;
            padding: 12px 15px;
            margin-bottom: 20px;
        }
        
        .form-check-input:checked {
            background-color: #ff6347;
            border-color: #ff6347;
        }
        
        .login-text {
            margin-top: 15px;
            color: #6c757d;
            font-size: 14px;
            text-align: center;
        }
        
        .text-muted {
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container signup-container">
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-headphones"></i>My Music Playlists</h3>
                <p class="mb-0">Create Account</p>
            </div>
            
            <div class="card-body">
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
                        <label for="phone" class="form-label">Mobile Number</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
                            <input type="tel" id="phone" name="phone" class="form-control" placeholder="Enter your mobile number" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Create a password" required>
                            <span class="input-group-text password-toggle" onclick="togglePassword()">
                                <i class="fas fa-eye" id="toggleIcon"></i>
                            </span>
                        </div>
                        <small class="text-muted">Password must be at least 8 characters</small>
                    </div>
                    
                    <div class="mb-4 form-check">
                        <input type="checkbox" class="form-check-input" id="agreeTerms" required>
                        <label class="form-check-label" for="agreeTerms">I agree to the terms and conditions</label>
                    </div>
                    
                    <div class="d-flex gap-3 mb-3">
                        <button type="submit" class="btn btn-primary flex-grow-1" id="signupButton">
                            <i class="fas fa-user-plus me-2"></i>Create Account
                        </button>
                        <a href="login" class="btn btn-secondary flex-grow-1">
                            <i class="fas fa-sign-in-alt me-2"></i>Back to Login
                        </a>
                    </div>
                    
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