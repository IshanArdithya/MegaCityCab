package com.mycompany.megacitycab.staffauth;

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

@WebServlet(name = "StaffLoginServlet", urlPatterns = {"/staff-login"})
public class StaffLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (authenticateStaff(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("staff_email", email);
            response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/staff-login.jsp?error=1");
        }
    }

    private boolean authenticateStaff(String email, String password) {
        String query = "SELECT * FROM staff_users WHERE email = ? AND password = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
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
