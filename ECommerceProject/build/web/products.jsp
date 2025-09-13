<%@ page import="java.sql.*, util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            background: linear-gradient(135deg, #fdfbfb, #ebedee);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 40px;
        }
        .product-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 15px;
        }
        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }
        .price {
            font-size: 1.2rem;
            font-weight: bold;
            color: #28a745;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-5 animate__animated animate__fadeInDown"> Available Products</h2>
    <div class="row g-4">

    <%
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM product";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()) {
    %>
        <div class="col-md-4">
            <div class="card product-card animate__animated animate__zoomIn">
                <!-- Product Image Placeholder -->
                <img src="images/default-product.jpg" class="card-img-top" alt="Product Image">

                <div class="card-body text-center">
                    <h5 class="card-title"><%= rs.getString("product_name") %></h5>
                    <p class="card-text text-muted"><%= rs.getString("description") %></p>
                    <p class="price">?<%= rs.getDouble("price") %></p>
                    <p class="text-secondary">Stock: <%= rs.getInt("stock_quantity") %></p>
                    <a href="cart.jsp?productId=<%= rs.getInt("product_id") %>" class="btn btn-primary">Add to Cart</a>
                </div>
            </div>
        </div>
    <%
            }
        } catch(Exception e) {
    %>
        <div class="alert alert-danger text-center">Error: <%= e.getMessage() %></div>
    <%
        }
    %>

    </div>

    <div class="text-center mt-4">
        <a href="welcome.jsp" class="btn btn-outline-dark">Back to Home</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
