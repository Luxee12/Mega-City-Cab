package com.megacitycab.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/megacitycab"; // Database URL
    private static final String DB_USER = "root";  // MySQL username
    private static final String DB_PASSWORD = "";  // MySQL password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve login credentials from the form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // SQL query to check if the user exists
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            // Set parameters for the SQL query
            ps.setString(1, username);
            ps.setString(2, password);

            // Execute query and check if the user exists
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                // User found, create session and redirect to home
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("home.jsp"); // Redirect to home page
            } else {
                // Invalid credentials, redirect back to login page with error
                response.sendRedirect("index.jsp?error=1");  // Error=1 means invalid username or password
            }
        } catch (SQLException e) {
            // Print the SQL exception and provide a meaningful message to the user
            e.printStackTrace();
            response.getWriter().println("<h3 style='color:red;'>Error: Could not authenticate user. Please try again.</h3>");
        }
    }
}
