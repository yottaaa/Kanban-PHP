<?php

session_start();

require_once '../../config/db.php';
require_once '../../components/functions/projectfunc.php';

if (!isset($_SESSION['user_id'])) { 
    header("Location: ../../index.php");
    exit;
}


$id = $_GET['pid'];
$status = ["ToDo","InProgress","Done"];
// get task data
$stmt = $pdo->prepare("SELECT tnumber,emp_id as assigned_id, CONCAT(fname,' ',mi,'. ',lname ) as 
                    assigned,emp_task.STATUS,title,description,date_start,deadline,task.pnum as pnum FROM task JOIN 
                    emp_task ON tnum = tnumber JOIN employee ON e_id = emp_id WHERE tnumber = :id");
$stmt->bindValue(":id", $id);
$stmt->execute();
$data = $stmt->fetch(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $stmt = $pdo->prepare("UPDATE emp_task SET STATUS = :status WHERE e_id = :e_id AND tnum = :id");
    $stmt->bindValue(":status", $_POST['status']);
    $stmt->bindValue(":id", $id);
    $stmt->bindValue(":e_id", $_SESSION['user_id']);
    $stmt->execute();

    if ($_POST['status'] == 'Done') {
        setProjectDone($pdo,$data['pnum']);
    }
    if ($_POST['status'] == 'InProgress' || $_POST['status'] == 'ToDo') {
        setProjectInProgress($pdo,$data['pnum']);
    }

    header("Location: view_all.php?uid=".$_SESSION['user_id'] . "&dept=" . $_SESSION['dept']);
    exit;
}

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

        <div class="mt-4 mb-4">
            <form action="" method="post">
            <div class="mb-3">
                <select class="form-select" name="status">
                    <option selected value="<?php echo $data['STATUS']?>"><?php echo $data['STATUS']?></option>
                    <?php for ($i=0; $i < count($status); $i++):?>
                        <option value="<?php echo $status[$i]?>"><?php echo $status[$i]?></option>
                    <?php endfor;?>
                </select>
            </div>
            <input type="submit" class="btn btn-sm btn-warning" value="Save"> 
            </form>
        </div>
        
    </div>
</div>

<?php include_once '../../components/base/bottom.php';?>