<%@ page import="java.sql.*, util.DBConnection" %>
<%
if("POST".equalsIgnoreCase(request.getMethod())) {
    String email = request.getParameter("email");
    String pass = request.getParameter("password");

    try (Connection conn = DBConnection.getConnection()) {
        String sql = "SELECT * FROM user WHERE email=? AND password=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            session.setAttribute("userName", rs.getString("full_name"));
            response.sendRedirect("welcome.jsp");
        } else {
            request.setAttribute("errorMsg", "Invalid email or password!");
        }
    } catch(Exception e) {
        request.setAttribute("errorMsg", "Error: " + e.getMessage());
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            background: linear-gradient(135deg, #667eea, #764ba2);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-card {
            width: 100%;
            max-width: 400px;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
        }
        .btn-custom {
            transition: all 0.3s ease;
        }
        .btn-custom:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<div class="card login-card animate__animated animate__fadeInDown">
    <div class="card-body p-4">
        <h3 class="text-center mb-4">Login</h3>

        <% if(request.getAttribute("errorMsg") != null) { %>
            <div class="alert alert-danger text-center">
                <%= request.getAttribute("errorMsg") %>
            </div>
        <% } %>

        <form method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>

            <button type="submit" class="btn btn-primary w-100 btn-custom">Login</button>
        </form>

        <p class="text-center mt-3">Don?t have an account? <a href="register.jsp">Register</a></p>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
