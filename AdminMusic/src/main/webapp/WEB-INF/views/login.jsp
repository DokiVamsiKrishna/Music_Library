<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | My Music Playlists</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #6a5acd; /* Slate blue/lavender */
            --secondary-color: #4169e1; /* Royal blue */
            --hover-color: #8a7bef; /* Lighter lavender */
            --bg-color: #e6e9ff; /* Very light lavender background */
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: var(--bg-color);
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
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(106, 90, 205, 0.2);
            border: none;
        }
        
        .card-header {
            background-color: var(--primary-color);
            color: white;
            text-align: center;
            padding: 25px;
            border-radius: 15px 15px 0 0;
        }
        
        .card-body {
            padding: 30px;
            background-color: white;
            border-radius: 0 0 15px 15px;
        }
        
        .form-control {
            padding: 12px 15px;
            border: 1px solid #e0e0ff;
            border-radius: 8px;
        }
        
        .input-group-text {
            background-color: #f5f5ff;
            border: 1px solid #e0e0ff;
            color: var(--primary-color);
        }
        
        .btn-primary {
            background-color: var(--secondary-color);
            border: none;
            padding: 12px;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background-color: var(--hover-color);
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background-color: var(--primary-color);
            border: none;
            padding: 12px;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
        }
        
        .btn-secondary:hover {
            background-color: var(--hover-color);
            transform: translateY(-2px);
        }
        
        .password-toggle {
            cursor: pointer;
            color: var(--primary-color);
        }
        
        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .forgot-link, .signup-link, .admin-link {
            color: var(--secondary-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease;
        }
        
        .forgot-link:hover, .signup-link:hover, .admin-link:hover {
            color: var(--primary-color);
            text-decoration: underline;
        }
        
        .alert {
            border-left: 4px solid var(--primary-color);
            background-color: #f5f5ff;
            color: var(--primary-color);
        }
        
        .user-option {
            margin-top: 15px;
            text-align: center;
            color: #666;
        }
        
        .music-icon {
            color: #ff6b6b;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-headphones music-icon"></i>My Music Playlists</h3>
                <p class="mb-0">Admin Login</p>
            </div>
            
            <div class="card-body">
                <div class="alert mb-4 d-none" role="alert" id="errorAlert">
                    <i class="fas fa-exclamation-circle me-2"></i><span id="errorMessage"></span>
                </div>
                
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
                    
                    <div class="mb-4 d-flex justify-content-between align-items-center">
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
                    
                    <div class="user-option">
                        <a href="http://localhost:8082/user/login" class="admin-link">
                            <i class="fas fa-user-shield me-1"></i>Login as User
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
        
        // Show error message if needed
        function showError(message) {
            const errorAlert = document.getElementById('errorAlert');
            const errorMessage = document.getElementById('errorMessage');
            errorMessage.textContent = message;
            errorAlert.classList.remove('d-none');
        }
    </script>
</body>
</html>