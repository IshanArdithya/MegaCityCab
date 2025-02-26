document.addEventListener("DOMContentLoaded", function () {
    const images = document.querySelectorAll(".hero-container img");
    let currentIndex = 0;

    function changeImage() {
        let nextIndex = (currentIndex + 1) % images.length;

        // Fade out current image
        images[currentIndex].classList.remove("active");

        // Fade in next image
        images[nextIndex].classList.add("active");

        // Update index
        currentIndex = nextIndex;
    }

    // Initial activation
    images[0].classList.add("active");

    // Change images every 2 seconds
    setInterval(changeImage, 2000);
});
