<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../sessionCheck.jsp" %>

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
            <div class="container">
                <div class="profile__container">
                    <div class="profile__info">
                        <div class="profile__info-main">
                            <div class="info-main-left">
                                <img src="https://avatar.iran.liara.run/public" alt="User Avatar" class="profile__avatar">
                                <div class="profile__name">Ishan Ardithya</div>
                            </div>
                            <div class="info-main-right">
                                <div class="info-main-stats">
                                    <h3>100000</h3>
                                    <p>Bookings</p>
                                </div>
                                <div class="profile__stats-divider"></div>
                                <div class="info-main-stats">
                                    <h3>1</h3>
                                    <p>Reviews</p>
                                </div>
                            </div>
                        </div>
                        <div class="profile__info-about">
                            <h2>About</h2>
                            <div class="profile__information_section">
                                <div class="profile__information">
                                    <div class="profile__information-icon">
                                        <i class="ri-time-fill"></i>
                                    </div>
                                    <p>Joined January 2025</p>
                                </div>
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
