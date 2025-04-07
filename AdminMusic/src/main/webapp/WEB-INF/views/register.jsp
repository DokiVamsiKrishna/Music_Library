<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup | My Music Playlists</title>
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
        
        .signup-container {
            width: 100%;
            max-width: 500px;
        }
        
        .card {
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(106, 90, 205, 0.2);
            border: none;
            overflow: hidden;
        }
        
        .card-header {
            background-color: var(--primary-color);
            color: white;
            text-align: center;
            padding: 25px;
        }
        
        .card-body {
            padding: 30px;
            background-color: white;
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
        
        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .password-toggle {
            cursor: pointer;
            color: var(--primary-color);
        }
        
        .login-link {
            color: var(--secondary-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease;
        }
        
        .login-link:hover {
            color: var(--primary-color);
            text-decoration: underline;
        }
        
        .alert-custom {
            border-left: 4px solid var(--primary-color);
            background-color: #f5f5ff;
            color: var(--primary-color);
            padding: 12px 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        
        .text-muted {
            color: #6c757d;
            font-size: 0.85rem;
            margin-top: 5px;
        }
        
        .music-icon {
            color: #ff6b6b;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container signup-container">
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-headphones music-icon"></i>My Music Playlists</h3>
                <p class="mb-0">Create Your Account</p>
            </div>
            
            <div class="card-body">
                <div class="alert-custom d-none" role="alert" id="errorAlert">
                    <i class="fas fa-exclamation-circle me-2"></i><span id="errorMessage"></span>
                </div>
                
                <form action="register" method="post" id="signupForm">
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
                            <span class="input-group-text password-toggle" onclick="togglePassword()">
                                <i class="fas fa-eye" id="toggleIcon"></i>
                            </span>
                        </div>
                        <small class="text-muted">Password must be at least 8 characters</small>
                    </div>
                    
                    <div class="mb-4">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm your password" required>
                        </div>
                    </div>
                    
                    <div class="mb-4 form-check">
                        <input type="checkbox" class="form-check-input" id="agreeTerms" required>
                        <label class="form-check-label" for="agreeTerms">I agree to the terms and conditions</label>
                    </div>
                    
                    <button type="submit" class="btn btn-primary w-100 mb-3">
                        <i class="fas fa-user-plus me-2"></i>Create Account
                    </button>
                    
                    <div class="text-center mt-3">
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
        
        // Form validation
        document.getElementById('signupForm').addEventListener('submit', function(event) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                event.preventDefault();
                showError("Passwords do not match");
            }
            
            if (password.length < 8) {
                event.preventDefault();
                showError("Password must be at least 8 characters");
            }
        });
        
        // Show error message
        function showError(message) {
            const errorAlert = document.getElementById('errorAlert');
            const errorMessage = document.getElementById('errorMessage');
            errorMessage.textContent = message;
            errorAlert.classList.remove('d-none');
        }
    </script>
</body>
</html>