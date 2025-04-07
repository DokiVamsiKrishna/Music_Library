<%@page import="com.wipro.music.AdminMusic.dto.SongDTO"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Songs</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
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
            padding-bottom: 50px;
        }
        
        .page-header {
            background: linear-gradient(90deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }
        
        .page-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            opacity: 0.6;
        }
        
        .page-header h2 {
            font-weight: 700;
            position: relative;
            z-index: 2;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }
        
        .home-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.4);
            color: white;
            border-radius: 30px;
            padding: 8px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 2;
        }
        
        .home-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            color: white;
        }
        
        .alert {
            border-radius: 10px;
            border: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            animation: fadeIn 0.5s ease-in-out;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .alert-success {
            background: linear-gradient(45deg, #28a745, #5cb85c);
            color: white;
        }
        
        .alert-danger {
            background: linear-gradient(45deg, #dc3545, #ff6b6b);
            color: white;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            overflow: hidden;
        }
        
        .song-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        }
        
        .form-card {
            background: linear-gradient(135deg, rgba(255,255,255,0.9) 0%, rgba(255,255,255,0.8) 100%);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(65, 88, 208, 0.1);
        }
        
        .form-card h4 {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 20px;
            position: relative;
            display: inline-block;
        }
        
        .form-card h4::after {
            content: '';
            position: absolute;
            width: 50px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            left: 0;
            bottom: -8px;
        }
        
        .section-title {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 25px;
            position: relative;
            display: inline-block;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            width: 60px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            left: 0;
            bottom: -10px;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 3px rgba(65, 88, 208, 0.2);
            border-color: var(--primary-color);
        }
        
        .form-label {
            font-weight: 600;
            color: #555;
            margin-bottom: 8px;
        }
        
        .form-check-input {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }
        
        .btn-primary {
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border: none;
            border-radius: 30px;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }
        
        .song-card {
            border-radius: 15px;
            transition: all 0.3s;
            position: relative;
        }
        
        .song-card .card-title {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.2rem;
        }
        
        .song-card .card-text {
            line-height: 1.8;
        }
        
        .song-card .card-text strong {
            color: var(--secondary-color);
        }
        
        .song-indicator {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 1.5rem;
            opacity: 0.8;
            transition: all 0.3s;
        }
        
        .song-card:hover .song-indicator {
            transform: rotate(45deg);
        }
        
        .btn-action {
            border-radius: 30px;
            font-weight: 600;
            padding: 8px 16px;
            transition: all 0.3s ease;
        }
        
        .btn-warning {
            background: linear-gradient(45deg, #ffc107, #ffbb33);
            border: none;
            color: #212529;
            box-shadow: 0 4px 8px rgba(255, 193, 7, 0.3);
        }
        
        .btn-warning:hover {
            background: linear-gradient(45deg, #ffbb33, #ffc107);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(255, 193, 7, 0.4);
            color: #212529;
        }
        
        .btn-danger {
            background: linear-gradient(45deg, #dc3545, #ff4b5a);
            border: none;
            color: white;
            box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
        }
        
        .btn-danger:hover {
            background: linear-gradient(45deg, #ff4b5a, #dc3545);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(220, 53, 69, 0.4);
            color: white;
        }
        
        .badge-visible {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
        }
        
        .badge-visible.yes {
            background-color: #28a745;
            color: white;
        }
        
        .badge-visible.no {
            background-color: #dc3545;
            color: white;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .visibility-toggle {
            display: flex;
            align-items: center;
        }
        
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
            margin-right: 10px;
        }
        
        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 34px;
        }
        
        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        
        input:checked + .toggle-slider {
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }
        
        input:checked + .toggle-slider:before {
            transform: translateX(26px);
        }
        
        .empty-state {
            padding: 50px;
            text-align: center;
            font-style: italic;
            color: #6c757d;
        }
        
        .empty-icon {
            font-size: 3rem;
            color: #adb5bd;
            margin-bottom: 20px;
        }
        
        .filters {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }     
        
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fas fa-music me-2"></i>Music Library</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link" href="/admin/dashboard"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="login"><i class="fas fa-sign-in-alt me-1"></i> Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register"><i class="fas fa-user-plus me-1"></i> Sign Up</a></li>
                    <li class="nav-item ms-2"><a href="logout" class="btn btn-logout"><i class="fas fa-sign-out-alt me-1"></i> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-4">
        <!-- Header Section -->

        <!-- Display Messages -->
        <% if (request.getAttribute("message") != null) { %>
            <div class="alert alert-success alert-dismissible fade show">
                <i class="fas fa-check-circle me-2"></i><%= request.getAttribute("message") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger alert-dismissible fade show">
                <i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <!-- Add New Song Form -->
        <div class="card form-card p-4 mt-4 mb-5">
            <h4><i class="fas fa-plus-circle me-2"></i>Add New Song</h4>
            <form action="<%= request.getContextPath() %>/admin/songs/add" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Song Name</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-music"></i></span>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Singer</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-microphone-alt"></i></span>
                            <input type="text" class="form-control" name="singer" required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Music Director</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-user-tie"></i></span>
                            <input type="text" class="form-control" name="musicDirector" required>
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Release Date</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                            <input type="date" class="form-control" name="releaseDate" required>
                        </div>
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Album</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-compact-disc"></i></span>
                        <input type="text" class="form-control" name="album">
                    </div>
                </div>
                <div class="mb-4">
                    <label class="form-label d-block">Visibility:</label>
                    <div class="visibility-toggle">
                        <label class="toggle-switch">
                            <input type="checkbox" name="visible" value="true" checked>
                            <span class="toggle-slider"></span>
                        </label>
                        <input type="hidden" name="visible" value="false">
                        <span id="visibility-status">Visible to Users</span>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-plus me-2"></i>Add Song
                </button>
            </form>
        </div>

        <!-- Song List Section -->
        <div class="mt-5">
            <h4 class="section-title"><i class="fas fa-list-ul me-2"></i>Song Library</h4>
            <!-- Song Cards -->
            <div class="row row-cols-1 row-cols-md-3 g-4" id="songContainer">
                <%
                    List<SongDTO> songs = (List<SongDTO>) request.getAttribute("songs");
                    if (songs != null && !songs.isEmpty()) {
                        for (SongDTO song : songs) {
                %>
                <div class="col">
                    <div class="card song-card h-100 shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">
                                <%= song.getName() %>
                                <span class="song-indicator">
                                    <i class="fas fa-music text-primary"></i>
                                </span>
                            </h5>
                            <p class="card-text">
                                <i class="fas fa-microphone-alt me-2"></i><strong>Singer:</strong> <%= song.getSinger() %><br>
                                <i class="fas fa-user-tie me-2"></i><strong>Music Director:</strong> <%= song.getMusicDirector() %><br>
                                <i class="fas fa-compact-disc me-2"></i><strong>Album:</strong> <%= song.getAlbum() %><br>
                                <i class="fas fa-calendar-alt me-2"></i><strong>Release Date:</strong> <%= song.getReleaseDate() %><br>
                                <span class="badge badge-visible <%= song.isVisible() ? "yes" : "no" %>">
                                    <i class="fas <%= song.isVisible() ? "fa-eye" : "fa-eye-slash" %> me-1"></i>
                                    <%= song.isVisible() ? "Visible" : "Hidden" %>
                                </span>
                            </p>
                            <div class="d-flex justify-content-between mt-3">
                                <a href="<%= request.getContextPath() %>/admin/songs/edit/<%= song.getId() %>" class="btn btn-warning btn-action">
                                    <i class="fas fa-edit me-1"></i>Edit
                                </a>
                                <a href="<%= request.getContextPath() %>/admin/songs/delete/<%= song.getId() %>" class="btn btn-danger btn-action" 
                                   onclick="return confirm('Are you sure you want to delete this song?')">
                                    <i class="fas fa-trash-alt me-1"></i>Delete
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <div class="col-12 empty-state">
                    <div class="empty-icon">
                        <i class="fas fa-music-slash"></i>
                    </div>
                    <p>No songs available in your library</p>
                    <p>Add a new song using the form above</p>
                </div>
                <% } %>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Toggle visibility label
        document.querySelector('.toggle-switch input[type="checkbox"]').addEventListener('change', function() {
            document.getElementById('visibility-status').textContent = this.checked ? 'Visible to Users' : 'Hidden from Users';
        });
        
        // Auto-hide alerts after 5 seconds
        window.setTimeout(function() {
            document.querySelectorAll('.alert').forEach(alert => {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            });
        }, 5000);
    </script>
</body>
</html>`