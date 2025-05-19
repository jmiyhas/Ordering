<?php
session_start();

// DB config
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "serumpun_db";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

// Get login input
$email = $_POST['email'] ?? '';
$pass  = $_POST['password'] ?? '';

if (empty($email) || empty($pass)) {
    die("Please enter both email and password.");
}

// Fetch user by email
$stmt = $conn->prepare("SELECT * FROM Customer WHERE customer_email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    $user = $result->fetch_assoc();
    
    if (password_verify($pass, $user['customer_password'])) {
        // Login success
        $_SESSION['customer_id'] = $user['customer_id'];
        $_SESSION['customer_name'] = $user['customer_name'];
        $_SESSION['customer_role'] = $user['customer_user_type'];

        // Redirect based on role
        if ($user['customer_user_type'] === 'staff') {
            header("Location: ../dashboard-staff/index.html");
        } else {
            header("Location: ../dashboard-user/index.html");
        }
        exit();
    } else {
        echo "Incorrect password.";
    }
} else {
    echo "No account found for this email.";
}

$conn->close();
?>
