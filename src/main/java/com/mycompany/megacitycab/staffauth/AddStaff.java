package com.mycompany.megacitycab.staffauth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddStaff", urlPatterns = {"/add-staff"})
public class AddStaff extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("addFirstName");
        String lastName = request.getParameter("addLastName");
        String email = request.getParameter("addEmail");
        String role = request.getParameter("addRole");
        String password = request.getParameter("addPassword");
        
        if (StaffAuth.emailExists(email)) {
            response.sendRedirect(request.getContextPath() + "/admin/staff.jsp?registererror=3");
            return;
        }

        if (StaffAuth.registerStaff(firstName, lastName, email, role, password)) {
            response.sendRedirect(request.getContextPath() + "/admin/staff.jsp?registersuccess=1");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/staff.jsp?registererror=1");
        }
    }
}
