<%@ page import="java.sql.*, util.DBConnection" %>
<%
String successMsg = null;
String errorMsg = null;

if("POST".equalsIgnoreCase(request.getMethod())) {
    String pname = request.getParameter("pname");
    String price = request.getParameter("price");
    try (Connection con = DBConnection.getConnection()) {
        String sql = "INSERT INTO product(product_name, price) VALUES (?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, pname);
        ps.setDouble(2, Double.parseDouble(price));
        ps.executeUpdate();
        successMsg = "? Product Added Successfully!";
    } catch(Exception e) {
        errorMsg = "? Error: " + e.getMessage();
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel - Product Management</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            background: linear-gradient(135deg, #ffecd2, #fcb69f);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .admin-card {
            width: 100%;
            max-width: 500px;
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

<div class="card admin-card animate__animated animate__fadeInUp">
    <div class="card-body p-4">
        <h3 class="text-center mb-4">? Admin Panel</h3>
        <h5 class="text-center text-muted mb-3">Product Management</h5>

        <% if(successMsg != null) { %>
            <div class="alert alert-success text-center">
                <%= successMsg %>
            </div>
        <% } %>

        <% if(errorMsg != null) { %>
            <div class="alert alert-danger text-center">
                <%= errorMsg %>
            </div>
        <% } %>

        <form method="post">
            <div class="mb-3">
                <label for="pname" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="pname" name="pname" required>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Price (?)</label>
                <input type="number" class="form-control" id="price" name="price" required>
            </div>

            <button type="submit" class="btn btn-primary w-100 btn-custom">Add Product</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
