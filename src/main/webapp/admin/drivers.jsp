<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.mycompany.megacitycab.dao.DriverDAO"%>
<%@page import="com.mycompany.megacitycab.model.Driver" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@include file="adminSessionAuth.jsp" %>
<%    if (staffSession == null || staffSession.getAttribute("staff_email") == null) {
        response.sendRedirect(request.getContextPath() + "/adminlogin.jsp");
        return;
    }

    DriverDAO driverDAO = new DriverDAO();
    List<Driver> drivers = driverDAO.getAllDrivers();
    List<Driver> recentDrivers = driverDAO.getRecentDrivers();

    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM, HH:mm");
    SimpleDateFormat todayFormat = new SimpleDateFormat("'Today,' HH:mm");
    java.util.Date today = new java.util.Date();
%>

<%
    String pageTitle = "Drivers"; //header.jsp
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
                        <h2>All Drivers</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Driver ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Gender</th>
                                    <th>Email</th>
                                    <th>Home Address</th>
                                    <th>NIC</th>
                                    <th>Contact Number</th>
                                    <th>Registered Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Driver driver : drivers) {%>
                                <tr>
                                    <td><%= driver.getId()%></td>
                                    <td><%= driver.getFirstName()%></td>
                                    <td><%= driver.getLastName()%></td>
                                    <td><%= driver.getGender()%></td>
                                    <td><%= driver.getEmail()%></td>
                                    <td><%= driver.getHomeAddress()%></td>
                                    <td><%= driver.getNIC()%></td>
                                    <td><%= driver.getContactNumber()%></td>
                                    <td><%= driver.getCreatedAt()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="section-container">
                    <div class="section">
                        <h2>All Vehicles</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Driver ID</th>
                                    <th>Vehicle Name</th>
                                    <th>Passenger Count</th>
                                    <th>Vehicle Number</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Driver driver : drivers) {%>
                                <tr>
                                    <td><%= driver.getId()%></td>
                                    <td><%= driver.getVehicleName()%></td>
                                    <td><%= driver.getPassengerCount()%></td>
                                    <td><%= driver.getVehicleNumber()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                    <div class="section section2">
                        <h2>Recent Drivers</h2>
                        <ul>
                            <% for (Driver driver : recentDrivers) {
                                    String formattedDate;
                                    if (driver.getCreatedAt().toLocalDateTime().toLocalDate().equals(today.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate())) {
                                        formattedDate = todayFormat.format(driver.getCreatedAt());
                                    } else {
                                        formattedDate = dateFormat.format(driver.getCreatedAt());
                                    }
                            %>
                            <li>
                                <span class="name"><%= driver.getFirstName()%> <%= driver.getLastName()%></span>
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