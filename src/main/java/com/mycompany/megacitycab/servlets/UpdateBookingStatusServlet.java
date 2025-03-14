package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.BookingDAO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UpdateBookingStatusServlet", urlPatterns = {"/updateBookingStatus"})
public class UpdateBookingStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        StringBuilder requestBody = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                requestBody.append(line);
            }
        }

        String jsonString = requestBody.toString();
        int bookingId = extractIntValue(jsonString, "bookingId");
        String status = extractStringValue(jsonString, "status");

        BookingDAO bookingDAO = new BookingDAO();
        boolean success = bookingDAO.updateBookingStatus(bookingId, status);

        String jsonResponse;
        if (success) {
            jsonResponse = "{\"success\": true, \"message\": \"Booking status updated successfully.\"}";
        } else {
            jsonResponse = "{\"success\": false, \"message\": \"Failed to update booking status.\"}";
        }

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