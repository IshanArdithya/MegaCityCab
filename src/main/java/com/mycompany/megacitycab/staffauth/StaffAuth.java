package com.mycompany.megacitycab.staffauth;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author IshanPC
 */
public class StaffAuth {
    public static boolean authenticateStaff(String email, String password) {
        String query = "SELECT * FROM staff_users WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
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
    
    public static String getRole(String email) {
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
}
