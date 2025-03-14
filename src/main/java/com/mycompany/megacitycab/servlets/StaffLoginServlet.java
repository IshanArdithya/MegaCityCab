package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.StaffDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "StaffLoginServlet", urlPatterns = {"/staff-login"})
public class StaffLoginServlet extends HttpServlet {

    private StaffDAO staffDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        staffDAO = new StaffDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (staffDAO.authenticateStaff(email, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("staff_email", email);

            String staffFirstName = staffDAO.getStaffFirstName(email);
            if (staffFirstName != null) {
                session.setAttribute("staffFirstName", staffFirstName);
            }

            String staffRole = staffDAO.getStaffRole(email);
            if (staffRole != null) {
                session.setAttribute("staffRole", staffRole);
            }

            response.sendRedirect(request.getContextPath() + "/admin/bookings.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/adminlogin.jsp?error=1");
        }
    }
}
