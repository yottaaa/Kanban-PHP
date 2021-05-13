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

$actions = false;
$attributes = ["ID","Name","Dept. ID","Time","Active"];

$id = $_SESSION['user_id'];

$stmt = $pdo->prepare("SELECT emp_id,CONCAT(fname,' ',mi,'. ',lname) as name,dnum,time,
                    IF(active = 1,'ACTIVE', 'NOT ACTIVE') as active FROM employee JOIN employee_logs 
                    ON emp_id = e_id WHERE employee_logs.date = :date ORDER BY time DESC");
$stmt->bindValue(":date", date("Y-m-d"));
$stmt->execute();
$datas = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<?php include_once '../../components/base/top.php';?>

<div class="app">

<?php include_once '../../components/sidebar.php';?>

<h1 class="mb-5">Employee Logs</h1>

<div class="mt-5 mb-2">Date: <?php echo date("F j, Y");?></div>
<?php include_once '../../components/table/table_top.php';?>
        <?php foreach ($datas as $data):?>
            <tr>
                <th><?php echo $data['emp_id'];?></th>
                <td><?php echo $data['name'];?></td>
                <td><?php echo $data['dnum'];?></td>
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