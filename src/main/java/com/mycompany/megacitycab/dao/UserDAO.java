package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.model.User;
import com.mycompany.megacitycab.auth.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

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
