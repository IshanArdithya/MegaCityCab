
function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    let regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(url);
    if (!results)
        return null;
    if (!results[2])
        return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

const registerSuccess = getParameterByName('registersuccess');
if (registerSuccess === '1') {
    Swal.fire({
        icon: 'success',
        title: 'Registration Successful!',
        text: 'You have successfully registered. Please log in.',
        confirmButtonText: 'OK',
        customClass: {
            confirmButton: 'swal2-confirm'
        }
    });
}

const registerError = getParameterByName('registererror');
if (registerError === '1') {
    Swal.fire({
        icon: 'error',
        title: 'Registration Error',
        text: 'An error occurred during registration. Please try again.',
        confirmButtonText: 'OK',
        customClass: {
            confirmButton: 'swal2-confirm'
        }
    });
} else if (registerError === '3') {
    Swal.fire({
        icon: 'warning',
        title: 'Email Already Exists',
        text: 'The email you entered is already registered. Please use a different email.',
        confirmButtonText: 'OK',
        customClass: {
            confirmButton: 'swal2-confirm'
        }
    });
}
