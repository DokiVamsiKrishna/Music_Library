<%@page import="com.wipro.music.AdminMusic.dto.SongDTO"%>
<%@page import="com.wipro.music.AdminMusic.entity.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
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
            --primary-color: #4158D0;
            --secondary-color: #C850C0;
            --accent-color: #FFCC70;
            --dark-bg: #212529;
            --light-bg: #f8f9fa;
        }
        
        body {
            background: linear-gradient(135deg, var(--light-bg) 0%, #e9f2f9 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        
        .navbar {
            background: linear-gradient(90deg, var(--primary-color) 0%, var(--secondary-color) 100%) !important;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 15px 0;
        }
        
        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
        }
        
        .navbar .nav-link {
            font-weight: 500;
            position: relative;
            margin: 0 10px;
            transition: all 0.3s ease;
        }
        
        .navbar .nav-link:hover {
            color: var(--accent-color) !important;
        }
        
        .navbar .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--accent-color);
            transition: width 0.3s ease;
        }
        
        .navbar .nav-link:hover::after {
            width: 100%;
        }
        
        .btn-logout {
            background: linear-gradient(45deg, #ff5e62, #ff9966);
            border: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }
        
        .btn-logout:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        
        .welcome-section {
            background: linear-gradient(135deg, rgba(255,255,255,0.8) 0%, rgba(255,255,255,0.9) 100%);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 24px rgba(65, 88, 208, 0.1);
            margin-top: 30px;
            margin-bottom: 30px;
        }
        
        .welcome-section h2 {
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 700;
        }
        
        .btn-manage {
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            padding: 10px 24px;
            font-weight: 600;
        }
        
        .btn-manage:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }
        
        .song-list-section {
            background: linear-gradient(135deg, rgba(255,255,255,0.8) 0%, rgba(255,255,255,0.9) 100%);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 24px rgba(65, 88, 208, 0.1);
            margin-bottom: 50px;
        }
        
        .song-list-section h3 {
            color: var(--primary-color);
            margin-bottom: 30px;
            font-weight: 700;
            position: relative;
            display: inline-block;
        }
        
        .song-list-section h3::after {
            content: '';
            position: absolute;
            width: 60px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            left: 50%;
            bottom: -10px;
            transform: translateX(-50%);
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            overflow: hidden;
        }
        
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }
        
        .card-img-top {
            height: 180px;
            object-fit: cover;
        }
        
        .card-body {
            padding: 25px;
        }
        
        .card-title {
            font-weight: 700;
            font-size: 1.25rem;
            margin-bottom: 15px;
            color: var(--primary-color);
        }
        
        .card-text {
            margin-bottom: 10px;
            font-size: 0.95rem;
        }
        
        .card-text strong {
            color: var(--secondary-color);
        }
        
        .badge-visible {
            font-size: 0.8rem;
            padding: 5px 10px;
            border-radius: 20px;
        }
        
        .badge-visible.yes {
            background-color: #28a745;
            color: white;
        }
        
        .badge-visible.no {
            background-color: #dc3545;
            color: white;
        }
        
        .music-icon {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 1.5rem;
            color: var(--primary-color);
            opacity: 0.8;
        }
        
        .btn-play {
            width: 100%;
            margin-top: 15px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border: none;
            color: white;
            padding: 10px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-play:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .no-songs {
            text-align: center;
            padding: 50px;
            color: #6c757d;
            font-size: 1.2rem;
            font-style: italic;
        }
        
        .footer {
            background: linear-gradient(90deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: auto;
        }
        
        @media (max-width: 768px) {
            .card {
                margin-bottom: 30px;
            }
            
            .welcome-section, .song-list-section {
                padding: 20px;
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
                    <li class="nav-item"><a class="nav-link" href="/admin/home"><i class="fas fa-home me-1"></i> Home</a></li>
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
            <h2><i class="fas fa-headphones me-2"></i>Welcome, <%= admin.getName() %>!</h2>
            <p class="lead mt-3">Manage your music collection and discover new tracks</p>
            <a href="/admin/songs" class="btn btn-manage mt-3">
                <i class="fas fa-sliders-h me-2"></i>Manage Songs
            </a>
        </div>
    </div>
    
    <!-- Search Bar -->
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
                            <div class="bg-light text-center py-4" style="background: linear-gradient(45deg, #f3f4f5, #e6e7e8);">
                                <i class="fas fa-music fa-3x text-primary"></i>
                            </div>
                            <span class="music-icon"><i class="fas fa-compact-disc fa-spin-pulse"></i></span>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><%= song.getName() %></h5>
                            <p class="card-text"><i class="fas fa-microphone-alt me-2"></i><strong>Singer:</strong> <%= song.getSinger() %></p>
                            <p class="card-text"><i class="fas fa-user-tie me-2"></i><strong>Music Director:</strong> <%= song.getMusicDirector() %></p>
                            <p class="card-text"><i class="fas fa-calendar-alt me-2"></i><strong>Release Date:</strong> <%= song.getReleaseDate() %></p>
                            <p class="card-text"><i class="fas fa-compact-disc me-2"></i><strong>Album:</strong> <%= song.getAlbum() %></p>
                            <p class="card-text">
                                <span class="badge badge-visible <%= song.isVisible() ? "yes" : "no" %>">
                                    <i class="fas <%= song.isVisible() ? "fa-eye" : "fa-eye-slash" %> me-1"></i>
                                    <%= song.isVisible() ? "Visible" : "Hidden" %>
                                </span>
                            </p>
                            
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
            <div class="mt-3">
                <p class="mb-0">Wipro Capstone Music Library.</p>
            </div>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Hover effect for cards
        document.querySelectorAll('.card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.querySelector('.fas-spin-pulse').classList.add('fa-spin');
            });
            
            card.addEventListener('mouseleave', function() {
                this.querySelector('.fas-spin-pulse').classList.remove('fa-spin');
            });
        });


    </script>
</body>
</html>