package com.megacitycab.dao;

import java.sql.*;
import com.megacitycab.model.Booking;

public class BookingDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public int addBooking(Booking booking) throws SQLException {
        String query = "INSERT INTO bookings (customer_id, destination, fare) VALUES (?, ?, ?)";
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, booking.getCustomerId());
            ps.setString(2, booking.getDestination());
            ps.setDouble(3, booking.getFare());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }
}
