package com.mycompany.megacitycab.test;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.auth.PasswordHasher;
import com.mycompany.megacitycab.dao.DriverDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CreateDriver {

    public static void main(String[] args) {
        
        //driver register info
        String firstName = "Driver";
        String lastName = "User";
        String email = "driver@megacitycab.com";
        String contactNumber = "0771234512";
        String homeAddress = "123, Colombo, Sri Lanka";
        String nic = "123456789v";
        String password = "123";
        String gender = "Male";
        String vehicleName = "Prius";
        String passengerCount = "4";
        String vehicleNumber = "AAA-1234";

        DriverDAO driverDAO = new DriverDAO();

        if (driverDAO.emailExists(email)) {
            System.out.println("Driver exists. Deleting the existing driver...");
            deleteDriverUser(email);
        }

        // pw hash
        String hashedPassword = PasswordHasher.hashPassword(password);
        System.out.println("Hashed Password: " + hashedPassword);

        if (driverDAO.registerDriver(firstName, lastName, email, contactNumber, homeAddress, nic, hashedPassword, gender, vehicleName, passengerCount, vehicleNumber)) {
            System.out.println("Driver created successfully!");
            System.out.println("Email: " + email);
            System.out.println("Password: " + password);
        } else {
            System.out.println("Failed to create driver.");
        }
    }

    private static void deleteDriverUser(String email) {
        String query = "DELETE FROM driver_users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Existing driver deleted successfully.");
            } else {
                System.out.println("Failed to delete existing driver.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}