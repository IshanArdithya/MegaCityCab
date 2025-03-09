package com.mycompany.megacitycab.contact;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ContactServlet", urlPatterns = {"/contact"})
public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("mobileNumber");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        if (saveContactForm(firstName, lastName, email, mobileNumber, subject, message)) {
            response.sendRedirect("about.jsp?success=1");
        } else {
            response.sendRedirect("about.jsp?error=1");
        }
    }

    private boolean saveContactForm(String firstName, String lastName, String email, String mobileNumber, String subject, String message) {
        String query = "INSERT INTO contact (first_name, last_name, email, mobile_number, subject, message) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, mobileNumber);
            stmt.setString(5, subject);
            stmt.setString(6, message);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}