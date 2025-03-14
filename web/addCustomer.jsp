<%-- 
    Document   : addCustomer
    Created on : Mar 13, 2025, 3:58:38 PM
    Author     : Luxee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer - Mega City Cab</title>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Add New Customer</h2>
        
        <!-- Display success or error messages -->
        <div>
            <%
                String success = request.getParameter("success");
                if (success != null && success.equals("1")) {
            %>
                <div class="alert alert-success">Customer added successfully!</div>
            <% } %>
            
            <%
                String error = request.getParameter("error");
                if (error != null && error.equals("1")) {
            %>
                <div class="alert alert-danger">Error: Customer could not be added.</div>
            <% } %>
        </div>
        
        <!-- Customer Form -->
        <form action="AddCustomerServlet" method="POST">
            <div class="mb-3">
                <label for="name" class="form-label">Customer Name</label>
                <input type="text" name="name" class="form-control" id="name" placeholder="Enter customer name" required>
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <input type="text" name="address" class="form-control" id="address" placeholder="Enter address" required>
            </div>

            <div class="mb-3">
                <label for="nic" class="form-label">NIC</label>
                <input type="text" name="nic" class="form-control" id="nic" placeholder="Enter NIC" required>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Phone Number</label>
                <input type="text" name="phone" class="form-control" id="phone" placeholder="Enter phone number" required>
            </div>

            <button type="submit" class="btn btn-primary">Add Customer</button>
            <a href="viewCustomer.jsp" class="btn btn-secondary">View Customers</a>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
