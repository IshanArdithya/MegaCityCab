<%-- 
    Document   : inquiries
    Created on : Mar 10, 2025, 4:18:21 PM
    Author     : IshanPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.mycompany.megacitycab.dao.ContactDAO" %>
<%@page import="com.mycompany.megacitycab.model.Contact" %>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@include file="adminSessionAuth.jsp" %>
<%    if (staffSession == null || staffSession.getAttribute("staff_email") == null) {
        response.sendRedirect(request.getContextPath() + "/adminlogin.jsp");
        return;
    }

    ContactDAO userDAO = new ContactDAO();
    List<Contact> contacts = userDAO.getAllContacts();
    List<Contact> recentContacts = userDAO.getRecentContacts();

    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM, HH:mm");
    SimpleDateFormat todayFormat = new SimpleDateFormat("'Today,' HH:mm");
    java.util.Date today = new java.util.Date();
%>

<%
    String pageTitle = "Inquiries"; //header.jsp
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
                        <h2>All Inquiries</h2>
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
                                <% for (Contact contact : contacts) {%>
                                <tr>
                                    <td><%= contact.getId()%></td>
                                    <td><%= contact.getFirstName()%></td>
                                    <td><%= contact.getLastName()%></td>
                                    <td><%= contact.getEmail()%></td>
                                    <td><%= contact.getCreatedAt()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                            <div class="section section2">
                                <h2>Recent Inquiries</h2>
                        <ul>
                            <% for (Contact contact : recentContacts) {
                                    String formattedDate;
                                    if (contact.getCreatedAt().toLocalDateTime().toLocalDate().equals(today.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate())) {
                                        formattedDate = todayFormat.format(contact.getCreatedAt());
                                    } else {
                                        formattedDate = dateFormat.format(contact.getCreatedAt());
                                    }
                            %>
                            <li>
                                <span class="name"><%= contact.getFirstName()%> <%= contact.getLastName()%></span>
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