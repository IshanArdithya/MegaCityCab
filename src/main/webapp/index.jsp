<%-- 
    Document   : index
    Created on : Feb 23, 2025, 1:30:46 AM
    Author     : IshanPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mega City Cab</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>


        <div class="hero-container">
            <img src="images/gallery/bg1.jpg" class="active" alt="Background Image 1">
            <img src="images/gallery/bg2.jpg" alt="Background Image 2">
            <img src="images/gallery/bg3.png" alt="Background Image 3">
            
            <%@ include file="components/header.jsp" %>

            <div class="hero-content">
                <h1>Welcome to Mega City Cab</h1>
                <p>Your journey, our priority.</p>
                <button class="book-now">Book Now</button>
            </div>
        </div>

        <div class="container">
            
        </div>
        <%@ include file="components/footer.jsp" %>
        
<!--        <script src="js/hero-section.js"></script>-->
    </body>
</html>
