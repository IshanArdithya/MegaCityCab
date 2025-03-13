package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.StaffDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddStaff", urlPatterns = {"/add-staff"})
public class StaffAddServlet extends HttpServlet {

    private StaffDAO staffDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        staffDAO = new StaffDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("addFirstName");
        String lastName = request.getParameter("addLastName");
        String email = request.getParameter("addEmail");
        String role = request.getParameter("addRole");
        String password = request.getParameter("addPassword");

        if (staffDAO.emailExists(email)) {
            response.sendRedirect(request.getContextPath() + "/admin/staff.jsp?registererror=3");
            return;
        }

        if (staffDAO.registerStaff(firstName, lastName, email, role, password)) {
            response.sendRedirect(request.getContextPath() + "/admin/staff.jsp?registersuccess=1");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/staff.jsp?registererror=1");
        }
    }
}
