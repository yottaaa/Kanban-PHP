<?php

session_start();

require_once '../../config/db.php';
require_once '../../components/functions/sanitize.php';

$id = $_GET['id'];
$errors = [];

$stmt = $pdo->prepare("SELECT * FROM employee WHERE emp_id = :id");
$stmt->bindValue(":id", $id);
$stmt->execute();
$data = $stmt->fetch(PDO::FETCH_ASSOC);

$stmt = $pdo->prepare("SELECT * FROM department");
$stmt->execute();
$depts = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $data['emp_id'] = sanitize($_POST['emp_id']);
    $data['pass'] = sanitize($_POST['pass']);
    $data['fname'] = ucfirst(strtolower(sanitize($_POST['fname'])));
    $data['mi'] = ucfirst(strtolower(sanitize($_POST['mi'])));
    $data['lname'] = ucfirst(strtolower(sanitize($_POST['lname'])));
    $data['sex'] = sanitize($_POST['sex']);
    $data['address'] = sanitize($_POST['address']);
    $data['bdate'] = sanitize($_POST['bdate']);
    $data['salary'] = (double) sanitize($_POST['salary']);
    $data['contact_no'] = sanitize($_POST['contact_no']);
    $data['dnum'] = (int) sanitize($_POST['dnum']);

    if (empty($data['emp_id'])) {
        $errors[] = "Error: Empty input in ID";
    }
    if (empty($data['pass'])) {
        $errors[] = "Error: Empty input in password";
    }
    if (empty($data['fname'])) {
        $errors[] = "Error: Empty input in firstname";
    }
    if (empty($data['lname'])) {
        $errors[] = "Error: Empty input in lastname";
    }
    if (empty($data['sex'])) {
        $errors[] = "Error: Empty input in sex";
    }
    if (empty($data['address'])) {
        $errors[] = "Error: Empty input in address";
    }
    if (empty($data['salary'])) {
        $errors[] = "Error: Empty input in salary";
    }

    if (empty($errors)) {
        $stmt = $pdo->prepare("UPDATE employee SET emp_id = :emp_id, pass = :pass, fname = :fname, mi = :mi,
                                lname = :lname, sex = :sex, address = :address, bdate = :bdate, salary = :salary,
                                contact_no = :contact_no, dnum = :dnum WHERE emp_id = :id");
        $stmt->bindValue(":id", $id);
        $stmt->bindValue(":emp_id", $data['emp_id']);
        $stmt->bindValue(":pass", $data['pass']);
        $stmt->bindValue(":fname", $data['fname']);
        $stmt->bindValue(":mi", $data['mi']);
        $stmt->bindValue(":lname", $data['lname']);
        $stmt->bindValue(":sex", $data['sex']);
        $stmt->bindValue(":address", $data['address']);
        $stmt->bindValue(":bdate", $data['bdate']);
        $stmt->bindValue(":salary", $data['salary']);
        $stmt->bindValue(":contact_no", $data['contact_no']);
        $stmt->bindValue(":dnum", $data['dnum']);
        $stmt->execute();

        header("Location: view_all.php?uid=".$_SESSION['user_id']."&dept=".$_SESSION['dept']);
        exit;
    }
}



?>

<?php include_once '../../components/base/top.php';?>

<div class="container">
    <div class="col-6 mx-auto mt-4 mb-4">
        <a href="view_all.php?uid=<?php echo $_SESSION['user_id'];?>">Back</a>

        <h1>Update Employee</h1>

        <?php if ($errors):?>
            <div class="alert alert-danger" role="alert">
            <?php foreach ($errors as $error):?>              
                    <p><?php echo $error;?></p>
            <?php endforeach;?>
            </div>
        <?php endif;?>

        <form action="" method="POST">
            <div class="mb-3">
                <label class="form-label">Employee ID</label>
                <input type="text" class="form-control" name="emp_id" value="<?php echo $data['emp_id'];?>">
            </div>
            <div class="mb-3">
                <label class="form-label">Employee Pass</label>
                <input type="text" class="form-control" name="pass" value="<?php echo $data['pass'];?>">
            </div>
            <div class="row">
                <div class="col-4 mb-3">
                    <label class="form-label">Last Name</label>
                    <input type="text" class="form-control" name="lname" value="<?php echo $data['lname'];?>">   
                </div>
                <div class="col-4 mb-3">
                    <label class="form-label">First Name</label>
                    <input type="text" class="form-control" name="fname" value="<?php echo $data['fname'];?>">   
                </div>
                <div class="col-4 mb-3">
                    <label class="form-label">Middle Initial</label>
                    <input type="text" class="form-control" name="mi" value="<?php echo $data['mi'];?>">   
                </div>
            </div>
            <div class="row">
                <div class="col-4 mb-3">
                    <label class="form-label">Sex</label>
                    <select class="form-select" name="sex">
                        <option selected value="<?php echo $data['sex'];?>"><?php echo $data['sex'] == 'M' ? 'Male' : 'Female';?></option>
                        <option value="M">Male</option>
                        <option value="F">Female</option>
                    </select>
                </div> 
                <div class="col-8 mb-3">
                    <label class="form-label">Birthdate</label>
                    <input type="date" class="form-control" name="bdate" value="<?php echo $data['bdate'];?>">
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">Address</label>
                <input type="text" class="form-control" name="address" value="<?php echo $data['contact_no'];?>">
            </div>
            <div class="mb-3">
                <label class="form-label">Salary</label>
                <input type="number" class="form-control" name="salary" value="<?php echo $data['salary'];?>">
            </div>
            <div class="mb-3">
                <label class="form-label">Contact Number</label>
                <input type="text" class="form-control" name="contact_no" value="<?php echo $data['contact_no'];?>">
            </div>
            <div class="mb-3">
                    <label class="form-label">Department</label>
                    <select class="form-select" name="dnum">
                        <option selected value="<?php echo $data['dnum']?>"><?php echo $data['dnum'];?></option>
                        <?php foreach ($depts as $dept):?>
                            <option value="<?php echo $dept['dnumber'];?>">
                                <?php echo $dept['dnumber']. " - ".$dept['dname'] . "(".$dept['dlocation'].")";?>
                            </option>
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