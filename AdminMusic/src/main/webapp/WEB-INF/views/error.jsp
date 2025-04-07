<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container text-center mt-5">
        <h2 class="text-danger">Oops! Something went wrong.</h2>
        <p class="lead"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "An unexpected error occurred. Please try again later." %></p>
        <a href="<%= request.getContextPath() %>/admin/login" class="btn btn-primary">Go to Dashboard</a>
    </div>
</body>
</html>
