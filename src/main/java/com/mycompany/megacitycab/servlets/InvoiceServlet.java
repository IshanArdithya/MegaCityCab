package com.mycompany.megacitycab.servlets;

import com.mycompany.megacitycab.dao.BillingAddressDAO;
import com.mycompany.megacitycab.dao.BookingDAO;
import com.mycompany.megacitycab.model.BillingAddress;
import com.mycompany.megacitycab.model.Booking;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "InvoiceServlet", urlPatterns = {"/invoice"})
public class InvoiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        BookingDAO bookingDAO = new BookingDAO();
        Booking booking = bookingDAO.getBookingById(bookingId);

        BillingAddressDAO billingAddressDAO = new BillingAddressDAO();
        BillingAddress billingAddress = billingAddressDAO.getBillingAddressByBookingId(bookingId);

        // set attributes for JSP
        request.setAttribute("booking", booking);
        request.setAttribute("billingAddress", billingAddress);

        // forward to invoice JSP
        request.getRequestDispatcher("/invoice.jsp").forward(request, response);
    }
}
