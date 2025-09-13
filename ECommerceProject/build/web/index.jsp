<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>E-Commerce Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate.css for animations -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        .hero {
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
        }
        .hero h2 {
            font-size: 3rem;
            font-weight: bold;
        }
        .btn-custom {
            transition: transform 0.3s ease, background-color 0.3s ease;
        }
        .btn-custom:hover {
            transform: scale(1.1);
            background-color: #ff9800 !important;
            color: white;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="index.jsp">MyShop</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        <li class="nav-item"><a class="nav-link" href="products.jsp">Products</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<div class="hero text-center">
    <h2 class="animate__animated animate__fadeInDown">Welcome to My E-Commerce Site</h2>
    <p class="animate__animated animate__fadeInUp animate__delay-1s">Your one-stop shop for electronics & gaming gear</p>
    
    <div class="mt-4">
        <a href="products.jsp" class="btn btn-lg btn-primary btn-custom me-3 animate__animated animate__bounceInLeft">Shop Now</a>
        <a href="register.jsp" class="btn btn-lg btn-success btn-custom animate__animated animate__bounceInRight">Join Us</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
