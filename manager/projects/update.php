<?php

session_start();

require_once '../../config/db.php';
require_once '../../components/functions/sanitize.php';

// store GET value
$id = $_GET['id'];

// get the info from project where the id is from the GET request
$stmt = $pdo->prepare("SELECT * FROM project WHERE pnumber = :id");
$stmt->bindValue(":id", $id);
$stmt->execute();
$data = $stmt->fetch(PDO::FETCH_ASSOC);

$errors = [];

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $data['title'] = sanitize($_POST['title']);
    $data['description'] = sanitize($_POST['description']);
    $data['date_start'] = sanitize($_POST['date_start']);
    $data['deadline'] = sanitize($_POST['deadline']);

    if (empty($data['title'])) {
        $errors[] = "Error: Empty input in Project title";
    }

    if (empty($errors)) {
        // add project
        $stmt = $pdo->prepare("UPDATE project SET title=:title,description=:description,
                                date_start=:date_start,deadline=:deadline WHERE pnumber=:id");
        $stmt->bindValue(":id", $id);
        $stmt->bindValue(":title", $data['title']);
        $stmt->bindValue(":description", $data['description']);
        $stmt->bindValue(":date_start", $data['date_start']);
        $stmt->bindValue(":deadline", $data['deadline']);
        $stmt->execute();

        // // get the project info
        // $stmt = $pdo->prepare("SELECT pnumber FROM project WHERE title= :title");
        // $stmt->bindValue(":title", $data['title']);
        // $stmt->execute();
        // $project = $stmt->fetch(PDO::FETCH_ASSOC);

        // // add to relationship
        // $stmt = $pdo->prepare("INSERT INTO dept_proj (dnum,pnum,STATUS) VALUES (:dnumber,:pnumber,'ToDo')");
        // $stmt->bindValue(":dnumber", $_SESSION['dept']);
        // $stmt->bindValue(":pnumber", $project['pnumber']);
        // $stmt->execute();

        header("Location: view_all.php?uid=".$_SESSION['user_id'] . "&dept=" . $_SESSION['dept']);
        exit;
    }
}



?>

<?php include_once '../../components/base/top.php';?>

<div class="container">
    <div class="col-6 mx-auto mt-4">
        <a href="view_all.php?uid=<?php echo $_SESSION['user_id']  . "&dept=" . $_SESSION['dept'];?>">Back</a>

        <h1>Edit <?php echo $data['title'];?></h1>

        <?php if ($errors):?>
            <div class="alert alert-danger" role="alert">
            <?php foreach ($errors as $error):?>              
                    <p><?php echo $error;?></p>
            <?php endforeach;?>
            </div>
        <?php endif;?>

        <form action="" method="POST">
            <div class="mb-3">
                <label class="form-label">Project name</label>
                <input type="text" class="form-control" name="title" value="<?php echo $data['title'];?>">
            </div>
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea class="form-control" rows="3" name="description"><?php echo $data['description'];?></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Date start</label>
                <input type="date" class="form-control" name="date_start" value="<?php echo $data['date_start'];?>">   
            </div>
            <div class="mb-3">
                <label class="form-label">Deadline</label>
                <input type="date" class="form-control" name="deadline" value="<?php echo $data['deadline'];?>">   
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>

<?php include_once '../../components/base/bottom.php';?>