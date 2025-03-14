<%@page import="com.mycompany.megacitycab.dao.UserDAO" %>
<%@page import="com.mycompany.megacitycab.model.User" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="javax.servlet.http.HttpSession" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../sessionCheck.jsp" %>

<%
    HttpSession sessionprofile = request.getSession();
    String email = (String) sessionprofile.getAttribute("email");
    if (sessionprofile == null || sessionprofile.getAttribute("email") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserByEmail(email);

    SimpleDateFormat dateFormat = new SimpleDateFormat("MMMM yyyy");
    String joinedDate = "";
    if (user != null && user.getCreatedAt() != null) {
        joinedDate = dateFormat.format(user.getCreatedAt());
    }

    int bookingCount = 0;
    if (user != null) {
        bookingCount = userDAO.getBookingCountByUserId(user.getId());
    }

    int reviewsCount = 0;
    if (user != null) {
        reviewsCount = userDAO.getReviewsCountByUserId(user.getId());
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/style.css">
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
            />
        <title>Profile | Mega City Cab</title>
    </head>
    <body>
        <section class="nav-a-dark profile__customer">
            <%@ include file="../components/header.jsp" %>
            <div class="profile__contents-divider"></div>
            <div class="container">

                <div class="profile__container">
                    <div class="profile__info">
                        <div class="profile__info-main">
                            <div class="info-main-left">
                                <img src="/MegaCityCab/images/person1.png" alt="User Avatar" class="profile__avatar">
                                <div class="profile__name">Ishan Ardithya</div>
                            </div>
                            <div class="info-main-right">
                                <div class="info-main-stats">
                                    <h3><%= bookingCount%></h3>
                                    <p>Bookings</p>
                                </div>
                                <div class="profile__stats-divider"></div>
                                <div class="info-main-stats">
                                    <h3><%= reviewsCount%></h3>
                                    <p>Reviews</p>
                                </div>
                            </div>
                        </div>
                        <div class="profile__info-about">
                            <h2>About</h2>
                            <div class="profile__information_section">
                                <% if (user != null) {%>
                                <div class="profile__information">
                                    <div class="profile__information-icon">
                                        <i class="ri-mail-fill"></i>
                                    </div>
                                    <div class="profile__information-wrap">
                                        <span class="information-title">Email Address</span>
                                        <span class="information-context"><%= user.getEmail()%></span>
                                    </div>
                                </div>
                                <div class="profile__information">
                                    <div class="profile__information-icon">
                                        <i class="ri-home-4-fill"></i>
                                    </div>
                                    <div class="profile__information-wrap">
                                        <span class="information-title">Address</span>
                                        <span class="information-context"><%= user.getHomeAddress()%></span>
                                    </div>
                                </div>
                                <div class="profile__information">
                                    <div class="profile__information-icon">
                                        <i class="ri-phone-fill"></i>
                                    </div>
                                    <div class="profile__information-wrap">
                                        <span class="information-title">Contact Number</span>
                                        <span class="information-context"><%= user.getContactNumber()%></span>
                                    </div>
                                </div>
                                <div class="profile__information">
                                    <div class="profile__information-icon">
                                        <i class="ri-time-fill"></i>
                                    </div>
                                    <div class="profile__information-wrap">
                                        <span class="information-title">Joined</span>
                                        <span class="information-context"><%= joinedDate%></span>
                                    </div>
                                </div>
                                <% } else { %>
                                <p>No user data found.</p>
                                <% }%>
                            </div>
                        </div>
                    </div>
                    <div class="profile__contents">
                        <div class="profile__section">
                            <h3>Active Bookings</h3>
                            <p class="no-bookings">No Active bookings found</p>
                        </div>
                        <div class="profile__contents-divider"></div>
                        <div class="profile__section profile__section2">
                            <h3>Recent Bookings</h3>
                            <p class="no-bookings">No Recent bookings found</p>
                        </div>
                        <div class="profile__contents-divider"></div>
                        <div class="profile__section profile__section2">
                            <h3>Your Feedback</h3>
                            <p class="no-bookings">No Feedback found</p>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="../components/footer.jsp" %>
        </section>
    </body>
</html>
