document.addEventListener("DOMContentLoaded", function () {
    const registerForm = document.querySelector("#signupBox form");
    const passwordInput = document.querySelector("#signupBox form input[name='registerPassword']");
    const confirmPasswordInput = document.querySelector("#signupBox form input[name='registerConfirmPassword']");
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