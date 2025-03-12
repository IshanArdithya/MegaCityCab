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
                        <h2>All Inquiries</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Customer ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Subject</th>
                                    <th>Message</th>
                                    <th>Registered Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Contact contact : contacts) {%>
                                <tr>
                                    <td><%= contact.getId()%></td>
                                    <td><%= contact.getFirstName()%></td>
                                    <td><%= contact.getLastName()%></td>
                                    <td><%= contact.getEmail()%></td>
                                    <td><%= contact.getSubject()%></td>
                                    <td><%= contact.getMessage().length() > 10 ? contact.getMessage().substring(0, 10) + "..." : contact.getMessage()%></td>
                                    <td><%= contact.getCreatedAt()%></td>
                                    <td>
                                        <button class="view-btn"
                                                data-id="<%= contact.getId()%>"
                                                data-first-name="<%= contact.getFirstName()%>"
                                                data-last-name="<%= contact.getLastName()%>"
                                                data-email="<%= contact.getEmail()%>"
                                                data-subject="<%= contact.getSubject()%>"
                                                data-message="<%= contact.getMessage()%>"
                                                data-created-at="<%= contact.getCreatedAt()%>">
                                            View
                                        </button>
                                    </td>
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
                        <script>
            document.querySelectorAll('.view-btn').forEach(button => {
                button.addEventListener('click', function () {

                    const id = this.getAttribute('data-id');
                    const firstName = this.getAttribute('data-first-name');
                    const lastName = this.getAttribute('data-last-name');
                    const email = this.getAttribute('data-email');
                    const subject = this.getAttribute('data-subject');
                    const message = this.getAttribute('data-message');
                    const createdAt = this.getAttribute('data-created-at');

                    console.log("ID:", id);
                    console.log("First Name:", firstName);
                    console.log("Last Name:", lastName);
                    console.log("Email:", email);
                    console.log("Subject:", subject);
                    console.log("Message:", message);
                    console.log("Created At:", createdAt);

                    const content = `
                        <div style="text-align: left;">
                        <p><strong>ID:</strong> ${id}</p>
                        <p><strong>First Name:</strong> ${firstName}</p>
                        <p><strong>Last Name:</strong> ${lastName}</p>
                        <p><strong>Email:</strong> ${email}</p>
                        <p><strong>Subject:</strong> ${subject}</p>
                        <p><strong>Message:</strong> ${message}</p>
                        <p><strong>Registered Date:</strong> ${createdAt}</p>
                        </div>
                    `;

                    console.log("Popup Content:", content);

                        Swal.fire({
                            title: 'Inquiry Details',
                            html: content,
                            confirmButtonText: 'Close',
                            confirmButtonColor: '#3085d6',
                        });
                    });
                });
                        </script>
    </body>
</html>