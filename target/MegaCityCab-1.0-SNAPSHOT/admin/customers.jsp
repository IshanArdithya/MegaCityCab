<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.mycompany.megacitycab.dao.UserDAO" %>
<%@page import="com.mycompany.megacitycab.model.User" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@include file="adminSessionAuth.jsp" %>
<%    if (staffSession == null || staffSession.getAttribute("staff_email") == null) {
        response.sendRedirect(request.getContextPath() + "/adminlogin.jsp");
        return;
    }

    UserDAO userDAO = new UserDAO();
    List<User> users = userDAO.getAllUsers();
    List<User> recentUsers = userDAO.getRecentUsers();

    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM, HH:mm");
    SimpleDateFormat todayFormat = new SimpleDateFormat("'Today,' HH:mm");
    java.util.Date today = new java.util.Date();
%>

<%
    String pageTitle = "Customers"; //header.jsp
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
                        <h2>All Customers</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Customer ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Registered Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (User user : users) {%>
                                <tr>
                                    <td><%= user.getId()%></td>
                                    <td><%= user.getFirstName()%></td>
                                    <td><%= user.getLastName()%></td>
                                    <td><%= user.getEmail()%></td>
                                    <td><%= user.getCreatedAt()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                            <div class="section section2">
                                <h2>Recent Customers</h2>
                        <ul>
                            <% for (User user : recentUsers) {
                                    String formattedDate;
                                    if (user.getCreatedAt().toLocalDateTime().toLocalDate().equals(today.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate())) {
                                        formattedDate = todayFormat.format(user.getCreatedAt());
                                    } else {
                                        formattedDate = dateFormat.format(user.getCreatedAt());
                                    }
                            %>
                            <li>
                                <span class="name"><%= user.getFirstName()%> <%= user.getLastName()%></span>
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