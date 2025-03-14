package com.mycompany.megacitycab.dao;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import com.mycompany.megacitycab.model.Booking;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    public boolean createBooking(int userId, String pickupLocation, String dropoffLocation, String date, String time, int driverId, double totalPrice) {
        String query = "INSERT INTO bookings (user_id, pickup_location, dropoff_location, date, time, driver_id, total_price) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            stmt.setString(2, pickupLocation);
            stmt.setString(3, dropoffLocation);
            stmt.setString(4, date);
            stmt.setString(5, time);
            stmt.setInt(6, driverId);
            stmt.setDouble(7, totalPrice);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT id, user_id, pickup_location, dropoff_location, date, time, driver_id, total_price, created_at FROM bookings";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                int userId = rs.getInt("user_id");
                String pickupLocation = rs.getString("pickup_location");
                String dropoffLocation = rs.getString("dropoff_location");
                LocalDate date = rs.getDate("date").toLocalDate();
                LocalTime time = rs.getTime("time").toLocalTime();
                int driverId = rs.getInt("driver_id");
                double totalPrice = rs.getDouble("total_price");
                Timestamp createdAt = rs.getTimestamp("created_at");

                Booking booking = new Booking(id, userId, pickupLocation, dropoffLocation, date, time, driverId, totalPrice, createdAt);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public List<Booking> getRecentBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT id, pickup_location, dropoff_location, created_at FROM bookings ORDER BY created_at DESC LIMIT 10";

        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String pickupLocation = rs.getString("pickup_location");
                String dropoffLocation = rs.getString("dropoff_location");
                Timestamp createdAt = rs.getTimestamp("created_at");

                Booking booking = new Booking(id, 0, pickupLocation, dropoffLocation, null, null, 0, 0.0, createdAt);
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }
    
    public List<Booking> getActiveDriverBookings() {
    List<Booking> bookings = new ArrayList<>();
    String query = "SELECT b.id, u.first_name, u.last_name, u.contact_number, b.pickup_location, b.dropoff_location, b.date, b.time, b.total_price " +
                   "FROM bookings b " +
                   "JOIN users u ON b.user_id = u.id " +
                   "WHERE b.driver_id IS NOT NULL " +
                   "ORDER BY b.created_at DESC";

    try (Connection conn = DatabaseConnection.getConnection(); 
         PreparedStatement stmt = conn.prepareStatement(query); 
         ResultSet rs = stmt.executeQuery()) {

        while (rs.next()) {
            int id = rs.getInt("id");
            String firstName = rs.getString("first_name");
            String lastName = rs.getString("last_name");
            String contactNumber = rs.getString("contact_number");
            String pickupLocation = rs.getString("pickup_location");
            String dropoffLocation = rs.getString("dropoff_location");
            LocalDate date = rs.getDate("date").toLocalDate();
            LocalTime time = rs.getTime("time").toLocalTime();
            double totalPrice = rs.getDouble("total_price");

            Booking booking = new Booking(id, 0, pickupLocation, dropoffLocation, date, time, 0, totalPrice, null);
            booking.setCustomerName(firstName + " " + lastName);
            booking.setContactNumber(contactNumber);
            bookings.add(booking);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return bookings;
}
}
