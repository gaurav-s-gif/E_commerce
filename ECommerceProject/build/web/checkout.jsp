<%@ page import="java.sql.*, util.DBConnection" %>
<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect("login.jsp");
    }

    String productId = request.getParameter("productId");
    String removeId = request.getParameter("removeId");

    // add item to cart
    if (productId != null) {
        java.util.List<String> cart = (java.util.List<String>) session.getAttribute("cart");
        if (cart == null) cart = new java.util.ArrayList<String>();
        cart.add(productId);
        session.setAttribute("cart", cart);
    }

    // remove item from cart
    if (removeId != null) {
        java.util.List<String> cart = (java.util.List<String>) session.getAttribute("cart");
        if (cart != null) {
            cart.remove(removeId);
            session.setAttribute("cart", cart);
        }
    }

    // get cart
    java.util.List<String> cart = (java.util.List<String>) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #dce35b, #45b649);
            min-height: 100vh;
            padding-top: 50px;
        }
        .cart-container {
            max-width: 800px;
            margin: auto;
        }
    </style>
</head>
<body>
<div class="container cart-container">
    <div class="card shadow-lg">
        <div class="card-body">
            <h2 class="text-center mb-4">? Your Cart</h2>

            <%
            if (cart == null || cart.isEmpty()) {
            %>
                <div class="alert alert-info text-center">Your cart is empty.</div>
            <%
            } else {
                double total = 0.0;
            %>
                <table class="table table-bordered align-middle text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Product</th>
                            <th>Price (?)</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        for (String pid : cart) {
                            try (Connection conn = DBConnection.getConnection()) {
                                PreparedStatement ps = conn.prepareStatement("SELECT product_name, price FROM product WHERE product_id=?");
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
                            <td>
                                <a href="cart.jsp?removeId=<%= pid %>" class="btn btn-sm btn-danger">Remove</a>
                            </td>
                        </tr>
                    <%
                                }
                            } catch (Exception e) {
                    %>
                        <tr>
                            <td colspan="3">Error loading product with ID: <%= pid %></td>
                        </tr>
                    <%
                            }
                        }
                    %>
                        <tr class="fw-bold table-secondary">
                            <td>Total</td>
                            <td colspan="2">?<%= total %></td>
                        </tr>
                    </tbody>
                </table>

                <div class="text-center mt-3">
                    <a href="checkout.jsp" class="btn btn-success btn-lg me-3">Proceed to Checkout</a>
                    <a href="products.jsp" class="btn btn-primary btn-lg">Continue Shopping</a>
                </div>
            <%
            }
            %>
        </div>
    </div>
</div>
</body>
</html>
