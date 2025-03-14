package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PricingDAO {

    public double getPriceByPassengerCount(int passengerCount) {
        String query = "SELECT price FROM pricing WHERE passenger_count = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, passengerCount);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
}