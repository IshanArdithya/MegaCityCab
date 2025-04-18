package com.mycompany.megacitycab.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "StaffLogoutServlet", urlPatterns = {"/staff-logout"})
public class StaffLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("staff_email");
            session.removeAttribute("staffFirstName");
            session.removeAttribute("staffRole");
        }
        response.sendRedirect(request.getContextPath() + "/adminlogin.jsp");
    }
}
