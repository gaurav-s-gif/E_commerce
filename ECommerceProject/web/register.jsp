<%@ page import="java.sql.*, util.DBConnection" %>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String name = request.getParameter("fullName");
    String email = request.getParameter("email");
    String pass = request.getParameter("password");
    String phone = request.getParameter("phone");

    try (Connection con = DBConnection.getConnection()) {
        String sql = "INSERT INTO user(full_name, email, password, phone_no) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, pass);
        ps.setString(4, phone);

        int row = ps.executeUpdate();
        if (row > 0) {
            request.setAttribute("message", "success");
        } else {
            request.setAttribute("message", "failed");
        }
    } catch (Exception e) {
        request.setAttribute("error", e.getMessage());
    }
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #89f7fe, #66a6ff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }
        .register-box {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            width: 400px;
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-custom {
            background: #007bff;
            border: none;
            border-radius: 8px;
        }
        .btn-custom:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
<div class="register-box">
    <h3 class="text-center mb-4">Create an Account</h3>

    <% if ("success".equals(request.getAttribute("message"))) { %>
        <div class="alert alert-success text-center">
            ? Registration successful! <a href="login.jsp" class="alert-link">Login here</a>.
        </div>
    <% } else if ("failed".equals(request.getAttribute("message"))) { %>
        <div class="alert alert-danger text-center">
            ? Registration failed. Please try again.
        </div>
    <% } else if (request.getAttribute("error") != null) { %>
        <div class="alert alert-warning text-center">
            ? Error: <%= request.getAttribute("error") %>
        </div>
    <% } %>

    <form method="post">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="fullName" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Email Address</label>
            <input type="email" name="email" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phone" class="form-control">
        </div>
        <button type="submit" class="btn btn-custom w-100">Register</button>
    </form>

    <p class="text-center mt-3">Already have an account? <a href="login.jsp">Login</a></p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
