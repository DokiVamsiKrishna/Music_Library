
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="com.wipro.music.AdminMusic.dto.SongDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Song</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: 0.3s ease-in-out;
        }
        .form-container:hover {
            transform: scale(1.02);
        }
        .page-header {
            margin-bottom: 20px;
            font-weight: bold;
            color: #2c3e50;
            text-align: center;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
        }
        .form-label {
            font-weight: 600;
            color: #34495e;
        }
        .form-control:focus {
            border-color: #2980b9;
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.3);
        }
        .btn-group {
            margin-top: 20px;
        }
        .btn-primary {
            background: #3498db;
            border-color: #2980b9;
            transition: 0.3s;
        }
        .btn-primary:hover {
            background: #2980b9;
            border-color: #2471a3;
        }
        .btn-secondary {
            transition: 0.3s;
        }
        .btn-secondary:hover {
            background: #7f8c8d;
            border-color: #707b7c;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
                <div class="form-container">
                    <h2 class="page-header">Edit Song</h2>
                    
                    <% String error = request.getParameter("error"); %>
                    <% if (error != null && !error.isEmpty()) { %>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <%= error %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    <% } %>
                    
                    <% SongDTO song = (SongDTO) request.getAttribute("song"); %>
                    
                    <form action="<%= request.getContextPath() %>/admin/songs/savesong/<%= song.getId() %>" method="post" class="needs-validation" novalidate>
                        <input type="hidden" name="id" value="<%= song.getId() %>">
                        
                        <div class="mb-3">
                            <label for="songName" class="form-label">Song Name:</label>
                            <input type="text" id="songName" name="songName" class="form-control" value="<%= song.getName() %>" required>
                            <div class="invalid-feedback">Please enter a song name.</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="singer" class="form-label">Singer:</label>
                            <input type="text" id="singer" name="singerName" class="form-control" value="<%= song.getSinger() %>" required>
                            <div class="invalid-feedback">Please enter a singer name.</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="musicDirector" class="form-label">Music Director:</label>
                            <input type="text" id="musicDirector" name="musicDirector" class="form-control" value="<%= song.getMusicDirector() %>" required>
                            <div class="invalid-feedback">Please enter a music director name.</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="releaseDate" class="form-label">Release Date:</label>
                            <input type="date" id="releaseDate" name="releaseDate" class="form-control" value="<%= song.getReleaseDate() %>" required>
                            <div class="invalid-feedback">Please select a release date.</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="album" class="form-label">Album:</label>
                            <input type="text" id="album" name="album" class="form-control" value="<%= song.getAlbum() %>" required>
                            <div class="invalid-feedback">Please enter an album name.</div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="isVisible" class="form-label">Visible to Users:</label>
                            <select id="isVisible" name="Visible" class="form-select">
                                <option value="true" <%= song.isVisible() ? "selected" : "" %>>Yes</option>
                                <option value="false" <%= !song.isVisible() ? "selected" : "" %>>No</option>
                            </select>
                        </div>
                        
                        <div class="d-grid gap-2 d-md-flex justify-content-md-end btn-group">
                            <a href="<%= request.getContextPath() %>/admin/songs" class="btn btn-secondary">Cancel</a>
                            <button type="submit" class="btn btn-primary">Update Song</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Form validation script -->
    <script>
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })()
    </script>
</body>
</html>
