package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.auth.PasswordHasher;
import com.mycompany.megacitycab.model.StaffUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {

    public boolean authenticateStaff(String email, String password) {
        
        String hashedPassword = PasswordHasher.hashPassword(password);
        
        String query = "SELECT * FROM staff_users WHERE email = ? AND password = ?";
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

    public String getStaffFirstName(String email) {
        String query = "SELECT first_name FROM staff_users WHERE email = ?";
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

    public String getStaffRole(String email) {
        String query = "SELECT role FROM staff_users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getString("role");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean emailExists(String email) {
        String query = "SELECT * FROM staff_users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean registerStaff(String firstName, String lastName, String email, String role, String password) {
        if (emailExists(email)) {
            return false;
        }
        
        String hashedPassword = PasswordHasher.hashPassword(password);

        String query = "INSERT INTO staff_users (first_name, last_name, email, role, password) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, role);
            stmt.setString(5, hashedPassword);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<StaffUser> getAllStaff() {
        List<StaffUser> staffusers = new ArrayList<>();
        String query = "SELECT id, first_name, last_name, email, role, created_at FROM staff_users";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String role = rs.getString("role");
                Timestamp createdAt = rs.getTimestamp("created_at");

                StaffUser staffuser = new StaffUser(id, firstName, lastName, email, role, createdAt);
                staffusers.add(staffuser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staffusers;
    }

    public List<StaffUser> getRecentStaff() {
        List<StaffUser> staffusers = new ArrayList<>();
        String query = "SELECT id, first_name, last_name, created_at FROM staff_users ORDER BY created_at DESC LIMIT 10";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                Timestamp createdAt = rs.getTimestamp("created_at");

                StaffUser staffuser = new StaffUser(id, firstName, lastName, null, null, createdAt);
                staffusers.add(staffuser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return staffusers;
    }
}
