document.getElementById('togglePassword').addEventListener('click', function () {
    let passwordInput = document.getElementById('password');
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
    } else {
        passwordInput.type = 'password';
    }
});

document.getElementById('toggleConfirmedPassword').addEventListener('click', function () {
    let passwordInput = document.getElementById('confirmPassword');
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
    } else {
        passwordInput.type = 'password';
    }
});