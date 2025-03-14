<%-- 
    Document   : viewBooking
    Created on : Mar 13, 2025, 2:19:21 PM
    Author     : Luxee
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>View Bookings - Mega City Cab</title>
</head>
<body>
    <div class="container mt-5">
        <h2>Your Bookings</h2>

        <!-- Bookings Table -->
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Destination</th>
                    <th>Fare</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Example data, replace with actual data from your database -->
                <tr>
                    <td>1</td>
                    <td>Colombo</td>
                    <td>500</td>
                    <td><a href="bill.jsp?bookingId=1" class="btn btn-success">View Bill</a></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Kandy</td>
                    <td>600</td>
                    <td><a href="bill.jsp?bookingId=2" class="btn btn-success">View Bill</a></td>
                </tr>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

    <div class="container">
        <h2 class="text-center mt-4"><i class="fa-solid fa-list"></i> Booking Details</h2>

        <table class="table table-bordered table-striped mt-4">
            <thead>
                <tr>
                    <th><i class="fa-solid fa-hashtag"></i> Booking ID</th>
                    <th><i class="fa-solid fa-user"></i> Customer Name</th>
                    <th><i class="fa-solid fa-location-dot"></i> Destination</th>
                    <th><i class="fa-solid fa-dollar-sign"></i> Fare (LKR)</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacitycab", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT b.booking_id, c.name, b.destination, b.fare FROM bookings b JOIN customers c ON b.customer_id = c.id";
                        ResultSet rs = stmt.executeQuery(query);

                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("booking_id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td><%= rs.getString("destination") %></td>
                    <td><%= rs.getDouble("fare") %></td>
                </tr>
                <%
                        }
                        con.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>

        <div class="text-center mt-3">
            <a href="home.jsp" class="btn btn-success"><i class="fa-solid fa-house"></i> Home</a>
            <a href="addBooking.jsp" class="btn btn-primary"><i class="fa-solid fa-plus"></i> New Booking</a>
            <a href="logout.jsp" class="btn btn-danger"><i class="fa-solid fa-sign-out"></i> Logout</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
