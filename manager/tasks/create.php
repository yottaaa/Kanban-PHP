<?php

session_start();

require_once '../../config/db.php';
require_once '../../components/functions/sanitize.php';
require_once '../../components/functions/projectfunc.php';


$data = ["tnumber" => "", "title" => "", "description" => "", "date_start" => date("Y-m-d"), 
        "deadline" => "", "pnum" => "", "e_id" => ""];
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
        // add task
        $stmt = $pdo->prepare("INSERT INTO task (title,description,date_start,deadline,pnum) 
                                VALUES (:title,:description,:date_start,:deadline,:pnum)");
        $stmt->bindValue(":title", $data['title']);
        $stmt->bindValue(":description", $data['description']);
        $stmt->bindValue(":date_start", $data['date_start']);
        $stmt->bindValue(":deadline", $data['deadline']);
        $stmt->bindValue(":pnum", $data['pnum']);
        $stmt->execute();

        // get the task id
        $stmt = $pdo->prepare("SELECT tnumber,pnum FROM task WHERE title = :title");
        $stmt->bindValue(":title", $data['title']);
        $stmt->execute();
        $task = $stmt->fetch(PDO::FETCH_ASSOC);

        // add to relationship
        $stmt = $pdo->prepare("INSERT INTO emp_task (e_id,tnum,STATUS) VALUES (:e_id,:tnumber,'ToDo')");
        $stmt->bindValue(":e_id", $data['e_id']);
        $stmt->bindValue(":tnumber", $task['tnumber']);
        $stmt->execute();

        setProjectInProgress($pdo,$task['pnum']);

        header("Location: view_all.php?uid=".$_SESSION['user_id'] . "&dept=" . $_SESSION['dept']);
        exit;
    }
}



?>

<?php include_once '../../components/base/top.php';?>

<div class="container">
    <div class="col-6 mx-auto mt-4 mb-4">
        <a href="view_all.php?uid=<?php echo $_SESSION['user_id']  . "&dept=" . $_SESSION['dept'];?>">Back</a>

        <h1>Add Task</h1>

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
                    <option selected></option>
                    <?php foreach($projects as $project):?>
                        <option value="<?php echo $project['pnumber']?>"><?php echo $project['title']?></option>
                    <?php endforeach;?>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Select Employee</label>
                <select class="form-select" name="e_id">
                    <option selected></option>
                    <?php foreach($employees as $employee):?>
                        <option value="<?php echo $employee['emp_id']?>"><?php echo $employee['name']?></option>
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