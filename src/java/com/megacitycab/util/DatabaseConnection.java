package com.megacitycab.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String DB_USER = "root";  // Your MySQL username
    private static final String DB_PASSWORD = "";  // Your MySQL password

    public static Connection getConnection() throws SQLException {
        try {
            // Ensure that the MySQL JDBC driver is loaded
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }
}
