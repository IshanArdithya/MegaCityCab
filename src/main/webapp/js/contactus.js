document.addEventListener("DOMContentLoaded", function () {
    const inputs = document.querySelectorAll(".entryarea input, .entryarea textarea");

    inputs.forEach(input => {
        if (input.value.trim() !== "") {
            input.classList.add("has-value");
        }
        
        input.addEventListener("input", function () {
            if (input.value.trim() !== "") {
                input.classList.add("has-value");
            } else {
                input.classList.remove("has-value");
            }
        });
        
        input.addEventListener("blur", function () {
            if (input.value.trim() !== "") {
                input.classList.add("has-value");
            } else {
                input.classList.remove("has-value");
            }
        });
    });
});