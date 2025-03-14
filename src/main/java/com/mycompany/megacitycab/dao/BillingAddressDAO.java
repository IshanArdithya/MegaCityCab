package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.model.BillingAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BillingAddressDAO {

    public boolean saveBillingAddress(int bookingId, String firstName, String lastName, String address1, String address2, String city, String phoneNumber, String email) {
        String query = "INSERT INTO billing_addresses (booking_id, first_name, last_name, address1, address2, city, phone_number, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, bookingId);
            stmt.setString(2, firstName);
            stmt.setString(3, lastName);
            stmt.setString(4, address1);
            stmt.setString(5, address2);
            stmt.setString(6, city);
            stmt.setString(7, phoneNumber);
            stmt.setString(8, email);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public BillingAddress getBillingAddressByBookingId(int bookingId) {
    String query = "SELECT * FROM billing_addresses WHERE booking_id = ?";
    try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
        stmt.setInt(1, bookingId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return new BillingAddress(
                rs.getInt("id"),
                rs.getInt("booking_id"),
                rs.getString("first_name"),
                rs.getString("last_name"),
                rs.getString("address1"),
                rs.getString("address2"),
                rs.getString("city"),
                rs.getString("phone_number"),
                rs.getString("email")
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
}