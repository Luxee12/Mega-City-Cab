<%-- 
    Document   : about
    Created on : Mar 13, 2025, 9:31:48 PM
    Author     : Luxee
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>About Us - Mega City Cab</title>
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

        /* Heading Styles */
        h2 {
            color: #333;
        }

        /* Button Styles */
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

        /* Card-like container */
        .card {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>About Us</h2>
        <p>We are Mega City Cab, providing safe and affordable transportation to various locations. Our mission is to make traveling around the city convenient and efficient.</p>

        <!-- Add Button -->
        <button class="btn btn-info" onclick="alert('Add Button Clicked!')">Add Button</button>

        <a href="home.jsp" class="btn btn-primary">Back to Home</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


