<?php

session_start();

require_once '../../config/db.php';
require_once '../../components/functions/sanitize.php';

$id = $_GET['id'];

// get the department info
$stmt = $pdo->prepare("SELECT * FROM department WHERE dnumber = :id");
$stmt->bindValue(":id", $id);
$stmt->execute();
$data = $stmt->fetch(PDO::FETCH_ASSOC);

// get employees id and name
$stmt = $pdo->prepare("SELECT emp_id,CONCAT(fname,' ',mi,'. ',lname) as name FROM employee");
$stmt->execute();
$employees = $stmt->fetchAll(PDO::FETCH_ASSOC);

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
        // update department
        $stmt = $pdo->prepare("UPDATE department SET dnumber = :dnumber,
                                dname = :dname, dlocation = :dlocation, Mgr_id = :mgr
                                WHERE dnumber = :id");
        $stmt->bindValue(":id", $id);
        $stmt->bindValue(":dnumber", $data['dnumber']);
        $stmt->bindValue(":dname", $data['dname']);
        $stmt->bindValue(":dlocation", $data['dlocation']);
        $stmt->bindValue(":mgr", $_POST['Mgr_id']);
        $stmt->execute();

        // update employee department
        $stmt = $pdo->prepare("UPDATE employee SET dnum = :dnum WHERE emp_id = :emp");
        $stmt->bindValue(":dnum", $data['dnumber']);
        $stmt->bindValue(":emp", $_POST['Mgr_id']);
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

        <h1>Update Department <?php echo $data['dname'];?></h1>

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
            <div class="mb-3">
                <label class="form-label">Department Manager</label>
                <select class="form-select" name="Mgr_id">
                    <option selected value="<?php echo $data['Mgr_id'];?>"><?php echo $data['Mgr_id'];?></option>
                    <?php foreach ($employees as $employee):?>
                        <option value="<?php echo $employee['emp_id']?>"><?php echo $employee['emp_id']." - ".$employee['name']?></option>
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