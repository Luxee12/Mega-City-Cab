<%-- 
    Document   : home
    Created on : Mar 13, 2025, 2:18:07 PM
    Author     : Luxee
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html>
<head>
    <title>Home - Mega City Cab</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Welcome to Mega City Cab!</h2>
        <h4>Your one-stop solution for all transportation needs.</h4>

        <!-- Navigation buttons for logged-in users -->
        <div class="mt-3">
            <a href="addBooking.jsp" class="btn btn-primary">Cab Booking</a>
            <a href="viewBooking.jsp" class="btn btn-info">View Bookings</a>
            <a href="aboutUs.jsp" class="btn btn-secondary">About Us</a>
            <a href="car.jsp" class="btn btn-success">Car Details</a>
            <a href="logout.jsp" class="btn btn-danger">Logout</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

