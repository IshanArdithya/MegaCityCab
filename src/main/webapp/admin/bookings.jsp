<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.mycompany.megacitycab.dao.BookingDAO" %>
<%@page import="com.mycompany.megacitycab.model.Booking"%>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@include file="adminSessionAuth.jsp" %>
<%    if (staffSession == null || staffSession.getAttribute("staff_email") == null) {
        response.sendRedirect(request.getContextPath() + "/adminlogin.jsp");
        return;
    }

    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookings = bookingDAO.getAllBookings();
    List<Booking> recentBookings = bookingDAO.getRecentBookings();

    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM, HH:mm");
    SimpleDateFormat todayFormat = new SimpleDateFormat("'Today,' HH:mm");
        java.util.Date today = new java.util.Date();
%>

<%
    String pageTitle = "Bookings"; //header.jsp
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
                        <h2>All Bookings</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Customer ID</th>
                                    <th>Driver ID</th>
                                    <th>Pickup</th>
                                    <th>Dropoff</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Total Price</th>
                                    <th>Booked date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Booking booking : bookings) {%>
                                <tr>
                                    <td><%= booking.getId()%></td>
                                    <td><%= booking.getUserId()%></td>
                                    <td><%= booking.getDriverId()%></td>
                                    <td><%= booking.getPickupLocation()%></td>
                                    <td><%= booking.getDropoffLocation()%></td>
                                    <td><%= booking.getDate()%></td>
                                    <td><%= booking.getTime()%></td>
                                    <td><%= booking.getTotalPrice()%></td>
                                    <td><%= booking.getCreatedAt()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                    <div class="section section2">
                        <h2>Recent Bookings</h2>
                        <ul>
                            <% for (Booking booking : recentBookings) {
                                    String formattedDate;
                                    if (booking.getCreatedAt().toLocalDateTime().toLocalDate().equals(today.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate())) {
                                        formattedDate = todayFormat.format(booking.getCreatedAt());
                                    } else {
                                        formattedDate = dateFormat.format(booking.getCreatedAt());
                                    }
                            %>
                            <li>
                                <span class="name"><%= booking.getPickupLocation()%> - <%= booking.getDropoffLocation()%></span>
                                <span class="time"><%= formattedDate%></span>
                            </li>
                            <% }%>
                        </ul>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>