<?php

session_start();

require_once '../../config/db.php';

if (!isset($_SESSION['user_id'])) { 
    header("Location: ../../index.php");
    exit;
}


$id = $_GET['pid'];

// get task data
$stmt = $pdo->prepare("SELECT tnumber,emp_id as assigned_id, CONCAT(fname,' ',mi,'. ',lname ) as 
                    assigned,emp_task.STATUS,title,description,date_start,deadline,task.pnum FROM task JOIN 
                    emp_task ON tnum = tnumber JOIN employee ON e_id = emp_id WHERE tnumber = :id");
$stmt->bindValue(":id", $id);
$stmt->execute();
$data = $stmt->fetch(PDO::FETCH_ASSOC);

// // get the assigned employee
// $stmt = $pdo->prepare("SELECT emp_id, CONCAT(fname, ' ', mi, '. ', lname) as name FROM employee 
//                      WHERE emp_id = :");
// $stmt->bindValue(":tnumber", $data['tnumber']);
// $stmt->execute();
// $assigned = $stmt->fetch(PDO::FETCH_ASSOC);

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

        <h5>Assigned employee:</h5>
        <?php if ($data['assigned']):?>
            <div class="d-flex flex-wrap">
                <span class="me-3 p-2 badge rounded-pill bg-primary"><?php echo $data['assigned'];?></span>
            </div>
        <?php else: ?>
            <p>No assigned employee yet</p>
        <?php endif;?>

        <div class="row mt-4 mb-4 px-3">
            <a href="update.php?id=<?php echo $data['tnumber'];?>" class="col-6 btn btn-warning btn-sm">Edit</a>
            <form action="delete.php" method="post" class="col-6">
                <input type="hidden" name="id" value="<?php echo $data['tnumber'];?>">
                <button type="submit" class="col-12 btn btn-danger btn-sm">Delete</button>
            </form>
        </div>
        
    </div>
</div>

<?php include_once '../../components/base/bottom.php';?>