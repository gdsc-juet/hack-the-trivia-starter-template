document.addEventListener('DOMContentLoaded', function () {
    var form = document.querySelector('form');

    form.addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent the form from submitting

        // Get the values entered by the user
        var username = document.getElementById('username').value.trim();
        var password = document.getElementById('password').value.trim();


        // Check if username and password match
        if (username === "231b297" && password === "isatyamks") {
            
            window.location.href = "../index.html";
        } else {
            // Show error message or perform other actions
            alert("Invalid username or password. Please try again.");
        }
    });
});
