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
                const passengerElement = document.querySelector('.passenger-count')
                const price = parseFloat(data.price);
                if (!isNaN(price)) {
                    priceElement.textContent = price.toFixed(2);
                } else {
                    console.error("Invalid price value:", data.price);
                }
                passengerElement.textContent = passengerCount + " Passengers";
            })
            .catch(error => {
                console.error('Error fetching price:', error);
            });
}

function showCheckoutForm() {
    const pickupLocation = document.getElementById('pickupLocation').value.trim();
    const dropoffLocation = document.getElementById('dropoffLocation').value.trim();
    
    let errorMessage = '';
    
    if (!selectedPassengerCount) {
        errorMessage = 'Please select a vehicle.';
    }

    if (!dropoffLocation) {
        errorMessage = 'Please enter a dropoff location.';
    }
    
    if (!pickupLocation) {
        errorMessage = 'Please enter a pickup location.';
    }
    
    if (errorMessage) {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: errorMessage,
        });
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
                        preConfirm: () => {
        // Open invoice in a new tab
        window.open("/MegaCityCab/invoice?bookingId=" + data.bookingId, "_blank");
        return false; // Prevent closing
    },
                    }).then((result) => {
                        if (result.isConfirmed) {
                            // redirect to invoice
                            window.open("/MegaCityCab/invoice?bookingId=" + data.bookingId, "_blank");
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

async function fetchAndDisplayPrices() {
    const vehicleButtons = document.querySelectorAll('.vehicle__btn');

    try {
        // fetch all prices
        const response = await fetch('/MegaCityCab/getAllPrices');
        const data = await response.json();

        // update price for each vehicle btn
        vehicleButtons.forEach(button => {
            const passengerCount = button.getAttribute('data-passenger-count');
            const price = parseFloat(data[passengerCount]);

            if (!isNaN(price)) {
                const priceElement = button.querySelector('.price');
                priceElement.textContent = "LKR " + price.toFixed(2);
            } else {
                console.error("Invalid price value for passenger count " + passengerCount + ":", data[passengerCount]);
            }
        });
    } catch (error) {
        console.error('Error fetching prices:', error);
    }
}

window.onload = fetchAndDisplayPrices;