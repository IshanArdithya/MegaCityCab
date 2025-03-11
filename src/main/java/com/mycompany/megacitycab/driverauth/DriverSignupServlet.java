package com.mycompany.megacitycab.driverauth;

import com.mycompany.megacitycab.auth.DatabaseConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DriverSignupServlet", urlPatterns = {"/driver-signup"})
public class DriverSignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("registerFirstName");
        String lastName = request.getParameter("registerLastName");
        String email = request.getParameter("registerEmail");
        String contactNumber = request.getParameter("registerContactNumber");
        String password = request.getParameter("registerPassword");
        String confirmPassword = request.getParameter("registerConfirmPassword");

        if (!password.equals(confirmPassword)) {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?error=2");
            return;
        }
        
        if (emailExists(email)) {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?error=3");
            return;
        }

        if (registerDriver(firstName, lastName, email, contactNumber, password)) {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?success=1");
        } else {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?error=1");
        }
    }
    
    private boolean emailExists(String email) {
        String query = "SELECT * FROM driver_users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean registerDriver(String firstName, String lastName, String email, String contactNumber, String password) {
        String query = "INSERT INTO driver_users (first_name, last_name, email, contact_number, password) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, contactNumber);
            stmt.setString(5, password);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
