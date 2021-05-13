<?php 

session_start();

require_once 'config/db.php';
require_once 'components/functions/datefunc.php';

// before we unset the session we need to insert a logout recordc in logs
$stmt = $pdo->prepare("INSERT INTO employee_logs (e_id,date,time,active) VALUES
                        (:e_id,:date,:time,0)");
$stmt->bindValue(":e_id", $_SESSION['user_id']);
$stmt->bindValue(":date", date("Y-m-d"));
$stmt->bindValue(":time", date("H:i:s"));
$stmt->execute();

// remove all session variables stored
session_unset();

// destroy session
session_destroy();

// redirect to login
header("Location: login.php");


?>