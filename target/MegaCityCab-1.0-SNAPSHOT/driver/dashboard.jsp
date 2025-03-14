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
    List<Booking> completedBookings = bookingDAO.getCompletedDriverBookings();
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                                <% if (bookings.isEmpty()) { %>
                                <tr>
                                    <td colspan="9">No active bookings found</td>
                                </tr>
                                <% } else { %>
                                <% for (Booking booking : bookings) {%>
                                <tr>
                                    <td><%= booking.getId()%></td>
                                    <td><%= booking.getCustomerName()%></td>
                                    <td><%= booking.getContactNumber()%></td>
                                    <td><%= booking.getPickupLocation()%></td>
                                    <td><%= booking.getDropoffLocation()%></td>
                                    <td><%= booking.getDate()%></td>
                                    <td><%= booking.getTime()%></td>
                                    <td>LKR <%= booking.getTotalPrice()%></td>
                                    <td>
                                        <button class="mark-btn mark-complete" data-booking-id="<%= booking.getId()%>">Mark as Complete</button>
                                    </td>
                                </tr>
                                <% } %>
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
                                    <th>Pickup</th>
                                    <th>Dropoff</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Total Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (completedBookings.isEmpty()) { %>
                                <tr>
                                    <td colspan="9">No bookings found</td>
                                </tr>
                                <% } else { %>
                                <% for (Booking completedBooking : completedBookings) {%>
                                <tr>
                                    <td><%= completedBooking.getId()%></td>
                                    <td><%= completedBooking.getCustomerName()%></td>
                                    <td><%= completedBooking.getContactNumber()%></td>
                                    <td><%= completedBooking.getPickupLocation()%></td>
                                    <td><%= completedBooking.getDropoffLocation()%></td>
                                    <td><%= completedBooking.getDate()%></td>
                                    <td><%= completedBooking.getTime()%></td>
                                    <td>LKR <%= completedBooking.getTotalPrice()%></td>
                                </tr>
                                <% } %>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>

            </main>
        </div>
                            <script>
            document.querySelectorAll('.mark-complete').forEach(button => {
                button.addEventListener('click', function () {
                    const bookingId = this.getAttribute('data-booking-id');

                                        fetch('/MegaCityCab/updateBookingStatus', {
                                            method: 'POST',
                                            headers: {
                                                'Content-Type': 'application/json'
                                            },
                                            body: JSON.stringify({bookingId: bookingId, status: 'completed'})
                                        })
                                                .then(response => response.json())
                                                .then(data => {
                                                    if (data.success) {
                                                        Swal.fire({
                                                            icon: 'success',
                                                            title: 'Success!',
                                                            text: 'Booking marked as completed!',
                                                            confirmButtonText: 'OK'
                                                        }).then(() => {
                                                            location.reload();
                                                        });
                                                    } else {
                                                        Swal.fire({
                                                            icon: 'error',
                                                            title: 'Error!',
                                                            text: 'Failed to update booking status: ' + data.message,
                                                            confirmButtonText: 'OK'
                                                        });
                                                    }
                                                })
                                                .catch(error => {
                                                    console.error('Error updating booking status:', error);
                                                    Swal.fire({
                                                        icon: 'error',
                                                        title: 'Error!',
                                                        text: 'An error occurred while updating the booking status.',
                                                        confirmButtonText: 'OK'
                                                    });
                                                });
                                    });
                                });
        </script>
    </body>
</html>