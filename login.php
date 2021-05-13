<?php 
// start session
session_start();

// import files
require_once 'config/db.php';
require_once 'components/functions/typeofuser.php';
require_once 'components/functions/sanitize.php';
require_once 'components/functions/datefunc.php';

// declare variables
$user = [
    "user_id" => "",
    "user_pass" => ""
];
$errors = [];

// if the server request method is post or the session array is not empty
if ($_SERVER['REQUEST_METHOD'] == 'POST' || !empty($_SESSION)) {

    // if post get the value if not get the value of session
    $user["user_id"] = sanitize($_POST['user_id']) ?? $_SESSION['user_id'];
    $user["user_pass"] = sanitize($_POST['user_pass']) ?? $_SESSION['user_pass'];

    // if post request has empty values show errors
    if (!$user["user_id"]) {
        $errors[] = "Error: Empty field Employee id";
    }
    if (!$user["user_pass"]) {
        $errors[] = "Error: Empty field Employee password";
    }

    // get the user info if the post request user id and password is correct
    $stmt = $pdo->prepare("SELECT emp_id FROM employee WHERE emp_id = :user_id AND pass = :user_pass");
    $stmt->bindValue(":user_id", $user['user_id']);
    $stmt->bindValue(":user_pass", $user['user_pass']);
    $stmt->execute();

    // fetch the array of user info
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // if the fetch return to false the user id and password is incorrect
    if (!empty($user)) {
        $id = $user['emp_id'];
        typeOfUser($pdo,$id);
    } else {
        $errors[] = "Wrong Employee Id or Password. Please try again.";
    }

}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kanban System</title>

    <!-- CSS -->
    <link rel="stylesheet" href="public/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col side">
            <div class="login-form lh-1">
                <div class="text-white title-size">Kanban</div>
                <span class="text-white text-muted muted-size">organize your workflow.</span>
            </div>
        </div>
        <div class="col my-auto">
            <div class="mx-auto login-form">
                <?php if ($errors):?>
                    <div class="alert alert-danger" role="alert">
                        <?php foreach ($errors as $error):?>
                            <p><?php echo $error;?></p>
                        <?php endforeach;?>
                    </div>
                <?php endif;?>
                <form method="POST" action="">
                    <div class="mb-3">
                        <label class="form-label">Employee ID</label>
                        <input type="text" class="form-control" name="user_id" value="<?php echo $user['user_id'] ?? "";?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" class="form-control" name="user_pass" value="<?php echo $user['user_pass'] ?? "";?>">
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include_once "components/base/bottom.php";?>