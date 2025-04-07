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
    <!-- Google Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
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
        
        .login-container {
            width: 100%;
            max-width: 450px;
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
        
        .forgot-link, .signup-link, .admin-link {
            color: #4175af;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s ease;
        }
        
        .forgot-link:hover, .signup-link:hover, .admin-link:hover {
            color: #ff6347;
            text-decoration: none;
        }
        
        .alert {
            border-left: 4px solid #ff6347;
            background-color: #fff5f7;
            color: #ff6347;
            border-radius: 8px;
            padding: 12px 15px;
        }
        
        .form-check-input:checked {
            background-color: #ff6347;
            border-color: #ff6347;
        }
        
        .text-center {
            margin-top: 15px;
            color: #6c757d;
            font-size: 14px;
        }
        
        .search-bar {
            border-radius: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-headphones"></i>My Music Playlists</h3>
                <p class="mb-0">User Login</p>
            </div>
            
            <div class="card-body">
                <% if (request.getAttribute("error") != null) { %>
                    <div class="alert mb-4" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
                    </div>
                <% } %>
                
                <form action="login" method="post" id="loginForm">
                    <div class="mb-4">
                        <label for="email" class="form-label">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                            <input type="email" id="email" name="email" class="form-control" placeholder="Enter your email" required>
                        </div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
                            <span class="input-group-text password-toggle" onclick="togglePassword()">
                                <i class="fas fa-eye" id="toggleIcon"></i>
                            </span>
                        </div>
                    </div>
                    
                    <div class="mb-4 d-flex justify-content-between">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Remember me</label>
                        </div>
                        <a href="" class="forgot-link">Forgot Password?</a>
                    </div>
                    
                    <div class="d-flex gap-3 mb-4">
                        <button type="submit" class="btn btn-primary flex-grow-1">
                            <i class="fas fa-sign-in-alt me-2"></i>Sign In
                        </button>
                        <a href="register" class="btn btn-secondary flex-grow-1">
                            <i class="fas fa-user-plus me-2"></i>Register
                        </a>
                    </div>
                    
                    <div class="text-center mt-2">
                        <a href="http://localhost:8081/admin/login" class="admin-link">
                            <i class="fas fa-user-shield me-1"></i>Login as Admin
                        </a>
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