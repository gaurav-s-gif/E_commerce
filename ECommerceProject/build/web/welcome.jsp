<%
String userName = (String) session.getAttribute("userName");
if (userName == null) {
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
        }
        .navbar {
            border-radius: 0 0 10px 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        }
        .welcome-box {
            margin-top: 80px;
            text-align: center;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        .btn-custom {
            border-radius: 8px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">E-Commerce</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="products.jsp">Products</a></li>
        <li class="nav-item"><a class="nav-link" href="cart.jsp">My Cart</a></li>
        <li class="nav-item"><a class="nav-link" href="checkout.jsp">Checkout</a></li>
        <li class="nav-item"><a class="nav-link" href="admin.jsp">Admin</a></li>
        <li class="nav-item">
            <form action="logout.jsp" method="post" style="display:inline;">
                <button type="submit" class="btn btn-danger btn-sm">Logout</button>
            </form>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Welcome Box -->
<div class="welcome-box">
    <h2>Welcome, <%= userName %> ?</h2>
    <p class="lead">Glad to have you back! Explore products and manage your cart easily.</p>
    <div class="d-flex justify-content-center gap-3 mt-4">
        <a href="products.jsp" class="btn btn-primary btn-custom">Browse Products</a>
        <a href="cart.jsp" class="btn btn-success btn-custom">My Cart</a>
    </div>
</div>

</body>
</html>
