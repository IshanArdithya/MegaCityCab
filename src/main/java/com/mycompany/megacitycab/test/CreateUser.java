package com.mycompany.megacitycab.test;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.auth.PasswordHasher;
import com.mycompany.megacitycab.dao.UserDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CreateUser {

    public static void main(String[] args) {
        
        //user register info
        String firstName = "User";
        String lastName = "User";
        String email = "user@megacitycab.com";
        String contactNumber = "1234567890";
        String homeAddress = "123 Main St, City";
        String nic = "123456789V";
        String password = "123";

        UserDAO userDAO = new UserDAO();
        
        if (userDAO.emailExists(email)) {
            System.out.println("User exists. Deleting the existing user...");
            deleteUser(email);
        }

        // pw hash
        String hashedPassword = PasswordHasher.hashPassword(password);
        System.out.println("Hashed Password: " + hashedPassword);

        if (userDAO.registerUser(firstName, lastName, email, contactNumber, homeAddress, nic, hashedPassword)) {
            System.out.println("User created successfully!");
            System.out.println("Email: " + email);
            System.out.println("Password: " + password);
        } else {
            System.out.println("Failed to create user.");
        }
    }
    
    // delete user if the email already exists.
    private static void deleteUser(String email) {
        String query = "DELETE FROM users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                System.out.println("Existing user deleted successfully.");
            } else {
                System.out.println("Failed to delete existing user.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}