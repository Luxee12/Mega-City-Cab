package com.megacitycab.dao;

import java.sql.*;
import com.megacitycab.model.Customer;

public class CustomerDAO {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    // Method to insert a new customer into the database
    public int addCustomer(Customer customer) throws SQLException {
        String query = "INSERT INTO customers (name, address, nic, phone) VALUES (?, ?, ?, ?)";
        try (Connection con = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getAddress());
            ps.setString(3, customer.getNic());
            ps.setString(4, customer.getPhone());

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    return rs.getInt(1); // Return the generated customer ID
                }
            }
        }
        return 0;
    }
}
