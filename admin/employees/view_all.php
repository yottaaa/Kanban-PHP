<?php 
session_start();

require_once '../../config/db.php';
require_once '../../components/functions/datefunc.php';

deadline($pdo);

if (!isset($_SESSION['user_id'])) { 
    header("Location: ../../index.php");
    exit;
}

$links = [
    ["Departments","building", "../departments/view_all.php?uid=" . $_SESSION['user_id']],
    ["Employees","users", "../employees/view_all.php?uid=" . $_SESSION['user_id']], 
    ["Projects","cubes", "../projects/view_all.php?uid=" . $_SESSION['user_id']],
    ["Tasks","tasks", "../tasks/view_all.php?uid=" . $_SESSION['user_id']],
    ["Logs","file-alt", "../logs/view_all.php?uid="  . $_SESSION['user_id']],
    ["Logout","sign-out-alt", "../../logout.php"]
];

$actions = true;
$attributes = ["ID","Name","Password","Sex","Address","Birthdate","Salary","Contact No.","Dept No."];

$id = $_SESSION['user_id'];

$stmt = $pdo->prepare("SELECT emp_id,pass, CONCAT(fname, ' ', mi, '. ', lname) as name, sex, address, bdate, 
                        salary, contact_no, dnum FROM employee");
$stmt->execute();
$datas = $stmt->fetchAll(PDO::FETCH_ASSOC);

$search = $_GET['search'] ?? '';
if ($search) {
    $stmt = $pdo->prepare("SELECT emp_id,pass, CONCAT(fname, ' ', mi, '. ', lname) as name, sex, address, bdate, 
                            salary, contact_no, dnum FROM employee WHERE emp_id LIKE :search or CONCAT(fname, ' ', mi, '. ',lname) 
                            LIKE :search");
    $stmt->bindValue(":search", "%$search%");
    $stmt->execute();
    $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
}


?>

<?php include_once '../../components/base/top.php';?>

<div class="app">

<?php include_once '../../components/sidebar.php';?>

<h1>Employees</h1>

<div class="row mb-4 mt-5">
    <div class="col">
        <a href="create.php" class="btn btn-primary">Add Employee</a>
    </div>
    <div class="col-10">
         <form>
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search id or name" name="search">
                <button class="btn btn-primary" type="submit" >Search</button>
            </div>
        </form>
    </div>
</div>

<?php include_once '../../components/table/table_top.php';?>
        <?php foreach ($datas as $data):?>
            <tr>
                <th><?php echo $data['emp_id'];?></th>
                <td><?php echo $data['name'];?></td>
                <td><?php echo $data['pass'];?></td>
                <td><?php echo $data['sex'];?></td>
                <td><?php echo $data['bdate'];?></td>
                <td><?php echo $data['bdate'];?></td>
                <td><?php echo $data['salary'];?></td>
                <td><?php echo $data['contact_no'];?></td>
                <td><?php echo $data['dnum'];?></td>
                <td>
                    <a href="update.php?id=<?php echo $data['emp_id'];?>" class="btn btn-warning btn-sm">Edit</a>
                    <form action="delete.php" method="post" style="display: inline-block;">
                        <input type="hidden" name="id" value="<?php echo $data['emp_id'];?>">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
        <?php endforeach;?>  
<?php include_once '../../components/table/table_bot.php';?>

</div>
<?php include_once '../../components/base/bottom.php';?>