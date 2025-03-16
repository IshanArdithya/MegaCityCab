package com.mycompany.megacitycab.test;

import com.mycompany.megacitycab.dao.BillingAddressDAO;
import com.mycompany.megacitycab.dao.BookingDAO;
import com.mycompany.megacitycab.dao.DriverDAO;
import com.mycompany.megacitycab.dao.PricingDAO;
import com.mycompany.megacitycab.dao.UserDAO;
import java.util.List;

public class CreateBooking {

    public static void main(String[] args) {
        
        String userEmail = "user@megacitycab.com";
        
        //booking details
        String firstName = "Driver";
        String lastName = "User";
        String address1 = "123, Colombo, Sri Lanka";
        String address2 = "Orange Electric";
        String city = "Colombo";
        String phoneNumber = "0771234512";
        String pickupLocation = "123, Colombo";
        String dropoffLocation = "Homagama";
        String date = "2025-10-01";
        String time = "12:00:00";
        int passengerCount = 4;
        
        // fetch user ID
        UserDAO userDAO = new UserDAO();
        int userId = userDAO.getUserIdByEmail(userEmail);
        
        if (userId == -1) {
            System.out.println("User not found.");
            return;
        }
        
        // calc total price
        PricingDAO pricingDAO = new PricingDAO();
        double totalPrice = pricingDAO.getPriceByPassengerCount(passengerCount);
        
        // assign a driver
        DriverDAO driverDAO = new DriverDAO();
        List<Integer> availableDrivers = driverDAO.getAvailableDrivers(date, passengerCount);
        
        if (availableDrivers.isEmpty()) {
            System.out.println("No available drivers for the selected date and passenger count.");
            return;
        }
        
        int driverId = availableDrivers.get(0);

        //create booking
        BookingDAO bookingDAO = new BookingDAO();
        int bookingId = bookingDAO.createBooking(userId, pickupLocation, dropoffLocation, date, time, driverId, totalPrice);

        if (bookingId == -1) {
            System.out.println("Failed to create booking.");
            return;
        }

        // save billing
        BillingAddressDAO billingAddressDAO = new BillingAddressDAO();
        boolean billingSaved = billingAddressDAO.saveBillingAddress(bookingId, firstName, lastName, address1, address2, city, phoneNumber, userEmail);

        if (billingSaved) {
            System.out.println("Booking and billing details saved successfully!");
            System.out.println("Booking ID: " + bookingId);
        } else {
            System.out.println("Failed to save billing details.");
        }
    }
}