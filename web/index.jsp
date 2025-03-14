<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<html>
<head>
    <title>Mega City Cab - Login</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        /* Container for the content */
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Header Styles */
        h2, h4 {
            color: #333;
        }

        /* Buttons */
        .btn {
            margin: 10px 0;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-info {
            background-color: #17a2b8;
            color: white;
        }

        .btn-info:hover {
            background-color: #117a8b;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .btn-success {
            background-color: #28a745;
            color: white;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        /* Form Styles */
        .form-label {
            font-size: 18px;
            color: #333;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Error Message */
        .text-danger {
            font-size: 14px;
            color: red;
        }

        /* Card-like container */
        .card {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        /* Link Styling */
        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Responsive Design for Smaller Screens */
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Welcome to Mega City Cab</h2>

        <!-- Check if the user is already logged in -->
        <%
            if (session != null && session.getAttribute("username") != null) {
        %>
            <!-- If the user is logged in, show welcome message and navigation buttons -->
            <h4>Welcome, <%= session.getAttribute("username") %>!</h4>

            <!-- Navigation buttons for logged-in users -->
            <div class="mt-3">
                <a href="home.jsp" class="btn btn-primary">Home</a> <!-- Home Button -->
                <a href="addBooking.jsp" class="btn btn-info">Cab Booking</a> <!-- Add Booking Button -->
                <a href="aboutUs.jsp" class="btn btn-secondary">About Us</a> <!-- About Us Button -->
                <a href="car.jsp" class="btn btn-success">Car Details</a> <!-- Car Details Button -->
                <a href="logout.jsp" class="btn btn-danger">Logout</a> <!-- Logout Button -->
            </div>

        <%
            } else {
        %>

        <!-- Login Form for users not logged in -->
        <form action="LoginServlet" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" name="username" class="form-control" id="username" placeholder="Enter Username" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Enter Password" required>
            </div>

            <button type="submit" class="btn btn-primary">Login</button>

            <% 
                // Show error message if login fails
                String error = request.getParameter("error");
                if (error != null && error.equals("1")) {
            %>
                <div class="mt-3 text-danger">
                    <strong>Error: Invalid Username or Password.</strong>
                </div>
            <% } %>
        </form>

        <div class="mt-4">
            <!-- Link to the sign-up page -->
            <a href="signup.jsp" class="btn btn-secondary">Create a New Account</a>
        </div>

        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
