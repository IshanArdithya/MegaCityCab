<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.mycompany.megacitycab.model.Booking"%>
<%@page import="com.mycompany.megacitycab.dao.BookingDAO"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.HttpSession" %>

<%@include file="driverSessionAuth.jsp" %>
<%    if (driverSession == null || driverSession.getAttribute("driver_email") == null) {
        response.sendRedirect(request.getContextPath() + "/driverlogin.jsp");
        return;
    }

        BookingDAO bookingDAO = new BookingDAO();
            List<Booking> bookings = bookingDAO.getActiveDriverBookings();
//            List<Booking> completedBookings = bookingDAO.getCompletedBookings();
%>

<%
    String pageTitle = "Overview"; //header.jsp
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin | Mega City Cab</title>

        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
            />

        <link rel="stylesheet" href="../css/admindashboard.css">
    </head>

    <body>
        <div class="container">
            <%@include file="components/sidebar.jsp" %>
            <main>
                <%@include file="components/header.jsp" %>
                <div class="section-container">
                    <div class="section">
                        <h2>Active Bookings</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Customer Name</th>
                                    <th>Contact Number</th>
                                    <th>Pickup</th>
                                    <th>Dropoff</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Total Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Booking booking : bookings) {%>
                                <tr>
                                    <td><%= booking.getId()%></td>
                                    <td><%= booking.getCustomerName()%></td>
                                    <td><%= booking.getContactNumber()%></td>
                                    <td><%= booking.getPickupLocation()%></td>
                                    <td><%= booking.getDropoffLocation()%></td>
                                    <td><%= booking.getDate()%></td>
                                    <td><%= booking.getTime()%></td>
                                    <td><%= booking.getTotalPrice()%></td>

                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="section-container">
                    <div class="section">
                        <h2>Completed Bookings</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Customer Name</th>
                                    <th>Contact Number</th>
                                    <th>Booking Date</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>

            </main>
        </div>
    </body>
</html>