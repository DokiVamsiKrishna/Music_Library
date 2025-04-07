<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Playlist - Your Music Library</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            justify-content: center;
            align-items: center;
            text-align: center;
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
            text-decoration: none;
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
        
        .btn-danger {
            background-color: #dc3545;
            color: var(--text-light);
        }
        
        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-2px);
        }
        
        .btn i {
            margin-right: 8px;
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
            <a href="/user/playlist" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to Playlists
            </a>
        </div>
    </div>
    
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2><i class="fas fa-plus-circle"></i> Create New Playlist</h2>
            </div>
            
            <div class="card-body">
                <form action="save" method="post">
                    <div class="form-group">
                        <label for="name"><strong>Playlist Name:</strong></label>
                        <input type="text" class="form-control" id="name" name="name" 
                               placeholder="Enter playlist name" required autofocus>
                    </div>
                    
                    <div class="btn-container">
                        <button type="reset" class="btn btn-danger">
                            <i class="fas fa-times"></i> Clear
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Save
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Font Awesome is already included at the top -->
</body>
</html>