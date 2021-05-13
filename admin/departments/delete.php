<?php 

session_start();

require_once '../../config/db.php';

$id = $_POST['id'] ?? null;

if ($id) {
    $stmt = $pdo->prepare("DELETE FROM department WHERE dnumber = :id");
    $stmt->bindValue(":id", $id);
    $stmt->execute();

    header("Location: view_all.php?uid=".$_SESSION['user_id']);
    exit;
} else {
    header("Location: view_all.php?uid=".$_SESSION['user_id']);
    exit;
}


?>