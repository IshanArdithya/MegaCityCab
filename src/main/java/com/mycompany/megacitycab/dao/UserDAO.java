package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.model.User;
import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.auth.PasswordHasher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public boolean authenticateUser(String email, String password) {
        
        String hashedPassword = PasswordHasher.hashPassword(password);
        
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
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

    public User getUserDetails(String email) {
        String query = "SELECT first_name, last_name, contact_number FROM users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                        0,
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        email,
                        rs.getString("contact_number"),
                        null,
                        null,
                        null
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean emailExists(String email) {
        String query = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean registerUser(String firstName, String lastName, String email, String contactNumber, String homeAddress, String nic, String password) {
        if (emailExists(email)) {
            return false;
        }
        
        String hashedPassword = PasswordHasher.hashPassword(password);

        String query = "INSERT INTO users (first_name, last_name, email, contact_number, home_address, nic, password, is_verified) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, contactNumber);
            stmt.setString(5, homeAddress);
            stmt.setString(6, nic);
            stmt.setString(7, hashedPassword);
            stmt.setBoolean(8, false);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT id, first_name, last_name, email, created_at FROM users";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                Timestamp createdAt = rs.getTimestamp("created_at");

                User user = new User(id, firstName, lastName, email, null, null, null, createdAt);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public List<User> getRecentUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT id, first_name, last_name, created_at FROM users ORDER BY created_at DESC LIMIT 10";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                Timestamp createdAt = rs.getTimestamp("created_at");

                User user = new User(id, firstName, lastName, null, null, null, null, createdAt);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public User getUserByEmail(String email) {
        String query = "SELECT id, first_name, last_name, email, contact_number, home_address, nic, created_at FROM users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getString("email"),
                        rs.getString("contact_number"),
                        rs.getString("home_address"),
                        rs.getString("nic"),
                        rs.getTimestamp("created_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getBookingCountByUserId(int userId) {
        String query = "SELECT COUNT(*) AS booking_count FROM bookings WHERE user_id = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("booking_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getReviewsCountByUserId(int userId) {
        String query = "SELECT COUNT(*) AS reviews_count FROM reviews WHERE user_id = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("reviews_count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

}
