package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.auth.PasswordHasher;
import com.mycompany.megacitycab.model.Driver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    
    public boolean authenticateDriver(String email, String password) {
        
        String hashedPassword = PasswordHasher.hashPassword(password);
        
        String query = "SELECT * FROM driver_users WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, hashedPassword);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public String getDriverFirstName(String email) {
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
    
    public boolean emailExists(String email) {
        String query = "SELECT * FROM driver_users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean registerDriver(String firstName, String lastName, String email, String contactNumber, String homeAddress, String nic, String password, String gender, String vehicleName, String passengerCount, String vehicleNumber) {
        if (emailExists(email)) {
            return false;
        }
        
        String hashedPassword = PasswordHasher.hashPassword(password);

        String query = "INSERT INTO driver_users (first_name, last_name, email, contact_number, home_address, nic, password, gender, vehicle_name, passenger_count, vehicle_number) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, contactNumber);
            stmt.setString(5, homeAddress);
            stmt.setString(6, nic);
            stmt.setString(7, hashedPassword);
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
    
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String query = "SELECT id, first_name, last_name, gender, email, home_address, nic, contact_number, vehicle_name, passenger_count, vehicle_number, created_at FROM driver_users";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String homeAddress = rs.getString("home_address");
                String nic = rs.getString("nic");
                String contactNumber = rs.getString("contact_number");
                String vehicleName = rs.getString("vehicle_name");
                String passengerCount = rs.getString("passenger_count");
                String vehicleNumber = rs.getString("vehicle_number");
                Timestamp createdAt = rs.getTimestamp("created_at");

                Driver driver = new Driver(id, firstName, lastName, gender, email, homeAddress, nic, contactNumber, vehicleName, passengerCount, vehicleNumber, createdAt);
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return drivers;
    }
    
    public List<Driver> getRecentDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String query = "SELECT id, first_name, last_name, created_at FROM driver_users ORDER BY created_at DESC LIMIT 10";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                Timestamp createdAt = rs.getTimestamp("created_at");

                Driver driver = new Driver(id, firstName, lastName, null, null, null, null, null, null, null, null, createdAt);
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return drivers;
    }
}

