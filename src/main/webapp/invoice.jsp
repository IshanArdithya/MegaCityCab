<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.megacitycab.model.Booking" %>
<%@ page import="com.mycompany.megacitycab.model.BillingAddress" %>

<%@include file="sessionCheck.jsp" %>

<%  Booking booking = (Booking) request.getAttribute("booking");
    BillingAddress billingAddress = (BillingAddress) request.getAttribute("billingAddress");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <link
            href="https://cdn.jsdelivr.net/npm/remixicon@4.5.0/fonts/remixicon.css"
            rel="stylesheet"
            />
        <title>Profile | Mega City Cab</title>
    </head>
    <body>
        <section class="nav-a-dark profile__customer">
            <%@ include file="components/header.jsp" %>
            <div class="profile__contents-divider"></div>
            <div class="container">
                <div class="invoice__container">
                    <div class="invoice__section">
                        <h3>Invoice</h3>
                        <p class="invoice__booking-id">#<span><%= booking.getId()%></span></p>
                        <div class="invoice__header-main">
                            <div>
                                <div class="invoice__header-section">
                                    <h4><%= billingAddress.getFirstName()%> <%= billingAddress.getLastName()%></h4>
                                    <p>Email: <span><%= billingAddress.getEmail()%></span></p>
                                    <p>Contact Number: <span><%= billingAddress.getPhoneNumber()%></span></p>
                                </div>
                            </div>
                        </div>
                        <div class="invoice__contents">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>Description</th>
                                        <th>Days</th>
                                        <th>Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <strong>Base Fare</strong><br>
                                            <span class="description-details">
                                                <%= booking.getPickupLocation()%><span> > </span><%= booking.getDropoffLocation()%>
                                            </span><br>
                                            <span class="description-details">
                                                <%= booking.getDate()%><span> </span><%= booking.getTime()%>
                                            </span>
                                        </td>
                                        <td>1</td>
                                        <td>LKR <%= booking.getTotalPrice()%></td>
                                    </tr>

                                    <tr class="spacer-row">
                                        <td colspan="3"></td>
                                    </tr>

                                    <tr class="subtotal">
                                        <td></td>
                                        <td class="subtotal-td">Subtotal</td>
                                        <td class="subtotal-td" align="right">LKR <%= booking.getTotalPrice()%></td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td class="subtotal-td">Discounts</td>
                                        <td class="subtotal-td" align="right">LKR 0.00</td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td class="subtotal-td">Tax</td>
                                        <td class="subtotal-td" align="right">0%</td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td class="subtotal-total-td"><strong>Total</strong></td>
                                        <td class="subtotal-total-td" align="right"><strong>LKR <%= booking.getTotalPrice()%></strong></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="invoice__footer-section">
                            <p>Thank You for using Mega City Cab!</p>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="components/footer.jsp" %>
        </section>
    </body>
</html>
