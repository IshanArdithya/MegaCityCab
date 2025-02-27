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
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet" />
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
                        <h2 class="features-title main-title">Why Choose Mega City Cab?</h2>
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
                <span class="features-badge">Process</span>
                <h2 class="how-title main-title">How It Works</h2>
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

            <div class="section-divider"></div>

            <section class="testimonials-section">
                <span class="features-badge">Testimonials</span>
                <h1 class="main-title">What our customers say</h1>
                <div class="swiper testimonials-swiper">
                    <div class="swiper-wrapper">

                        <div class="swiper-slide">
                            <div class="testimonials-card">
                                <span><i class="ri-double-quotes-l"></i></span>
                                <h4>Reliable and Safe</h4>
                                <p>
                                    Always on time and super professional! The drivers are courteous, and I feel safe
                                    every time I use Mega City Cab.
                                </p>
                                <div>
                                    <img src="https://avatar.iran.liara.run/public" alt="user" />
                                    <h5>Allan Collins</h5>
                                    <h6>★★★★★</h6>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="testimonials-card">
                                <span><i class="ri-double-quotes-l"></i></span>
                                <h4>Best Cab Service</h4>
                                <p>
                                    The booking process is seamless, and the drivers know the city well. Affordable prices
                                    and excellent service!
                                </p>
                                <div>
                                    <img src="https://avatar.iran.liara.run/public" alt="user" />
                                    <h5>Tanya Grant</h5>
                                    <h6>★★★★★</h6>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="testimonials-card">
                                <span><i class="ri-double-quotes-l"></i></span>
                                <h4>Fast and Convenient</h4>
                                <p>
                                    Needed a last-minute ride to the airport, and Mega City Cab was there in no time!
                                </p>
                                <div>
                                    <img src="https://avatar.iran.liara.run/public" alt="user" />
                                    <h5>Clay Washington</h5>
                                    <h6>★★★★★</h6>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="testimonials-card">
                                <span><i class="ri-double-quotes-l"></i></span>
                                <h4>Professional Drivers</h4>
                                <p>
                                    Every driver I've had has been polite and professional. The cars are clean, and the rides
                                    are smooth. Great service every time!
                                </p>
                                <div>
                                    <img src="https://avatar.iran.liara.run/public" alt="user" />
                                    <h5>Emily Johnson</h5>
                                    <h6>★★★★★</h6>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="testimonials-card">
                                <span><i class="ri-double-quotes-l"></i></span>
                                <h4>Affordable and Transparent Pricing</h4>
                                <p>
                                    No hidden fees, and the pricing is very fair. Definitely the best cab service in town!
                                </p>
                                <div>
                                    <img src="https://avatar.iran.liara.run/public" alt="user" />
                                    <h5>Michael Brown</h5>
                                    <h6>★★★★★</h6>
                                </div>
                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="testimonials-card">
                                <span><i class="ri-double-quotes-l"></i></span>
                                <h4>Easy Booking Process</h4>
                                <p>
                                    Booking a cab has never been easier. Their system is user-friendly, and I always
                                    get instant confirmations. Super convenient!
                                </p>
                                <div>
                                    <img src="https://avatar.iran.liara.run/public" alt="user" />
                                    <h5>Sarah Lee</h5>
                                    <h6>★★★★★</h6>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="swiper-pagination"></div>
                </div>
            </section>

            <div class="section-divider"></div>

            <section id="faq-section">
                <span class="features-badge">FAQ</span>
                <h1 class="main-title">Frequently Asked Questions</h1>

                <div class="faq-container">
                    <div class="faq-item">
                        <div class="faq-question">
                            <h3>How do I get started?</h3>
                            <button class="faq-toggle">
                                <i class="ri-add-fill"></i>
                            </button>
                        </div>
                        <div class="faq-answer">
                            <p>Simply sign up, and once you're registered, you can book a cab right away!</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <div class="faq-question">
                            <h3>How do I book a cab?</h3>
                            <button class="faq-toggle">
                                <i class="ri-add-fill"></i>
                            </button>
                        </div>
                        <div class="faq-answer">
                            <p>Simply enter your pickup and drop-off details, select a cab, and confirm your booking.</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <div class="faq-question">
                            <h3>What areas do you service?</h3>
                            <button class="faq-toggle">
                                <i class="ri-add-fill"></i>
                            </button>
                        </div>
                        <div class="faq-answer">
                            <p>We offer Mega City Cab services across Sri Lanka, covering popular attractions and residential areas.</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <div class="faq-question">
                            <h3>Can I bring my pet during the ride?</h3>
                            <button class="faq-toggle">
                                <i class="ri-add-fill"></i>
                            </button>
                        </div>
                        <div class="faq-answer">
                            <p>Yes, pets are allowed. Drivers may ask that your pet sits on a blanket or tarp provided by them. Please note that by law, drivers have the right to decline the trip if this request is not followed.</p>
                        </div>
                    </div>
                </div>
            </section>

            <div class="section-divider"></div>

            <section id="contact-us-section">
                <span class="features-badge">Contact Us</span>
                <h1 class="main-title">Have a Question?</h1>

                <div class="contact-container">
                    <div class="contact-info">
                        <div>
                            <h2>Contact Information</h2>
                            <p>If you have any questions, Contact Us!</p>
                        </div>
                        <div class="contact-info-flex">
                            <div class="contact-info-icon">
                                <i class="ri-phone-fill"></i>
                            </div>
                            <div>
                                <p>+94 11 241 1231</p>
                                <p>+94 11 312 1561</p>
                            </div>
                        </div>
                        <div class="contact-info-flex">
                            <div class="contact-info-icon">
                                <i class="ri-mail-fill"></i>
                            </div>
                            <div>
                                <p>support@megacitycab.com</p>
                            </div>
                        </div>
                        <div class="contact-info-flex">
                            <div class="contact-info-icon">
                                <i class="ri-map-pin-2-fill"></i>
                            </div>
                            <div>
                                <p>Colombo, Sri Lanka</p>
                            </div>
                        </div>
                    </div>

                    <div class="contact-form">
                        <form class="contact-form-flex">

                            <div class="form-row">
                                <div class="form-group">
                                    <div class="entryarea">
                                        <input type="text" required>
                                        <div class="labelline">Name *</div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="entryarea">
                                        <input type="email" required>
                                        <div class="labelline">Email *</div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <div class="entryarea">
                                        <input type="text" required>
                                        <div class="labelline">Subject *</div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group">
                                    <div class="entryarea">
                                        <textarea></textarea>
                                        <div class="labelline">Message *</div>
                                    </div>
                                </div>
                            </div>


                            <button type="submit">Send Message</button>
                        </form>
                    </div>
                </div>
            </section>

        </div>

        <%@ include file="components/footer.jsp" %>

        <script src="js/hero-section.js"></script>
        <script src="js/testimonials-section.js"></script>
        <script src="js/faq-section.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    </body>
</html>
