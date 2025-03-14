package com.megacitycab.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.megacitycab.model.Customer;
import com.megacitycab.dao.CustomerDAO;

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve customer data from the form
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phone");

        // Create a new Customer object
        Customer newCustomer = new Customer(0, name, address, nic, phone);

        // Use the DAO class to insert the new customer into the database
        CustomerDAO customerDAO = new CustomerDAO();
        try {
            int customerId = customerDAO.addCustomer(newCustomer);

            // Redirect based on whether the insertion was successful
            if (customerId > 0) {
                response.sendRedirect("addCustomer.jsp?success=1");
            } else {
                response.sendRedirect("addCustomer.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>Error: Customer could not be added.</h3>");
        }
    }
}
