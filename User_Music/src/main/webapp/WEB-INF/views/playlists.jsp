<%@page import="com.wipro.musiclibrary.User_Music.entity.Playlist"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Music Playlists</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3D5A80;
            --secondary-color: #98C1D9;
            --accent-color: #EE6C4D;
            --dark-bg: #293241;
            --light-bg: #E0FBFC;
        }
        
        body {
            font-family: 'Poppins', 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, var(--light-bg) 0%, #f0f8ff 100%);
            color: #333;
            min-height: 100vh;
        }
        
        .container {
            max-width: 1100px;
            margin: 40px auto;
            background-color: white;
            padding: 0;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            overflow: hidden;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 25px 30px;
            background-color: var(--dark-bg);
            color: white;
            border-bottom: none;
        }
        
        h2 {
            color: white;
            margin: 0;
            font-weight: 700;
            font-size: 1.6rem;
            display: flex;
            align-items: center;
        }
        
        h2 i {
            margin-right: 12px;
            color: var(--accent-color);
        }
        
        .content-area {
            padding: 30px;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 50px;
            transition: all 0.3s ease;
            font-weight: 600;
            border: none;
            margin-left: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .home-btn {
            background-color: var(--primary-color);
            color: white;
        }
        
        .home-btn:hover {
            background-color: #34506f;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(61, 90, 128, 0.25);
        }
        
        .create-btn {
            background-color: var(--accent-color);
            color: white;
        }
        
        .create-btn:hover {
            background-color: #d55c3e;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(238, 108, 77, 0.3);
        }
        
        .btn-group {
            display: flex;
            align-items: center;
        }
        
        .search-container {
            margin-bottom: 25px;
            position: relative;
        }
        
        .search-box {
            padding: 14px 20px;
            border: 2px solid var(--secondary-color);
            border-radius: 50px;
            width: 100%;
            font-size: 0.95rem;
            box-shadow: 0 4px 15px rgba(152, 193, 217, 0.15);
            padding-left: 45px;
            transition: all 0.3s ease;
        }
        
        .search-box:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 4px 20px rgba(61, 90, 128, 0.2);
        }
        
        .search-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
        }
        
        .playlist-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 25px;
        }
        
        .playlist-card {
            background-color: white;
            border-radius: 16px;
            padding: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.05);
            border-top: 4px solid var(--primary-color);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .playlist-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(152, 193, 217, 0.05) 0%, rgba(224, 251, 252, 0.15) 100%);
            z-index: 0;
        }
        
        .playlist-card > * {
            position: relative;
            z-index: 1;
        }
        
        .playlist-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(61, 90, 128, 0.1);
        }
        
        .playlist-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 12px;
            border-bottom: 1px solid rgba(152, 193, 217, 0.3);
        }
        
        .playlist-name {
            font-weight: bold;
            font-size: 18px;
            color: var(--primary-color);
            display: flex;
            align-items: center;
        }
        
        .playlist-name::before {
            content: '\f001';
            font-family: 'Font Awesome 6 Free';
            margin-right: 10px;
            color: var(--accent-color);
            font-size: 16px;
        }
        
        .playlist-id {
            color: #7f8c8d;
            font-size: 14px;
        }
        
        .playlist-actions {
            display: flex;
            justify-content: flex-start;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 15px;
        }
        
        .playlist-actions a {
            padding: 8px 12px;
            color: white;
            text-decoration: none;
            font-size: 14px;
            display: inline-flex;
            align-items: center;
            border-radius: 8px;
            transition: all 0.2s ease;
            font-weight: 500;
        }
        
        .playlist-actions a i {
            margin-right: 6px;
        }
        
        .view-btn {
            background-color: var(--primary-color);
        }
        
        .view-btn:hover {
            background-color: #34506f;
        }
        
        .edit-btn {
            background-color: var(--secondary-color);
            color: var(--dark-bg) !important;
        }
        
        .edit-btn:hover {
            background-color: #81b7d4;
        }
        
        .delete-btn {
            background-color: var(--accent-color);
        }
        
        .delete-btn:hover {
            background-color: #d55c3e;
        }
        
        .empty-state {
            text-align: center;
            padding: 60px 30px;
            background-color: rgba(224, 251, 252, 0.4);
            border-radius: 16px;
            color: var(--primary-color);
        }
        
        .empty-state i {
            font-size: 60px;
            color: var(--secondary-color);
            margin-bottom: 15px;
            opacity: 0.8;
        }
        
        .empty-state p {
            margin: 8px 0;
            font-size: 1.1rem;
        }
        
        .empty-state p:last-child {
            color: var(--accent-color);
            font-weight: 500;
        }
        
        @media (max-width: 768px) {
            .container {
                margin: 20px;
                width: auto;
            }
            
            .playlist-grid {
                grid-template-columns: 1fr;
            }
            
            .header {
                flex-direction: column;
                align-items: flex-start;
                padding: 20px;
            }
            
            .btn-group {
                margin-top: 15px;
                width: 100%;
                justify-content: space-between;
            }
            
            .btn {
                margin-top: 5px;
                margin-left: 0;
                padding: 10px 15px;
                font-size: 0.9rem;
                width: 48%;
            }
            
            .content-area {
                padding: 20px;
            }
            
        }
    </style>
</head>
<body>	
    <div class="container">
        <div class="header">
            <h2><i class="fas fa-headphones-alt"></i> My Music Playlists</h2>
            <div class="btn-group">
                <a href="/user/dashboard" class="btn home-btn"><i class="fas fa-home"></i> Back to Home</a>
                <a href="playlist/add" class="btn create-btn"><i class="fas fa-plus"></i> Create New Playlist</a>
            </div>
        </div>
        
        <div class="content-area">
            <div class="search-container">
                <i class="fas fa-search search-icon"></i>
                <input type="text" id="searchBox" class="search-box" placeholder="Search your playlists..." onkeyup="searchPlaylists()">
            </div>
            
            <div class="playlist-grid" id="playlistContainer">
                <%
                    List<Playlist> playlists = (List<Playlist>) request.getAttribute("playlists");
                    if (playlists != null && !playlists.isEmpty()) {
                        for (Playlist playlist : playlists) {
                %>
                    <div class="playlist-card">
                        <div class="playlist-header">
                            <span class="playlist-name"><%= playlist.getPlaylistName() %></span>
                        </div>
                        <div class="playlist-actions">
                            <a href="playlist/<%= playlist.getId() %>" class="view-btn"><i class="fas fa-eye"></i> View</a>
                            <a href="playlist/edit/<%= playlist.getId() %>" class="edit-btn"><i class="fas fa-edit"></i> Edit</a>
                            <a href="javascript:void(0)" onclick="confirmDelete('<%= playlist.getId() %>', '<%= playlist.getPlaylistName() %>')" class="delete-btn"><i class="fas fa-trash"></i> Delete</a>
                        </div>
                    </div>
                <%
                        }
                    } else {
                %>
                    <div class="empty-state">
                        <i class="fas fa-compact-disc"></i>
                        <p>You don't have any playlists yet.</p>
                        <p>Create your first playlist to get started!</p>
                    </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <script>
        function confirmDelete(playlistId, playlistName) {
            if (confirm('Are you sure you want to delete the playlist "' + playlistName + '"?')) {
                window.location.href = 'playlist/delete/' + playlistId;
            }
        }
        
        function searchPlaylists() {
            const searchTerm = document.getElementById('searchBox').value.toLowerCase();
            const cards = document.querySelectorAll('.playlist-card');
            
            cards.forEach(card => {
                const playlistName = card.querySelector('.playlist-name').textContent.toLowerCase();
                if (playlistName.includes(searchTerm)) {
                    card.style.display = '';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>