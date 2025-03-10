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

                User user = new User(id, firstName, lastName, email, createdAt);
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

                User user = new User(id, firstName, lastName, null, createdAt);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }
}
