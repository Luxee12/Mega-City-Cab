package com.megacitycab.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {

    // JDBC Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";  // MySQL username
    private static final String DB_PASSWORD = "";  // MySQL password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve data from the sign-up form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("signup.jsp?error=1"); // Passwords don't match
            return;
        }

        // SQL query to insert the new user into the database
        String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
        
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {

            // Set parameters for the SQL query
            ps.setString(1, username);
            ps.setString(2, password);  // Here, password is stored as plain text, but you should ideally hash it.

            // Execute the query to insert the new user
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Redirect to the login page after successful sign-up
                response.sendRedirect("index.jsp?signup=1");
            } else {
                // If insertion failed, redirect back to the sign-up page
                response.sendRedirect("signup.jsp?error=2");
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Print the full error message for debugging
            response.sendRedirect("signup.jsp?error=3"); // Database connection or query error
        }
    }
}
