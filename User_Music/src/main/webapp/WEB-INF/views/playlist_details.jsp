<%@page import="com.wipro.musiclibrary.User_Music.dto.PlaylistDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wipro.musiclibrary.User_Music.entity.Song"%>
<%@page import="com.wipro.musiclibrary.User_Music.entity.Playlist"%>
<%@page import="com.wipro.musiclibrary.User_Music.dto.SongDTO"%>
<%@page import="java.util.List"%>

<%
    PlaylistDTO playlist = (PlaylistDTO) request.getAttribute("playlist");
	List<SongDTO> playlistSongs = (List<SongDTO>) request.getAttribute("playlistSongs");
    List<SongDTO> availableSongs = (List<SongDTO>) request.getAttribute("availableSongs");
%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Playlist Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/favicon.ico">
    <style>
:root {
    --primary-color: #283C59;
    --primary-light: #5173AC;
    --secondary-color: #FF7B61;
    --secondary-light: #FF9B86;
    --background-color: #E6F7F8;
    --card-bg: #FFFFFF;
    --text-dark: #283C59;
    --text-light: #FFFFFF;
    --text-muted: #617696;
    --border-radius: 12px;
    --box-shadow: 0 4px 12px rgba(40, 60, 89, 0.1);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: var(--background-color);
    color: var(--text-dark);
    line-height: 1.6;
    padding: 20px;
    min-height: 100vh;
}

.container {
    max-width: 850px;
    margin: 0 auto;
    padding: 20px;
}

.nav-links {
    display: flex;
    margin-bottom: 25px;
    gap: 20px;
}

.back-link {
    display: inline-flex;
    align-items: center;
    color: var(--text-light);
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
    padding: 10px 18px;
    border-radius: 30px;
    background: var(--primary-color);
}

.back-link:hover {
    background: var(--primary-light);
    transform: translateY(-2px);
}

.back-link i {
    margin-right: 8px;
}

.card {
    background-color: var(--card-bg);
    border-radius: var(--border-radius);
    box-shadow: var(--box-shadow);
    overflow: hidden;
    margin-bottom: 30px;
}

.card-header {
    background: var(--primary-color);
    color: white;
    padding: 24px;
    position: relative;
}

.card-header h2 {
    font-size: 1.8rem;
    margin: 0;
    font-weight: 600;
}

.card-body {
    padding: 30px;
}

.form-group {
    margin-bottom: 25px;
}

.form-group label {
    display: block;
    margin-bottom: 10px;
    font-weight: 600;
    color: var(--text-dark);
    font-size: 0.9rem;
}

.form-control {
    width: 100%;
    padding: 14px 18px;
    border: 1px solid #e0e0e0;
    border-radius: var(--border-radius);
    font-size: 1rem;
    transition: all 0.3s ease;
    background-color: #f9f9f9;
    color: var(--text-dark);
}

.form-control:focus {
    border-color: var(--primary-light);
    outline: none;
    box-shadow: 0 0 0 3px rgba(81, 115, 172, 0.2);
    background-color: var(--card-bg);
}

.btn-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 40px;
}

.btn {
    display: inline-flex;
    align-items: center;
    padding: 12px 24px;
    color: var(--text-light);
    text-decoration: none;
    border-radius: 30px;
    font-weight: 600;
    transition: all 0.3s ease;
    cursor: pointer;
    border: none;
    font-size: 1rem;
}

.btn:hover {
    transform: translateY(-2px);
}

.btn-primary {
    background-color: var(--primary-color);
}

.btn-primary:hover {
    background-color: var(--primary-light);
}

.btn-secondary {
    background-color: #e0e0e0;
    color: var(--text-dark);
}

.btn-secondary:hover {
    background-color: #d0d0d0;
}

.btn i {
    margin-right: 8px;
}

/* Song management styles */
.songs-section {
    margin-top: 30px;
}

.songs-section h3 {
    font-size: 1.4rem;
    margin-bottom: 18px;
    color: var(--text-dark);
    font-weight: 600;
}

.songs-list {
    max-height: 300px;
    overflow-y: auto;
    border: 1px solid #e0e0e0;
    border-radius: var(--border-radius);
    margin-bottom: 30px;
    background-color: var(--card-bg);
}

.song-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 15px 18px;
    border-bottom: 1px solid #f0f0f0;
    transition: background-color 0.2s ease;
}

.song-item:hover {
    background-color: #f9f9f9;
}

.song-item:last-child {
    border-bottom: none;
}

.song-info {
    display: flex;
    flex-direction: column;
}

.song-name {
    font-weight: 600;
    margin-bottom: 4px;
    color: var(--text-dark);
}

.song-singer {
    font-size: 0.9rem;
    color: var(--text-muted);
}

.music-controls {
    display: flex;
    gap: 10px;
    align-items: center;
}

.control-btn {
    background-color: #f0f0f0;
    color: var(--text-dark);
    border: none;
    border-radius: 50%;
    width: 36px;
    height: 36px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s ease;
}

.control-btn:hover {
    background-color: var(--primary-light);
    color: var(--text-light);
}

.control-btn.delete-btn {
    background-color: #fbe9e7;
    color: #e53935;
}

.control-btn.delete-btn:hover {
    background-color: #e53935;
    color: white;
}

/* Dropdown for song selection */
.add-song-form {
    margin-bottom: 30px;
}

.form-row {
    display: flex;
    gap: 15px;
    align-items: center;
}

select {
    flex: 1;
    padding: 14px 18px;
    border: 1px solid #e0e0e0;
    border-radius: var(--border-radius);
    font-size: 1rem;
    transition: all 0.3s ease;
    background-color: #f9f9f9;
    color: var(--text-dark);
    appearance: none;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23283C59' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-position: right 15px center;
    background-size: 16px;
    padding-right: 40px;
}

select:focus {
    border-color: var(--primary-light);
    outline: none;
    box-shadow: 0 0 0 3px rgba(81, 115, 172, 0.2);
    background-color: var(--card-bg);
}

.add-btn {
    display: inline-flex;
    align-items: center;
    padding: 12px 24px;
    background-color: var(--secondary-color);
    color: var(--text-light);
    border-radius: 30px;
    font-weight: 600;
    transition: all 0.3s ease;
    cursor: pointer;
    border: none;
    font-size: 1rem;
}

.add-btn:hover {
    background-color: var(--secondary-light);
    transform: translateY(-2px);
}

.add-btn i {
    margin-right: 8px;
}

.section-header {
    margin-bottom: 18px;
    color: var(--text-dark);
    font-size: 1.4rem;
    font-weight: 600;
}

/* Playlist header icon */
.playlist-header-icon {
    display: flex;
    align-items: center;
}

.playlist-header-icon i {
    margin-right: 12px;
    font-size: 1.5rem;
}

/* Custom scrollbar */
.songs-list::-webkit-scrollbar {
    width: 8px;
}

.songs-list::-webkit-scrollbar-track {
    background: #f0f0f0;
    border-radius: 10px;
}

.songs-list::-webkit-scrollbar-thumb {
    background: var(--primary-light);
    border-radius: 10px;
}

.songs-list::-webkit-scrollbar-thumb:hover {
    background: var(--primary-color);
}

@media (max-width: 768px) {
    .container {
        padding: 15px;
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
        justify-content: center;
    }
    
    .nav-links {
        flex-direction: column;
        gap: 10px;
    }
    
    .form-row {
        flex-direction: column;
        gap: 15px;
    }
    
    .add-btn {
        width: 100%;
        justify-content: center;
    }
    
    .song-item {
        flex-direction: column;
        align-items: flex-start;
    }
    
    .music-controls {
        margin-top: 15px;
        width: 100%;
        justify-content: flex-start;
    }
}
</style>
    
</head>
<body>
<div class="container">
    <div class="nav-links">
        <a href="/user/playlist" class="back-link"> <i class="fas fa-arrow-left"></i> Back to Playlists </a>
    </div>

    <div class="card">
        <div class="card-header">
            <div class="playlist-header-icon">
                <i class="fas fa-music"></i>
                <h2><%= playlist.getPlaylistName() %></h2>
            </div>
        </div>

        <div class="card-body">
            <div class="form-group">
                <label for="playlist-name">Playlist Name</label>
                <input type="text" id="playlist-name" class="form-control" value="<%= playlist.getPlaylistName() %>" readonly>
            </div>

            <div class="songs-section">
                <h3>Current Songs in your Playlist</h3>
                <div class="songs-list">
                    <% if (playlistSongs != null && !playlistSongs.isEmpty()) { %>
                        <% for (SongDTO song : playlistSongs) { %>
                            <div class="song-item">
                                <div class="song-info">
                                    <span class="song-name"><%= song.getName() %></span>
                                    <span class="song-singer"><%= song.getSinger() %></span>
                                </div>
                                <div class="music-controls">
                                    <a href="" class="control-btn" title="Play">
                                        <i class="fas fa-play"></i>
                                    </a>
                                    <a href="" class="control-btn" title="Shuffle">
                                        <i class="fas fa-random"></i>
                                    </a>
                                    <a href="" class="control-btn" title="Repeat">
                                        <i class="fas fa-redo"></i>
                                    </a>
                                    <a href="/user/playlist/<%= playlist.getId() %>/remove-song/<%= song.getId() %>" class="control-btn delete-btn" title="Remove">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </div>
                            </div>
                        <% } %>
                    <% } else { %>
                        <div class="song-item">
                            <div class="song-info">
                                <span class="song-name">No songs in this playlist</span>
                                <span class="song-singer">Add songs below</span>
                            </div>
                        </div>
                    <% } %>
                </div>

                <h3 class="section-header">Add Song to Playlist</h3>
                <div class="add-song-form">
                    <form action="/user/playlist/<%= playlist.getId() %>/add-song" method="post">
                        <div class="form-row">
                            <select name="songId" class="form-control">
                                <option value="">-- Select a Song --</option>
                                <% if (availableSongs != null && !availableSongs.isEmpty()) { %>
                                    <% for (SongDTO song : availableSongs) { %>
                                        <option value="<%= song.getId() %>"><%= song.getName() %> - <%= song.getSinger() %></option>
                                    <% } %>
                                <% } %>
                            </select>
                            <button type="submit" class="add-btn">
                                <i class="fas fa-plus"></i> Add Song
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="btn-container">
                <a href="/user/playlist" class="btn btn-secondary">
                    <i class="fas fa-times"></i> Cancel
                </a>
                <a href="/user/playlist" class="btn btn-primary">
                    <i class="fas fa-save"></i> Done
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>