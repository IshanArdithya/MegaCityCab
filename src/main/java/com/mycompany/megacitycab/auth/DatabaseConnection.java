package com.mycompany.megacitycab.auth;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/megacitycab";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    private static Connection connection = null;

    private DatabaseConnection() {
    }

    static {
        setupConnection();
    }

    private static void setupConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Info: DB connection established successfully.");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error: Failed to initialize db connection: " + e.getMessage());
            throw new RuntimeException("DB connection error", e);
        }
    }

    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                System.out.println("Info: Reconnecting to the db..");
                setupConnection();
            }
        } catch (SQLException e) {
            System.err.println("Error: DB connection check failed: " + e.getMessage());
            throw new RuntimeException("Error retrieving db connection", e);
        }
        return connection;
    }

    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Info: DB connection closed successfully.");
            } catch (SQLException e) {
                System.err.println("Error: Error while closing db connection: " + e.getMessage());
            }
        }
    }

    public static void testConnection() {
        try (Connection conn = getConnection()) {
            if (conn != null && !conn.isClosed()) {
                System.out.println("Success: DB connection is active!");
            } else {
                System.out.println("Warning: DB connection is not active.");
            }
        } catch (SQLException e) {
            System.err.println("Error: DB connection test failed: " + e.getMessage());
        }
    }
}
