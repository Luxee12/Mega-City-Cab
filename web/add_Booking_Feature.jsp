<%-- 
    Document   : addBooking
    Created on : Mar 13, 2025, 2:15:30 PM
    Author     : Luxee
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Cab Booking - Mega City Cab</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Book Your Cab</h2>

        <!-- Booking Form -->
        <form action="AddBookingServlet" method="POST">
            <div class="mb-3">
                <label for="destination" class="form-label">Destination</label>
                <input type="text" name="destination" class="form-control" id="destination" required>
            </div>

            <div class="mb-3">
                <label for="fare" class="form-label">Fare</label>
                <input type="number" name="fare" class="form-control" id="fare" required>
            </div>

            <button type="submit" class="btn btn-primary">Add Booking</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


