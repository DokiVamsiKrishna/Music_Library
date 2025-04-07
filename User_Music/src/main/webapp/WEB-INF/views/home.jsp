<%@page import="com.wipro.musiclibrary.User_Music.dto.SongDTO"%>
<%@page import="com.wipro.musiclibrary.User_Music.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Library</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3D5A80;
            --secondary-color: #98C1D9;
            --accent-color: #EE6C4D;
            --dark-bg: #293241;
            --light-bg: #E0FBFC;
        }
        
        body {
            background: linear-gradient(135deg, var(--light-bg) 0%, #f0f8ff 100%);
            font-family: 'Poppins', 'Segoe UI', sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .navbar {
            background: var(--dark-bg) !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            padding: 12px 0;
        }
        
        .navbar-brand {
            font-weight: 700;
            font-size: 1.6rem;
            color: var(--light-bg) !important;
            letter-spacing: 0.5px;
        }
        
        .navbar .nav-link {
            font-weight: 500;
            position: relative;
            margin: 0 12px;
            transition: all 0.3s ease;
            color: var(--light-bg) !important;
            font-size: 0.95rem;
        }
        
        .navbar .nav-link:hover {
            color: var(--accent-color) !important;
        }
        
        .navbar .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -3px;
            left: 0;
            background-color: var(--accent-color);
            transition: width 0.3s ease;
        }
        
        .navbar .nav-link:hover::after {
            width: 100%;
        }
        
        .btn-logout {
            background: var(--accent-color);
            border: none;
            box-shadow: 0 4px 10px rgba(238, 108, 77, 0.3);
            transition: all 0.3s ease;
            border-radius: 50px;
            padding: 8px 20px;
        }
        
        .btn-logout:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(238, 108, 77, 0.4);
            background: #f85a39;
        }
        
        .welcome-section {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            margin-top: 40px;
            margin-bottom: 40px;
            border-top: 5px solid var(--accent-color);
            position: relative;
            overflow: hidden;
        }
        
        .welcome-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(152, 193, 217, 0.1) 0%, rgba(61, 90, 128, 0.05) 100%);
            z-index: 0;
        }
        
        .welcome-section > * {
            position: relative;
            z-index: 1;
        }
        
        .welcome-section h2 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .btn-manage {
            background: var(--primary-color);
            border: none;
            box-shadow: 0 4px 12px rgba(61, 90, 128, 0.25);
            transition: all 0.3s ease;
            padding: 12px 28px;
            font-weight: 600;
            border-radius: 50px;
            color: white;
        }
        
        .btn-manage:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(61, 90, 128, 0.35);
            background: #34506f;
        }
        
        .song-list-section {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            margin-bottom: 60px;
            position: relative;
            overflow: hidden;
        }
        
        .song-list-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 8px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }
        
        .song-list-section h3 {
            color: var(--primary-color);
            margin-bottom: 35px;
            font-weight: 700;
            position: relative;
            display: inline-block;
        }
        
        .song-list-section h3::after {
            content: '';
            position: absolute;
            width: 70px;
            height: 3px;
            background: var(--accent-color);
            left: 50%;
            bottom: -12px;
            transform: translateX(-50%);
        }
        
        .card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.07);
            transition: all 0.4s ease;
            overflow: hidden;
            height: 100%;
            background: white;
        }
        
        .card:hover {
            transform: translateY(-12px) scale(1.02);
            box-shadow: 0 15px 35px rgba(61, 90, 128, 0.15);
        }
        
        .card-header {
            padding: 0;
            position: relative;
        }
        
        .bg-light {
            background: linear-gradient(45deg, var(--secondary-color), #c7dff0) !important;
            height: 140px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .fa-3x {
            color: var(--primary-color) !important;
            filter: drop-shadow(0 4px 6px rgba(0, 0, 0, 0.1));
        }
        
        .card-body {
            padding: 25px;
        }
        
        .card-title {
            font-weight: 700;
            font-size: 1.3rem;
            margin-bottom: 15px;
            color: var(--primary-color);
            border-bottom: 2px solid rgba(152, 193, 217, 0.3);
            padding-bottom: 10px;
        }
        
        .card-text {
            margin-bottom: 15px;
            font-size: 0.95rem;
            color: #555;
        }
        
        .card-text strong {
            color: var(--accent-color);
            font-weight: 600;
        }
        
        .music-icon {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 1.5rem;
            color: white;
            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
            z-index: 2;
        }
        
        .no-songs {
            text-align: center;
            padding: 60px;
            color: #6c757d;
            font-size: 1.2rem;
            font-style: italic;
            background: rgba(224, 251, 252, 0.4);
            border-radius: 12px;
        }
        
        .footer {
            background: var(--dark-bg);
            color: white;
            padding: 25px 0;
            text-align: center;
            margin-top: auto;
            box-shadow: 0 -4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .fa-spin-pulse {
            animation-duration: 3s;
        }
        
        @media (max-width: 768px) {
            .card {
                margin-bottom: 30px;
            }
            
            .welcome-section, .song-list-section {
                padding: 25px;
                margin-top: 20px;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fas fa-music me-2"></i>Music Library</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link" href="/user/dashboard"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="login"><i class="fas fa-sign-in-alt me-1"></i> Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register"><i class="fas fa-user-plus me-1"></i> Sign Up</a></li>
                    <li class="nav-item ms-2"><a href="logout" class="btn btn-logout"><i class="fas fa-sign-out-alt me-1"></i> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Welcome Message -->
    <div class="container">
        <div class="welcome-section text-center">
            <h2><i class="fas fa-headphones-alt me-2"></i>Welcome, <%= user.getName() %>!</h2>
            <p class="lead mt-3">Manage your music collection and discover new tracks</p>
            <a href="playlist" class="btn btn-manage mt-4">
                <i class="fas fa-sliders-h me-2"></i>Manage playlist
            </a>
        </div>
    </div>
    
    <!-- Songs Section -->
    <div class="container">
        <div class="song-list-section">
            
            <!-- Song List Header -->
            <h3 class="text-center mb-4"><i class="fas fa-compact-disc me-2"></i>Available Songs</h3>
            
            <!-- Song Cards -->
            <div class="row" id="songContainer">
                <%
                    List<SongDTO> songs = (List<SongDTO>) request.getAttribute("songs");
                    if (songs != null && !songs.isEmpty()) {
                        for (SongDTO song : songs) {
                %>
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-header p-0">
                            <div class="bg-light text-center py-4">
                                <i class="fas fa-music fa-3x"></i>
                            </div>
                            <span class="music-icon"><i class="fas fa-compact-disc fa-spin-pulse"></i></span>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><%= song.getName() %></h5>
                            <p class="card-text"><i class="fas fa-microphone-alt me-2"></i><strong>Singer:</strong> <%= song.getSinger() %></p>
							<p class="card-text"><i class="fas fa-user-tie me-2"></i><strong>Music Director:</strong> <%= song.getMusicDirector() %></p>
                            <p class="card-text"><i class="fas fa-calendar-alt me-2"></i><strong>Release Date:</strong> <%= song.getReleaseDate() %></p>
                            <p class="card-text"><i class="fas fa-compact-disc me-2"></i><strong>Album:</strong> <%= song.getAlbum() %></p>
                        </div>
                    </div>
                </div>
                <% 
                        }
                    } else { 
                %>
                <div class="col-12 no-songs">
                    <i class="fas fa-music-slash fa-3x mb-3"></i>
                    <p>No songs available. Add some tracks to your library!</p>
                </div>
                <% } %>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <footer class="footer mt-auto">
        <div class="container">
            <div class="mt-2">
                <p class="mb-0">Wipro Capstone Music Library</p>
            </div>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Hover effect for cards
        document.querySelectorAll('.card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.querySelector('.fa-spin-pulse').classList.add('fa-spin');
            });
            
            card.addEventListener('mouseleave', function() {
                this.querySelector('.fa-spin-pulse').classList.remove('fa-spin');
            });
        });
    </script>
</body>
</html>