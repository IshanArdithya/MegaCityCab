package com.mycompany.megacitycab.driverauth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DriverLogoutServlet", urlPatterns = {"/driver-logout"})
public class DriverLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
//            session.invalidate();
            session.removeAttribute("driver_email");
        }
        response.sendRedirect(request.getContextPath() + "/driverlogin.jsp");
    }
}