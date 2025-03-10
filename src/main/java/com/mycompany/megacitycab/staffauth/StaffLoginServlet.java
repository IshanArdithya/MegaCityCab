package com.mycompany.megacitycab.staffauth;

import java.io.IOException;
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

        if (StaffAuth.authenticateStaff(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("staff_email", email);
            
            String staffFirstName = StaffAuth.getFirstName(email);
            if (staffFirstName != null) {
                session.setAttribute("staffFirstName", staffFirstName);
            }
            
            String staffRole = StaffAuth.getRole(email);
            if (staffRole != null) {
                session.setAttribute("staffRole", staffRole);
            }
            
            response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/adminlogin.jsp?error=1");
        }
    }
}
