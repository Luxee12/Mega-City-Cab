<%-- 
    Document   : signup
    Created on : Mar 13, 2025, 7:51:04 PM
    Author     : Luxee
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sign Up - Mega City Cab</title>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Create a New Account</h2>

        <!-- Check if there is an error passed as query parameter -->
        <% 
    String error = request.getParameter("error");
    if (error != null && error.equals("1")) {
%>
    <div class="alert alert-danger">
        <strong>Error: Passwords do not match!</strong>
    </div>
<% } else if (error != null && error.equals("2")) { %>
    <div class="alert alert-danger">
        <strong>Error: Registration failed. Try again later.</strong>
    </div>
<% } else if (error != null && error.equals("3")) { %>
    <div class="alert alert-danger">
        <strong>Error: Database connection or query issue. Please try again.</strong>
    </div>
<% } %>


        <!-- Sign Up Form -->
        <form action="SignUpServlet" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" name="username" class="form-control" id="username" placeholder="Enter Username" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Enter Password" required>
            </div>

            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="Confirm Password" required>
            </div>

            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" name="name" class="form-control" id="name" placeholder="Enter Full Name" required>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="text" name="phone" class="form-control" id="phone" placeholder="Enter Phone Number" required>
            </div>

            <button type="submit" class="btn btn-primary">Sign Up</button>
        </form>

        <!-- Link to the login page -->
        <div class="mt-3">
            <a href="index.jsp" class="btn btn-secondary">Already have an account? Log In</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>




