<?php 
session_start();

require_once '../../config/db.php';
require_once '../../components/functions/datefunc.php';

deadline($pdo);

if (!isset($_SESSION['user_id'])) { 
    header("Location: ../../index.php");
    exit;
}

// set session id to new variable
$id = $_SESSION['user_id'];

// for navigation 
$links = [
    ["Employees","users", "../employees/view_all.php?uid=" . $_SESSION['user_id']], 
    ["Projects","cubes", "../projects/view_all.php?uid=" . $_SESSION['user_id']],
    ["Tasks","tasks", "../tasks/view_all.php?uid=" . $_SESSION['user_id']],
    ["Logout","sign-out-alt", "../../logout.php"]
];

$actions = false;
$attributes = ["ID","Name","Sex","Address","Salary","Contact No.","Time","Active"];

$stmt = $pdo->prepare("SELECT emp_id,CONCAT(fname,' ',mi,'. ',lname) as name,sex,address,salary,contact_no,time,
                    IF(active = 1,'ACTIVE', 'NOT ACTIVE') as active FROM employee JOIN employee_logs 
                    ON emp_id = e_id WHERE dnum = :dept AND employee_logs.date = :date ORDER BY time DESC");
$stmt->bindValue(":dept", $_SESSION['dept']);
$stmt->bindValue(":date", date("Y-m-d"));
$stmt->execute();
$datas = $stmt->fetchAll(PDO::FETCH_ASSOC);

$search = $_GET['search'] ?? '';
if ($search) {
    $stmt = $pdo->prepare("SELECT emp_id,CONCAT(fname,' ',mi,'. ',lname) as name,sex,address,salary,contact_no,time,
                        IF(active = 1,'ACTIVE', 'NOT ACTIVE') as active FROM employee JOIN employee_logs 
                        ON emp_id = e_id WHERE dnum = :dept AND employee_logs.date = :date 
                        AND emp_id LIKE :search ORDER BY time DESC");
    $stmt->bindValue(":dept", $_SESSION['dept']);
    $stmt->bindValue(":date", date("Y-m-d"));
    $stmt->bindValue(":search", "%$search%");
    $stmt->execute();
    $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
}

?>

<?php include_once '../../components/base/top.php';?>

<div class="app">

<?php include_once '../../components/sidebar.php';?>

<h1>Employee Logs</h1>

<div class="mb-3 mt-4">
    <form>
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search Employee ID" name="search">
            <button class="btn btn-primary" type="submit" >Search</button>
        </div>
    </form>
</div> 

<div class="mt-5 mb-2">Date: <?php echo date("F j, Y");?></div>

<?php include_once '../../components/table/table_top.php';?>
        <?php foreach ($datas as $data):?>
            <tr>
                <th><?php echo $data['emp_id'];?></th>
                <td><?php echo $data['name'];?></td>
                <td><?php echo $data['sex'];?></td>
                <td><?php echo $data['address'];?></td>
                <td><?php echo $data['salary'];?></td>
                <td><?php echo $data['contact_no'];?></td>
                <td><?php echo $data['time'];?></td>
                <td><?php echo $data['active'];?></td>
                <?php if($actions):?>
                    <td>
                    <a href="update.php?id=<?php echo $data['emp_id'];?>" class="btn btn-warning btn-sm">Edit</a>
                    <form action="delete.php" method="post" style="display: inline-block;">
                        <input type="hidden" name="id" value="<?php echo $data['emp_id'];?>">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
                <?php endif;?>
            </tr>
        <?php endforeach;?>  
<?php include_once '../../components/table/table_bot.php';?>

</div>
<?php include_once '../../components/base/bottom.php';?>