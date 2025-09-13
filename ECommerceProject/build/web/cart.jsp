<%@ page import="java.sql.*, util.DBConnection" %>
<%
    // check if user is logged in
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect("login.jsp");
    }

    // add product to cart if productId is passed
    String productId = request.getParameter("productId");
    if (productId != null) {
        java.util.List<String> cart = (java.util.List<String>) session.getAttribute("cart");
        if (cart == null) {
            cart = new java.util.ArrayList<String>();
        }
        cart.add(productId);
        session.setAttribute("cart", cart);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <style>
        body {
            background: linear-gradient(135deg, #dce35b, #45b649);
            min-height: 100vh;
            padding-top: 60px;
        }
        .cart-container {
            max-width: 800px;
            margin: auto;
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

<div class="container cart-container animate__animated animate__fadeIn">
    <div class="card shadow-lg">
        <div class="card-body">
            <h2 class="text-center mb-4">? Your Cart</h2>

            <%
                java.util.List<String> cart = (java.util.List<String>) session.getAttribute("cart");

                if (cart == null || cart.isEmpty()) {
            %>
                <div class="alert alert-info text-center">Your cart is empty.</div>
            <%
                } else {
                    double total = 0.0;
            %>
                <table class="table table-bordered table-hover align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>Product</th>
                            <th>Price (?)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (String pid : cart) {
                                try (Connection conn = DBConnection.getConnection()) {
                                    PreparedStatement ps = conn.prepareStatement(
                                        "SELECT product_name, price FROM product WHERE product_id = ?"
                                    );
                                    ps.setInt(1, Integer.parseInt(pid));
                                    ResultSet rs = ps.executeQuery();

                                    if (rs.next()) {
                                        String pname = rs.getString("product_name");
                                        double price = rs.getDouble("price");
                                        total += price;
                        %>
                        <tr>
                            <td><%= pname %></td>
                            <td>?<%= price %></td>
                        </tr>
                        <%
                                    }
                                } catch (Exception e) {
                        %>
                        <tr>
                            <td colspan="2">Error loading product with ID: <%= pid %></td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        <tr class="table-secondary fw-bold">
                            <td>Total</td>
                            <td>?<%= total %></td>
                        </tr>
                    </tbody>
                </table>

                <div class="text-center">
                    <a href="checkout.jsp" class="btn btn-lg btn-success btn-custom">Proceed to Checkout</a>
                </div>
            <%
                }
            %>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
