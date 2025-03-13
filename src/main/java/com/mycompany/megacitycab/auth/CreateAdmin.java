package com.mycompany.megacitycab.auth;

import com.mycompany.megacitycab.dao.StaffDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CreateAdmin {

    public static void main(String[] args) {
        String firstName = "Admin";
        String lastName = "User";
        String email = "admin@megacitycab.com";
        String password = "123";
        String role = "Admin";

        StaffDAO staffDAO = new StaffDAO();

        if (staffDAO.emailExists(email)) {
            System.out.println("Admin exists. Deleting the existing admin...");
            deleteAdminUser(email);
        }
        
        String hashedPassword = PasswordHasher.hashPassword(password);
            System.out.println("Hashed Password: " + hashedPassword);

        

        if (staffDAO.registerStaff(firstName, lastName, email, role, password)) {
            System.out.println("Admin created successfully!");
            System.out.println("Email: " + email);
            System.out.println("Password: " + hashedPassword);
        } else {
            System.out.println("Failed to create admin.");
        }
    }

    private static void deleteAdminUser(String email) {
        String query = "DELETE FROM staff_users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Existing admin deleted successfully.");
            } else {
                System.out.println("Failed to delete existing admin.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}