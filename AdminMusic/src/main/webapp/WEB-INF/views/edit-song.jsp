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
            background-color: #f5f7fa;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            transition: 0.3s ease-in-out;
        }
        .page-header {
            margin-bottom: 20px;
            font-weight: bold;
            color: #5362e8;
            text-align: left;
            padding-bottom: 10px;
            display: flex;
            align-items: center;
        }
        .page-header:before {
            content: "+";
            display: inline-block;
            background-color: #5362e8;
            color: white;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            text-align: center;
            line-height: 26px;
            margin-right: 10px;
            font-size: 22px;
        }
        .form-label {
            font-weight: 600;
            color: #4a4a4a;
        }
        .form-control {
            border-radius: 4px;  
        }
        .form-control:focus {
            border-color: #5362e8;
            box-shadow: 0 0 8px rgba(83, 98, 232, 0.3);
        }
        .btn-group {
            margin-top: 20px;
        }
        .btn-primary {
            background: linear-gradient(90deg, #5362e8, #9f66ff);
            border: none;
            border-radius: 20px;
            padding: 8px 20px;
            transition: 0.3s;
        }
        .btn-primary:hover {
            opacity: 0.9;
            transform: translateY(-2px);
        }
        .btn-secondary {
            background: #e9ecef;
            color: #495057;
            border: none;
            border-radius: 20px;
            padding: 8px 20px;
            transition: 0.3s;
        }
        .btn-secondary:hover {
            background: #dee2e6;
        }
        .input-group-text {
            background-color: #f8f9fa;
            border-right: none;
        }
        .form-control.date {
            border-left: none;
        }
        .toggle-container {
            display: flex;
            align-items: center;
        }
        .toggle {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 30px;
            margin-right: 10px;
        }
        .toggle input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        .slider {
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
        .slider:before {
            position: absolute;
            content: "";
            height: 22px;
            width: 22px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        input:checked + .slider {
            background: linear-gradient(90deg, #5362e8, #9f66ff);
        }
        input:focus + .slider {
            box-shadow: 0 0 1px #5362e8;
        }
        input:checked + .slider:before {
            transform: translateX(30px);
        }
        .input-icon {
            position: relative;
        }
        .input-icon i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #adb5bd;
        }
        .input-field {
            padding-left: 40px;
        }
        .icon-container {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-right: none;
            border-radius: 4px 0 0 4px;
            width: 45px;
        }
        .with-icon {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
        }
    </style>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
                            <label for="songName" class="form-label">Song Name</label>
                            <div class="input-group">
                                <div class="icon-container">
                                    <i class="fas fa-music"></i>
                                </div>
                                <input type="text" id="songName" name="name" class="form-control with-icon" value="<%= song.getName() %>" required>
                                <div class="invalid-feedback">Please enter a song name.</div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="singer" class="form-label">Singer</label>
                            <div class="input-group">
                                <div class="icon-container">
                                    <i class="fas fa-microphone"></i>
                                </div>
                                <input type="text" id="singer" name="singer" class="form-control with-icon" value="<%= song.getSinger() %>" required>
                                <div class="invalid-feedback">Please enter a singer name.</div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="musicDirector" class="form-label">Music Director</label>
                            <div class="input-group">
                                <div class="icon-container">
                                    <i class="fas fa-user"></i>
                                </div>
                                <input type="text" id="musicDirector" name="musicDirector" class="form-control with-icon" value="<%= song.getMusicDirector() %>" required>
                                <div class="invalid-feedback">Please enter a music director name.</div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="releaseDate" class="form-label">Release Date</label>
                            <div class="input-group">
                                <div class="icon-container">
                                    <i class="fas fa-calendar"></i>
                                </div>
                                <input type="date" id="releaseDate" name="releaseDate" class="form-control with-icon" value="<%= song.getReleaseDate() %>" required>
                                <div class="invalid-feedback">Please select a release date.</div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="album" class="form-label">Album</label>
                            <div class="input-group">
                                <div class="icon-container">
                                    <i class="fas fa-compact-disc"></i>
                                </div>
                                <input type="text" id="album" name="album" class="form-control with-icon" value="<%= song.getAlbum() %>" required>
                                <div class="invalid-feedback">Please enter an album name.</div>
                            </div>
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
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i> Update Song
                            </button>
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