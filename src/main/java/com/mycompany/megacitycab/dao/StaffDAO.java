package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.model.StaffUser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class StaffDAO {
    
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
