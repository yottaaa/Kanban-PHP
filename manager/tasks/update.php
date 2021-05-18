<?php

session_start();

require_once '../../config/db.php';
require_once '../../components/functions/sanitize.php';

// store GET value
$id = $_GET['id'];

// get the info from task where the id is from the GET request
$stmt = $pdo->prepare("SELECT tnumber,title,description,date_start,deadline,pnum,e_id FROM task JOIN emp_task 
                        ON tnumber = tnum WHERE tnumber = :id");
$stmt->bindValue(":id", $id);
$stmt->execute();
$data = $stmt->fetch(PDO::FETCH_ASSOC);

$errors = [];

// get all employees id and name
$stmt = $pdo->prepare("SELECT emp_id, CONCAT(fname,' ',mi,'. ',lname) as name FROM employee WHERE dnum = :dept");
$stmt->bindValue(":dept", $_SESSION['dept']);
$stmt->execute();
$employees = $stmt->fetchAll(PDO::FETCH_ASSOC);

// get all project id and name
$stmt = $pdo->prepare("SELECT pnumber,title FROM project JOIN dept_proj ON pnumber = pnum WHERE dnum = :dept");
$stmt->bindValue(":dept", $_SESSION['dept']);
$stmt->execute();
$projects = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $data['title'] = sanitize($_POST['title']);
    $data['description'] = sanitize($_POST['description']);
    $data['date_start'] = sanitize($_POST['date_start']);
    $data['deadline'] = sanitize($_POST['deadline']);
    $data['pnum'] = $_POST['pnum'];
    $data['e_id'] = $_POST['e_id'];

    if (empty($data['title'])) {
        $errors[] = "Error: Empty input in Project title.";
    }
    if (empty($data['pnum'])) {
        $errors[] = "Error: Select a project.";
    }
    if (empty($data['e_id'])) {
        $errors[] = "Error: Select an assigned employee.";
    }

    if (empty($errors)) {
        // add project
        $stmt = $pdo->prepare("UPDATE task SET title = :title,description = :description,date_start = :date_start,
                                deadline = :deadline,pnum = :pnum WHERE tnumber = :tnumber");
        $stmt->bindValue(":tnumber", $data['tnumber']);                        
        $stmt->bindValue(":title", $data['title']);
        $stmt->bindValue(":description", $data['description']);
        $stmt->bindValue(":date_start", $data['date_start']);
        $stmt->bindValue(":deadline", $data['deadline']);
        $stmt->bindValue(":pnum", $data['pnum']);
        $stmt->execute();

        // update to relationship
        $stmt = $pdo->prepare("UPDATE emp_task SET e_id = :e_id,tnum = :tnumber WHERE tnum = :tnumber");
        $stmt->bindValue(":e_id", $data['e_id']);
        $stmt->bindValue(":tnumber", $data['tnumber']);
        $stmt->execute();

        header("Location: view_all.php?uid=".$_SESSION['user_id'] . "&dept=" . $_SESSION['dept']);
        exit;
    }
}



?>

<?php include_once '../../components/base/top.php';?>

<div class="container">
    <div class="col-6 mx-auto mt-4 mb-4">
        <a href="view.php?pid=<?php echo $id;?>">Back</a>

        <h1>Update <?php echo $data['title']?></h1>

        <?php if ($errors):?>
            <div class="alert alert-danger" role="alert">
            <?php foreach ($errors as $error):?>              
                    <p><?php echo $error;?></p>
            <?php endforeach;?>
            </div>
        <?php endif;?>

        <form action="" method="POST">
            <div class="mb-3">
                <label class="form-label">Task name</label>
                <input type="text" class="form-control" name="title" value="<?php echo $data['title'];?>">
            </div>
            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea class="form-control" rows="3" name="description" value="<?php echo $data['description'];?>"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Date start</label>
                <input type="date" class="form-control" name="date_start" value="<?php echo $data['date_start'];?>">   
            </div>
            <div class="mb-3">
                <label class="form-label">Deadline</label>
                <input type="date" class="form-control" name="deadline" value="<?php echo $data['deadline'];?>">   
            </div>
            <div class="mb-3">
                <label class="form-label">Select Project</label>
                <select class="form-select" name="pnum">
                    <option selected value="<?php echo $data['pnum']?>"><?php echo $data['pnum']?></option>
                    <?php foreach($projects as $project):?>
                        <option value="<?php echo $project['pnumber']?>"><?php echo $project['pnumber']." (".$project['title'].")"?></option>
                    <?php endforeach;?>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Select Employee</label>
                <select class="form-select" name="e_id">
                    <option selected value="<?php echo $data['e_id']?>"><?php echo $data['e_id']?></option>
                    <?php foreach($employees as $employee):?>
                        <option value="<?php echo $employee['emp_id']?>"><?php echo $employee['emp_id']." (".$employee['name'].")"?></option>
                    <?php endforeach;?>
                </select>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </form>
    </div>
</div>

<?php include_once '../../components/base/bottom.php';?>