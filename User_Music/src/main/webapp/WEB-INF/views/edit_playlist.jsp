<%@page import="com.wipro.musiclibrary.User_Music.dto.PlaylistDTO"%>
<%@page import="com.wipro.musiclibrary.User_Music.entity.Playlist"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Playlist - Your Music Library</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1E2330;
            --primary-dark: #151A24;
            --secondary-color: #FA7854;
            --accent-color: #4472A1;
            --light-bg: #E9F7F9;
            --text-dark: #333;
            --text-light: #fff;
            --border-radius: 25px;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-bg);
            color: var(--text-dark);
            line-height: 1.6;
            min-height: 100vh;
        }
        
        .header {
            background-color: var(--primary-color);
            padding: 20px 40px;
            color: var(--text-light);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .header h1 {
            display: flex;
            align-items: center;
            font-size: 1.8rem;
        }
        
        .header h1 i {
            margin-right: 12px;
            color: var(--secondary-color);
        }
        
        .header-buttons {
            display: flex;
            gap: 15px;
        }
        
        .container {
            max-width: 800px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        .search-bar {
            width: 100%;
            margin: 30px 0;
            position: relative;
        }
        
        .search-bar input {
            width: 100%;
            padding: 15px 20px 15px 50px;
            border: 1px solid #ddd;
            border-radius: 50px;
            font-size: 1rem;
            background-color: white;
        }
        
        .search-bar i {
            position: absolute;
            left: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: #888;
        }
        
        .card {
            background-color: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .card-header {
            background-color: var(--primary-color);
            color: white;
            padding: 20px;
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .card-header h2 {
            font-size: 1.8rem;
            margin: 0;
            display: flex;
            align-items: center;
        }
        
        .card-header h2 i {
            margin-right: 12px;
            color: var(--secondary-color);
        }
        
        .playlist-id {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 4px 12px;
            font-size: 0.9rem;
        }
        
        .card-body {
            padding: 30px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--text-dark);
        }
        
        .form-control {
            width: 100%;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 50px;
            font-size: 1rem;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--accent-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(68, 114, 161, 0.2);
        }
        
        .btn-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 12px 24px;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            font-size: 1rem;
            min-width: 120px;
        }
        
        .btn-primary {
            background-color: var(--secondary-color);
            color: var(--text-light);
        }
        
        .btn-primary:hover {
            background-color: #E56743;
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background-color: var(--accent-color);
            color: var(--text-light);
        }
        
        .btn-secondary:hover {
            background-color: #365D89;
            transform: translateY(-2px);
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .btn-back {
            background-color: var(--accent-color);
            color: var(--text-light);
            text-decoration: none;
            border-radius: 50px;
            padding: 10px 20px;
            display: inline-flex;
            align-items: center;
            font-weight: 500;
        }
        
        .btn-back:hover {
            background-color: #365D89;
        }
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                text-align: center;
                padding: 15px;
            }
            
            .header-buttons {
                margin-top: 15px;
            }
            
            .container {
                padding: 0 15px;
            }
            
            .card-body {
                padding: 20px;
            }
            
            .btn-container {
                flex-direction: column;
                gap: 15px;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1><i class="fas fa-headphones"></i> My Music Playlists</h1>
        <div class="header-buttons">
            <a href="/user/dashboard" class="btn btn-secondary">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
    </div>
    
    <div class="container">
        <%
            PlaylistDTO playlist = (PlaylistDTO) request.getAttribute("playlist");
        %>
        
        <div class="card">
            <div class="card-header">
                <h2><i class="fas fa-music"></i> Edit Playlist</h2>
                <span class="playlist-id">#<%= playlist.getId() %></span>
            </div>
            
            <div class="card-body">
                <form action="/user/playlist/update" method="post">
                    <input type="hidden" name="id" value="<%= playlist.getId() %>">
                    
                    <div class="form-group">
                        <label for="playlist-name">Playlist Name</label>
                        <input type="text" id="playlist-name" name="name" class="form-control" value="<%= playlist.getPlaylistName() %>" required autofocus>
                    </div>
                    
                    <div class="btn-container">
                        <a href="/user/playlist" class="btn btn-secondary">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>