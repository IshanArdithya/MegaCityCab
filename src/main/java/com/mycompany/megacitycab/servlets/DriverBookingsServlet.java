package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.BookingDAO;
import com.mycompany.megacitycab.dao.DriverDAO;
import com.mycompany.megacitycab.model.Booking;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DriverBookingsServlet", urlPatterns = {"/driverBookings"})
public class DriverBookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // fetch driver_email from session
        HttpSession session = request.getSession();
        String driverEmail = (String) session.getAttribute("driver_email");

        if (driverEmail == null) {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp");
            return;
        }

        // fetch driver_id by driver_email
        DriverDAO driverDAO = new DriverDAO();
        int driverId = driverDAO.getDriverIdByEmail(driverEmail);

        // driver not found
        if (driverId == -1) {
            response.sendRedirect(request.getContextPath() + "/driverlogin.jsp");
            return;
        }

        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> bookings = bookingDAO.getActiveDriverBookings(driverId);

        // set bookings as a request attribute
        request.setAttribute("bookings", bookings);

        // forward to JSP
        request.getRequestDispatcher("/driverBookings.jsp").forward(request, response);
    }
}
