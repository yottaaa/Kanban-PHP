<?php

session_start();

require_once '../../config/db.php';
require_once '../../components/functions/sanitize.php';

$data = [
    "dnumber" => "",
    "dname" => "",
    "dlocation" => ""
];
$errors = [];
if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $data['dnumber'] = (int) sanitize($_POST['dnumber']);
    $data['dname'] = sanitize($_POST['dname']);
    $data['dlocation'] = sanitize($_POST['dlocation']);

    if (empty($data['dnumber'])) {
        $errors[] = "Error: Empty input in Department ID";
    }
    if (empty($data['dname'])) {
        $errors[] = "Error: Empty input in Department Name";
    }
    if (empty($data['dlocation'])) {
        $errors[] = "Error: Empty input in Department Location";
    }

    if (empty($errors)) {
        $stmt = $pdo->prepare("INSERT INTO department (dnumber,dname,dlocation) 
                                VALUES (:dnumber,:dname,:dlocation)");
        $stmt->bindValue(":dnumber", $data['dnumber']);
        $stmt->bindValue(":dname", $data['dname']);
        $stmt->bindValue(":dlocation", $data['dlocation']);
        $stmt->execute();

        header("Location: view_all.php?uid=".$_SESSION['user_id']."&dept=".$_SESSION['dept']);
        exit;
    }
}



?>

<?php include_once '../../components/base/top.php';?>

<div class="container">
    <div class="col-6 mx-auto mt-4">
        <a href="view_all.php?uid=<?php echo $_SESSION['user_id'];?>">Back</a>

        <h1>Add Department</h1>

        <?php if ($errors):?>
            <div class="alert alert-danger" role="alert">
            <?php foreach ($errors as $error):?>              
                    <p><?php echo $error;?></p>
            <?php endforeach;?>
            </div>
        <?php endif;?>

        <form action="" method="POST">
            <div class="mb-3">
                <label class="form-label">Department ID</label>
                <input type="number" class="form-control" name="dnumber" value="<?php echo $data['dnumber'];?>">
            </div>
            <div class="mb-3">
                <label class="form-label">Department Name</label>
                <input type="text" class="form-control" name="dname" value="<?php echo $data['dname'];?>">
            </div>
            <div class="mb-3">
                <label class="form-label">Department Location</label>
                <input type="text" class="form-control" name="dlocation" value="<?php echo $data['dlocation'];?>">   
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>

<?php include_once '../../components/base/bottom.php';?>