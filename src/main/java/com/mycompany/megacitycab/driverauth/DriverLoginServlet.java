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
import javax.servlet.http.HttpSession;

@WebServlet(name = "DriverLoginServlet", urlPatterns = {"/driver-login"})
public class DriverLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (authenticateDriver(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("driver_email", email);
            response.sendRedirect(request.getContextPath() + "/driver/index.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp?error=1");
        }
    }

    private boolean authenticateDriver(String email, String password) {
        String query = "SELECT * FROM driver_users WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
