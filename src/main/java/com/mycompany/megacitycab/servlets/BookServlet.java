package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.BillingAddressDAO;
import com.mycompany.megacitycab.dao.BookingDAO;
import com.mycompany.megacitycab.dao.DriverDAO;
import com.mycompany.megacitycab.dao.PricingDAO;
import com.mycompany.megacitycab.dao.UserDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BookServlet", urlPatterns = {"/book"})
public class BookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if (email == null) {
            String jsonResponse = "{\"success\": false, \"message\": \"User not logged in.\"}";
            sendResponse(response, jsonResponse);
            return;
        }

        UserDAO userDAO = new UserDAO();
        int userId = userDAO.getUserIdByEmail(email);

        if (userId == -1) {
            String jsonResponse = "{\"success\": false, \"message\": \"User not found.\"}";
            sendResponse(response, jsonResponse);
            return;
        }

        StringBuilder requestBody = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                requestBody.append(line);
            }
        }

        String jsonString = requestBody.toString();
        String firstName = extractStringValue(jsonString, "firstName");
        String lastName = extractStringValue(jsonString, "lastName");
        String address1 = extractStringValue(jsonString, "address1");
        String address2 = extractStringValue(jsonString, "address2");
        String city = extractStringValue(jsonString, "city");
        String phoneNumber = extractStringValue(jsonString, "phoneNumber");
        String emailBilling = extractStringValue(jsonString, "email");
        String pickupLocation = extractStringValue(jsonString, "pickupLocation");
        String dropoffLocation = extractStringValue(jsonString, "dropoffLocation");
        String date = extractStringValue(jsonString, "date");
        String time = extractStringValue(jsonString, "time");
        int passengerCount = extractIntValue(jsonString, "passengerCount");

        PricingDAO pricingDAO = new PricingDAO();
        double totalPrice = pricingDAO.getPriceByPassengerCount(passengerCount);

        DriverDAO driverDAO = new DriverDAO();
        List<Integer> availableDrivers = driverDAO.getAvailableDrivers(date, passengerCount);

        String jsonResponse;
        if (availableDrivers.isEmpty()) {
            jsonResponse = "{\"success\": false, \"message\": \"No available drivers for the selected date and passenger count.\"}";
        } else {
            int driverId = availableDrivers.get(0);

            BookingDAO bookingDAO = new BookingDAO();
            int bookingId = bookingDAO.createBooking(userId, pickupLocation, dropoffLocation, date, time, driverId, totalPrice);

            if (bookingId != -1) {
    BillingAddressDAO billingAddressDAO = new BillingAddressDAO();
    boolean billingSaved = billingAddressDAO.saveBillingAddress(bookingId, firstName, lastName, address1, address2, city, phoneNumber, emailBilling);

    if (billingSaved) {
        jsonResponse = "{\"success\": true, \"message\": \"Booking and billing details saved successfully.\", \"bookingId\": " + bookingId + "}";
    } else {
        jsonResponse = "{\"success\": false, \"message\": \"Failed to save billing details.\"}";
    }
} else {
    jsonResponse = "{\"success\": false, \"message\": \"Failed to create booking.\"}";
}
        }

        sendResponse(response, jsonResponse);
    }

    private void sendResponse(HttpServletResponse response, String jsonResponse) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.print(jsonResponse);
            out.flush();
        }
    }

    private int extractIntValue(String jsonString, String key) {
        String keyPattern = "\"" + key + "\":";
        int startIndex = jsonString.indexOf(keyPattern) + keyPattern.length();
        int endIndex = jsonString.indexOf(",", startIndex);
        if (endIndex == -1) {
            endIndex = jsonString.indexOf("}", startIndex);
        }
        String valueString = jsonString.substring(startIndex, endIndex).trim();
        valueString = valueString.replace("\"", "");
        return Integer.parseInt(valueString);
    }

    private String extractStringValue(String jsonString, String key) {
        String keyPattern = "\"" + key + "\":\"";
        int startIndex = jsonString.indexOf(keyPattern) + keyPattern.length();
        int endIndex = jsonString.indexOf("\"", startIndex);
        return jsonString.substring(startIndex, endIndex);
    }
}
