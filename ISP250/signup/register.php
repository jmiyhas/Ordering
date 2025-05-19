<?php
session_start();

// DB config
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "serumpun_db"; // Change to match your DB

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

// Get form data
$name     = $_POST['name'] ?? '';
$email    = $_POST['email'] ?? '';
$phone    = $_POST['phone'] ?? '';
$pass     = $_POST['password'] ?? '';
$role     = $_POST['role'] ?? 'regular'; // default

if (empty($name) || empty($email) || empty($pass)) {
    die("Please fill in all required fields.");
}

// Check for duplicate email
$stmt = $conn->prepare("SELECT * FROM Customer WHERE customer_email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows > 0) {
    die("Email already registered.");
}

// Hash password
$hashed_password = password_hash($pass, PASSWORD_DEFAULT);

// Insert new customer
$stmt = $conn->prepare("INSERT INTO Customer (customer_name, customer_email, customer_phone_number, customer_password, customer_user_type) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("sssss", $name, $email, $phone, $hashed_password, $role);

if ($stmt->execute()) {
    // Auto-login and redirect after signup
    $customer_id = $stmt->insert_id;

    $_SESSION['customer_id'] = $customer_id;
    $_SESSION['customer_name'] = $name;
    $_SESSION['customer_role'] = $role;

    header("Location: dashboard-user/index.html");
    exit();
} else {
    echo "Error: " . $stmt->error;
}

$conn->close();
?>
