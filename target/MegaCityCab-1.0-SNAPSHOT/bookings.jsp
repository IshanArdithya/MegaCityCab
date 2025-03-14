<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bookings | Mega City Cab</title>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                                        <input type="text" id="pickupLocation" placeholder="Pickup Location">
                                        <span class="arrow">➝</span>
                                        <input type="text" id="dropoffLocation" placeholder="Drop Location">
                                    </div>
                                    <div class="booking__inputs">
                                        <input type="datetime-local" id="bookingDateTime" value="2025-04-03T22:05">
                                    </div>
                                </div>
                                <div class="booking__content-box booking__border">
                                    <span>Select a Cab</span>
                                    <div class="vehicle__options">
                                        <a href="javascript:void(0)" class="vehicle__btn" data-passenger-count="4" onclick="selectVehicle(event, this)">
                                            <i class="ri-car-fill"></i>4 Seater<span>LKR 0.00</span>
                                        </a>
                                        <a href="javascript:void(0)" class="vehicle__btn" data-passenger-count="9" onclick="selectVehicle(event, this)">
                                            <i class="ri-bus-2-fill"></i>9 Seater<span>LKR 0.00</span>
                                        </a>
                                        <a href="javascript:void(0)" class="vehicle__btn" data-passenger-count="14" onclick="selectVehicle(event, this)">
                                            <i class="ri-bus-fill"></i>14 Seater<span>LKR 0.00</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <button class="book__now" onclick="showCheckoutForm()">Book Now</button>
                        </div>

                        <div class="booking__row">
                            <!-- checkout form - hidden (only show when click book now) -->
                            <div id="checkoutForm" class="checkout-form booking__content-box booking__border" style="display: none;">
                                <h3>Checkout</h3>
                                <div class="contact-form">
                                    <form class="contact-form-flex" id="billingForm">
                                        <div class="form-row">
                                            <div class="form-group">
                                                <div class="entryarea">
                                                    <input type="text" id="firstName" name="firstName" required>
                                                    <div class="labelline">First Name *</div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="entryarea">
                                                    <input type="text" id="lastName" name="lastName" required>
                                                    <div class="labelline">Last Name *</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group">
                                                <div class="entryarea">
                                                    <input type="text" id="address1" name="address1" required>
                                                    <div class="labelline">Address *</div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="entryarea">
                                                    <input type="text" id="address2" name="address2">
                                                    <div class="labelline">Address 2</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group">
                                                <div class="entryarea">
                                                    <input type="text" id="city" name="city" required>
                                                    <div class="labelline">City *</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group">
                                                <div class="entryarea">
                                                    <input type="text" id="phoneNumber" name="phoneNumber" required>
                                                    <div class="labelline">Contact Number *</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group">
                                                <div class="entryarea">
                                                    <input type="email" id="email" name="email" required>
                                                    <div class="labelline">Email *</div>
                                                </div>
                                            </div>
                                        </div>

                                        <button type="button" class="confirm-booking" onclick="confirmBooking()">Confirm Booking</button>
                                    </form>
                                </div>
                            </div>
                        </div>
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
                                        <div class="vehicle__features booking__passengers">
                                            <span class="booking__price">Price: LKR 0.00</span>
                                        </div>
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

        <script>
    let selectedPassengerCount = null;

    function selectVehicle(event, button) {
        event.preventDefault();

        const buttons = document.querySelectorAll('.vehicle__btn');
        buttons.forEach(btn => btn.classList.remove('active'));

        button.classList.add('active');

        selectedPassengerCount = button.getAttribute('data-passenger-count');

        fetchPrice(selectedPassengerCount);
    }

    function fetchPrice(passengerCount) {
        fetch('/MegaCityCab/getPrice?passengerCount=' + passengerCount)
            .then(response => response.json())
            .then(data => {
                const priceElement = document.querySelector('.booking__price');
                const price = parseFloat(data.price);
                if (!isNaN(price)) {
                    priceElement.textContent = `Price: LKR ${price.toFixed(2)}`;
                } else {
                    console.error("Invalid price value:", data.price);
                }
            })
            .catch(error => {
                console.error('Error fetching price:', error);
            });
    }

    function showCheckoutForm() {
        if (!selectedPassengerCount) {
            alert("Please select a vehicle.");
            return;
        }

        // display checkout form
        document.getElementById('checkoutForm').style.display = 'block';
    }

    function confirmBooking() {
    const pickupLocation = document.getElementById('pickupLocation').value;
    const dropoffLocation = document.getElementById('dropoffLocation').value;
    const bookingDateTime = document.getElementById('bookingDateTime').value;
    const [date, time] = bookingDateTime.split('T');

    const billingData = {
        firstName: document.getElementById('firstName').value,
        lastName: document.getElementById('lastName').value,
        address1: document.getElementById('address1').value,
        address2: document.getElementById('address2').value,
        city: document.getElementById('city').value,
        phoneNumber: document.getElementById('phoneNumber').value,
        email: document.getElementById('email').value,
        pickupLocation: pickupLocation,
        dropoffLocation: dropoffLocation,
        date: date,
        time: time,
        passengerCount: parseInt(selectedPassengerCount)
    };

    // Send billing data to server
    fetch('/MegaCityCab/book', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(billingData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(data.bookingId);

            Swal.fire({
                icon: 'success',
                title: 'Booking Successful!',
                text: 'Your booking has been confirmed.',
                showCancelButton: true,
                confirmButtonText: 'View Invoice',
                cancelButtonText: 'Close',
            }).then((result) => {
                if (result.isConfirmed) {
                    // redirect to invoice
                    window.location.href = "/MegaCityCab/invoice?bookingId=" + data.bookingId;
                }
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Error!',
                text: 'Failed to save booking: ' + data.message,
                confirmButtonText: 'OK'
            });
        }
    })
    .catch(error => {
        console.error('Error booking:', error);
        Swal.fire({
            icon: 'error',
            title: 'Error!',
            text: 'An error occurred while processing your booking.',
            confirmButtonText: 'OK'
        });
    });
}
        </script>
    </body>
</html>
