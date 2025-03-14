package com.megacitycab.servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.megacitycab.util.DatabaseConnection;

@WebServlet("/AddBookingServlet")
public class AddBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get booking details from the form
        String destination = request.getParameter("destination");
        double fare = Double.parseDouble(request.getParameter("fare"));

        // Retrieve the current user from the session
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");

        // SQL query to insert the new booking into the database
        String sql = "INSERT INTO bookings (customer_id, destination, fare) SELECT id, ?, ? FROM users WHERE username = ?";

        try (Connection con = DatabaseConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            // Set parameters for the SQL query
            ps.setString(1, destination);
            ps.setDouble(2, fare);
            ps.setString(3, username);

            // Execute the query to insert the new booking
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                // Redirect to the home page or a success page after successful booking
                response.sendRedirect("home.jsp");
            } else {
                // Redirect back to the add booking page if the booking failed
                response.sendRedirect("addBooking.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addBooking.jsp?error=2");  // Database or query issue
        }
    }
}
