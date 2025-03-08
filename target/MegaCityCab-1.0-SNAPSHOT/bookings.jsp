<%-- 
    Document   : booking
    Created on : Mar 4, 2025, 9:44:39 PM
    Author     : IshanPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bookings | Mega City Cab</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css" rel="stylesheet" />
    </head>
    <body>
        <%@ include file="components/header.jsp" %>
        <div class="booking__hero">Bookings</div>

        <div class="container">
            <div class="booking__container">
                <div class="booking__box">
                    <div class="booking__left">
                        <div class="booking__row">
                            <div class="vehicle_selection">
                                <div class="booking__content-box booking__border">
                                    <span class="">Select Location</span>
                                    <div class="booking__inputs">
                                        <input type="text" placeholder="Pickup Location">
                                        <span class="arrow">➝</span>
                                        <input type="text" placeholder="Drop Location">
                                    </div>
                                    <div class="booking__inputs">
                                        <input type="datetime-local" value="2025-04-03T22:05">
                                    </div>
                                </div>
                                <div class="booking__content-box booking__border">
                                    <span class="">Select a Cab</span>
                                    <div class="vehicle__options">
                                        <button class="vehicle__btn"><i class="ri-car-fill"></i>4 Seater<span>LKR 0.00</span></button>
                                        <button class="vehicle__btn"><i class="ri-bus-2-fill"></i>9 Seater<span>LKR 0.00</span></button>
                                        <button class="vehicle__btn"><i class="ri-bus-fill"></i>14 Seater<span>LKR 0.00</span></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button class="book__now">Book Now</button>
                    </div>
                    <div class="booking__right">
                        <div class="booking__border">
                            <div class="vehicle__details">
                                <div class="vehicle__info">
                                    <span>Information</span>
                                    <div>
                                        <div class="vehicle__info-row">
                                            <span class="booking__passengers vehicle__title">Civic</span>
                                            <i class="ri-car-fill"></i>
                                        </div>
                                        <div class="vehicle__feature-row">
                                            <span class="booking__passengers"><i class="ri-user-line"></i> 3 passengers</span>
                                            <span class="booking__passengers"><i class="ri-snowflake-line"></i> Air Conditioned</span>
                                            <span class="booking__passengers"><i class="ri-luggage-deposit-line"></i> Spacious Luggage</span>
                                            <span class="booking__passengers"><i class="ri-money-dollar-box-line"></i> No Hidden Charges</span>
                                        </div>
                                        <ul class="vehicle__features booking__passengers">
                                            <span class="booking__price">Price: LKR 0.00</span>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section-divider"></div>
        </div>

        <%@ include file="components/footer.jsp" %>

    </body>
</html>
