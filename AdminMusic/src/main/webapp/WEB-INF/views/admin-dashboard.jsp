<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wipro.music.AdminMusic.entity.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark">
        <div class="container">
            <span class="navbar-brand">Music Library - Admin</span>
            <a href="logout" class="btn btn-danger">Logout</a>
        </div>
    </nav>
    <div class="container mt-5">
        <h2>Welcome, <%= admin.getName() %></h2>
        <hr>
        <a href="/admin/songs" class="btn btn-primary">Manage Songs</a>
    </div>
</body>
</html>
