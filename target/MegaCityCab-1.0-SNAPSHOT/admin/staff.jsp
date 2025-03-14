<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="com.mycompany.megacitycab.model.StaffUser"%>
<%@page import="com.mycompany.megacitycab.dao.StaffDAO"%>
<%@page import="java.util.List" %>
<%@page import="java.text.SimpleDateFormat" %>

<%@include file="adminSessionAuth.jsp" %>
<%    if (staffSession == null || staffSession.getAttribute("staff_email") == null) {
        response.sendRedirect(request.getContextPath() + "/adminlogin.jsp");
        return;
    }

        String staffRoleJSP = (String) staffSession.getAttribute("staffRole");
            if ("Staff".equals(staffRoleJSP)) {
            response.sendRedirect(request.getContextPath() + "/admin/index.jsp");
            return;
        }

    StaffDAO staffDAO = new StaffDAO();
    List<StaffUser> staffUsers = staffDAO.getAllStaff();
    List<StaffUser> recentStaffUsers = staffDAO.getRecentStaff();

    SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM, HH:mm");
    SimpleDateFormat todayFormat = new SimpleDateFormat("'Today,' HH:mm");
        java.util.Date today = new java.util.Date();
%>

<%
    String pageTitle = "Staff"; //header.jsp
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
                        <h2>Add Staff</h2>

                        <div class="section-flex">
                            <div class="contact-form">
                                <form class="contact-form-flex" action="${pageContext.request.contextPath}/add-staff" method="POST">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <div class="entryarea">
                                                <input type="text" name="addFirstName" required>
                                                <div class="labelline">First Name *</div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="entryarea">
                                                <input type="text" name="addLastName" required>
                                                <div class="labelline">Last Name *</div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <div class="entryarea">
                                                <input type="email" name="addEmail" required>
                                                <div class="labelline">Email *</div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="entryarea entryarea-select">
                                                <select name="addRole" required>
                                                    <option value="" disabled selected>Select Role *</option>
                                                    <option value="Admin">Admin</option>
                                                    <option value="Staff">Staff</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group">
                                            <div class="entryarea">
                                                <input type="password" name="addPassword" required>
                                                <div class="labelline">Password *</div>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit">Submit</button>
                                </form>
                            </div>
                            <div class="section-image">
                                <img src="../images/add-staff2.png">
                            </div>
                        </div>
                    </div>
                    <div class="section section2">
                        <h2>Recent Staff</h2>
                        <ul>
                            <% for (StaffUser staffuser : recentStaffUsers) {
                                    String formattedDate;
                                    if (staffuser.getCreatedAt().toLocalDateTime().toLocalDate().equals(today.toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate())) {
                                        formattedDate = todayFormat.format(staffuser.getCreatedAt());
                                    } else {
                                        formattedDate = dateFormat.format(staffuser.getCreatedAt());
                                    }
                            %>
                            <li>
                                <span class="name"><%= staffuser.getFirstName()%> <%= staffuser.getLastName()%></span>
                                <span class="time"><%= formattedDate%></span>
                            </li>
                            <% }%>
                        </ul>
                    </div>
                </div>
                <div class="section-container">
                    <div class="section">
                        <h2>All Staff</h2>
                        <table>
                            <thead>
                                <tr>
                                    <th>Staff ID</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Registered Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (StaffUser staffuser : staffUsers) {%>
                                <tr>
                                    <td><%= staffuser.getId()%></td>
                                    <td><%= staffuser.getFirstName()%></td>
                                    <td><%= staffuser.getLastName()%></td>
                                    <td><%= staffuser.getEmail()%></td>
                                    <td><%= staffuser.getRole()%></td>
                                    <td><%= staffuser.getCreatedAt()%></td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>

                </div>
            </main>
        </div>
                            <script src="../js/contactus.js"></script>
                            <script src="../js/login-popup.js"></script>
    </body>
</html>