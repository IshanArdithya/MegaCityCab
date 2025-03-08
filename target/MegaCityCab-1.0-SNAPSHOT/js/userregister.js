document.addEventListener("DOMContentLoaded", function () {
    const registerForm = document.querySelector(".register form");
    const passwordInput = document.querySelector(".register form input[name='password']");
    const confirmPasswordInput = document.querySelector(".register form input[name='confirmPassword']");
    const errorMessage = document.querySelector(".error-message");

    registerForm.addEventListener("submit", function (event) {
        passwordInput.classList.remove("error");
        confirmPasswordInput.classList.remove("error");
        errorMessage.style.display = "none";

        if (passwordInput.value.trim() !== confirmPasswordInput.value.trim()) {
            event.preventDefault();
            passwordInput.classList.add("error");
            confirmPasswordInput.classList.add("error");
            errorMessage.style.display = "block";
        }
    });
});