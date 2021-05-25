<?php

session_start();

require_once '../../config/db.php';

if (!isset($_SESSION['user_id'])) { 
    header("Location: ../../index.php");
    exit;
}


$pid = $_GET['pid'];

// get projects data
$stmt = $pdo->prepare("SELECT * FROM project WHERE pnumber = :pid");
$stmt->bindValue(":pid", $pid);
$stmt->execute();
$data = $stmt->fetch(PDO::FETCH_ASSOC);

// get members of projects
$stmt = $pdo->prepare("SELECT emp_id, CONCAT(fname, ' ', mi, '. ', lname) as name FROM employee 
                        JOIN emp_proj ON emp_id = e_id WHERE pnum = :pnumber");
$stmt->bindValue(":pnumber", $data['pnumber']);
$stmt->execute();
$members = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<?php include_once '../../components/base/top.php';?>

<div class="container">
    <div class="col-8 mx-auto mt-4">
        <a href="view_all.php?uid=<?php echo $_SESSION['user_id'] . "&dept=". $_SESSION['dept'];?>">Back</a>

        <h1><?php echo $data['title'];?></h1>

        <p class="text-muted"><i>Started at <?php echo $data['date_start'];?></i></p>

        <h5>Description:</h5>
        <p><?php echo $data['description'] ? $data['description'] : "No description yet";?></p>

        <p class="text-muted"><i>Deadline: <?php echo $data['deadline'];?></i></p>

        <h5>Members:</h5>
        <?php if ($members):?>
            <div class="d-flex flex-wrap">
            <?php foreach ($members as $member):?>
                <span class="me-3 p-2 badge rounded-pill bg-primary"><?php echo $member['name'];?></span>
            <?php endforeach;?>
            </div>
        <?php else: ?>
            <p>No members yet</p>
        <?php endif;?>

        <div class="row mt-4 mb-4 px-3">
            <a href="update.php?id=<?php echo $data['pnumber'];?>" class="col-6 btn btn-warning btn-sm">Edit</a>
            <a href="delete.php?id=<?php echo $data['pnumber'];?>" class="col-6 btn btn-danger btn-sm">Delete</a>
        </div>
        
    </div>
</div>

<?php include_once '../../components/base/bottom.php';?>