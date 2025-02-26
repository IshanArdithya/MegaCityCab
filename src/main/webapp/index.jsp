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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    </head>
    <body>
        <%@ include file="components/header.jsp" %>

        <div class="slider-container">
            <div class="slider">
                <div class="low-dark"></div>
                <div class="slider-logobtn">
                    <div class="hero-content">
                        <h1>Welcome to Mega City Cab</h1>
                        <p>Your journey, our priority.</p>
                        <a href="#get-started" class="book-now">Get Started</a>
                        <a href="#book-now" class="book-now">Book Now</a>
                    </div>
                </div>
                <div class="list">
                    <div class="item"><img src="images/gallery/bg1.jpg" alt=""></div>
                    <div class="item"><img src="images/gallery/bg2.jpg" alt=""></div>
                    <div class="item"><img src="images/gallery/bg3.png" alt=""></div>
                </div>
                <div class="buttons">
                    <button id="prev"><</button>
                    <button id="next">></button>
                </div>
                <ul class="dots">
                    <li class="active"></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </div>
        <div class="container">
            <section id="key-features">
                <div class="features-container">
                    <div class="features-header-wrap">
                        <span class="features-badge">Services</span>
                        <h2 class="features-title">Why Choose Mega City Cab?</h2>
                    </div>
                    <div class="features-grid">
                        <div class="feature">
                            <div class="feature-icon-wrapper">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div class="feature-wrap">
                                <p class="feature-title">24/7 Availability</p>
                                <p class="feature-description">Book a ride anytime, anywhere.</p>
                            </div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon-wrapper">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                            <div class="feature-wrap">
                                <p class="feature-title">Affordable Pricing</p>
                                <p class="feature-description">Get the best rates without hidden fees.</p>
                            </div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon-wrapper">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            <div class="feature-wrap">
                                <p class="feature-title">Safe & Reliable</p>
                                <p class="feature-description">Trained drivers and secure rides.</p>
                            </div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon-wrapper">
                                <i class="fas fa-car"></i>
                            </div>
                            <div class="feature-wrap">
                                <p class="feature-title">Luxury & Comfort</p>
                                <p class="feature-description">Enjoy a smooth and premium ride.</p>
                            </div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon-wrapper">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="feature-wrap">
                                <p class="feature-title">GPS Tracking</p>
                                <p class="feature-description">Track your ride in real-time.</p>
                            </div>
                        </div>
                        <div class="feature">
                            <div class="feature-icon-wrapper">
                                <i class="fas fa-headset"></i>
                            </div>
                            <div class="feature-wrap">
                                <p class="feature-title">24/7 Customer Support</p>
                                <p class="feature-description">We’re always here to assist you.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div class="section-divider"></div>

            <section class="how-it-works">
                <h2 class="how-title">How It Works</h2>
                <div class="how-steps-wrapper">
                    <div class="how-step">
                        <div class="how-icon"><i class="fas fa-pencil-alt"></i></div>
                        <h3 class="how-step-title">Enter Details</h3>
                        <p>Provide your pickup and drop-off location along with trip details.</p>
                    </div>
                    <div class="how-arrow"><i class="fas fa-arrow-right"></i></div>

                    <div class="how-step">
                        <div class="how-icon"><i class="fas fa-taxi"></i></div>
                        <h3 class="how-step-title">Select Cab</h3>
                        <p>Choose the cab that suits your needs and budget.</p>
                    </div>
                    <div class="how-arrow"><i class="fas fa-arrow-right"></i></div>

                    <div class="how-step">
                        <div class="how-icon"><i class="fas fa-check-circle"></i></div>
                        <h3 class="how-step-title">Confirm Booking</h3>
                        <p>Review your details and confirm your ride instantly.</p>
                    </div>
                    <div class="how-arrow"><i class="fas fa-arrow-right"></i></div>

                    <div class="how-step">
                        <div class="how-icon"><i class="fas fa-road"></i></div>
                        <h3 class="how-step-title">Enjoy Your Ride</h3>
                        <p>Our driver picks you up and ensures a smooth journey.</p>
                    </div>
                </div>
            </section>

        </div>

        <%@ include file="components/footer.jsp" %>
        
        <script src="js/hero-section.js"></script>

    </body>
</html>
