<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Music Management System</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            margin: 0;
        }
        
        .login-container {
            width: 100%;
            max-width: 450px;
        }
        
        .card {
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .card-header {
            background-color: #4361ee;
            color: white;
            text-align: center;
            padding: 20px;
            border-radius: 8px 8px 0 0;
        }
        
        .card-body {
            padding: 30px;
        }
        
        .form-control {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        
        .btn-primary {
            background-color: #4361ee;
            border: none;
            padding: 10px;
            font-weight: 500;
        }
        
        .btn-primary:hover {
            background-color: #3a56d4;
        }
        
        .password-toggle {
            cursor: pointer;
            color: #6c757d;
        }
        
        .forgot-link, .signup-link {
            color: #4361ee;
            text-decoration: none;
        }
        
        .forgot-link:hover, .signup-link:hover {
            text-decoration: underline;
        }
        
        .alert {
            border-left: 4px solid #dc3545;
            background-color: #fff5f5;
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-music me-2"></i>Music Management System</h3>
                <p class="mb-0">Admin Login</p>
            </div>
            
            <div class="card-body">
                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert mb-4" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
                    </div>
                <% } %>
                
                <form action="login" method="post" id="loginForm">
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
                            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                            <span class="input-group-text password-toggle" onclick="togglePassword()">
                                <i class="fas fa-eye" id="toggleIcon"></i>
                            </span>
                        </div>
                    </div>
                    
                    <div class="mb-3 d-flex justify-content-between">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                        <a href="forgot-password" class="forgot-link">Forgot Password?</a>
                    </div>
                    
                    <button type="submit" class="btn btn-primary w-100 mb-3">
                        <i class="fas fa-sign-in-alt me-2"></i>Sign In
                    </button>
                    
                    <div class="text-center">
                        Don't have an account? <a href="register" class="signup-link">Create one</a>
                    </div>
                    <div class="text-center">
                        Login as User <a href="http://localhost:8082/user/login" class="admin-link">Click here</a>
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