package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.model.Driver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    
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

