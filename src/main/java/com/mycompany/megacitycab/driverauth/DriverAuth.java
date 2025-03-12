package com.mycompany.megacitycab.driverauth;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DriverAuth {

    public static boolean authenticateDriver(String email, String password) {
        String query = "SELECT * FROM driver_users WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String getFirstName(String email) {
        String query = "SELECT first_name FROM driver_users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("first_name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static boolean emailExists(String email) {
        String query = "SELECT * FROM driver_users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean registerDriver(String firstName, String lastName, String email, String contactNumber, String homeAddress, String nic, String password, String gender, String vehicleName, String passengerCount, String vehicleNumber) {
        String query = "INSERT INTO driver_users (first_name, last_name, email, contact_number, home_address, nic, password, gender, vehicle_name, passenger_count, vehicle_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, contactNumber);
            stmt.setString(5, homeAddress);
            stmt.setString(6, nic);
            stmt.setString(7, password);
            stmt.setString(8, gender);
            stmt.setString(9, vehicleName);
            stmt.setString(10, passengerCount);
            stmt.setString(11, vehicleNumber);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
