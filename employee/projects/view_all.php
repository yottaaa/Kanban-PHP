<?php 
session_start();

require_once '../../config/db.php';
require_once '../../components/functions/datefunc.php';

deadline($pdo);

if (!isset($_SESSION['user_id'])) { 
    header("Location: ../../index.php");
    exit;
}

// for navigation 
$links = [
    ["Projects","cubes", "../projects/view_all.php?uid=" . $_SESSION['user_id']],
    ["Tasks","tasks", "../tasks/view_all.php?uid=" . $_SESSION['user_id']],
    ["Logout","sign-out-alt", "../../logout.php"]
];


$actions = true;
$attributes = ["Proj ID","Name", "Date Started", "Deadline", "Dept. No."];

// get all project info which the user is working on
$stmt = $pdo->prepare("SELECT pnumber,STATUS,title,date_start,deadline,dnum FROM project 
                    JOIN dept_proj ON dept_proj.pnum = pnumber JOIN emp_proj ON emp_proj.pnum = pnumber 
                    WHERE dnum = :dnumber AND e_id = :e_id ORDER BY date_start DESC");
$stmt->bindValue(":dnumber", $_SESSION['dept']);
$stmt->bindValue(":e_id", $_SESSION['user_id']);
$stmt->execute();
$datas = $stmt->fetchAll(PDO::FETCH_ASSOC);

// search
$search = $_GET['search'] ?? '';
if ($search) {
    $stmt = $pdo->prepare("SELECT pnumber,STATUS,title,date_start,deadline,dnum FROM project 
                            JOIN dept_proj ON dept_proj.pnum = pnumber JOIN emp_proj ON emp_proj.pnum = pnumber 
                            WHERE dnum = :dnumber AND e_id = :e_id AND title LIKE :search ORDER BY date_start DESC");
    $stmt->bindValue(":dnumber", $_SESSION['dept']);
    $stmt->bindValue(":e_id", $_SESSION['user_id']);
    $stmt->bindValue(":search", "%$search%");
    $stmt->execute();
    $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
}


function getStatus($status) {
    if ($status == "ToDo") {
        echo "table-default";
    } elseif ($status == "InProgress") {
        echo "table-warning";
    } elseif ($status == "Done") {
        echo "table-info";
    } elseif ($status == "Expired") {
        echo "table-danger";
    } else {
        echo "";
    }
}

?>

<?php include_once '../../components/base/top.php';?>

<div class="app">

<?php include_once '../../components/sidebar.php';?>

<h1>Projects</h1>

<div class="mb-4 mt-5">
    <form>
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search Project name" name="search">
            <button class="btn btn-primary" type="submit" >Search</button>
        </div>
    </form>
</div>    

<div style="display: inline-block;" class="mb-3">
    <span>Status: </span>
    <span class="legend" style="background-color: #ffffff;">To DO</span>
    <span class="legend" style="background-color: #fff3cd;">In Progress</span>
    <span class="legend" style="background-color: #cff4fc;">Done</span>
    <span class="legend" style="background-color: #f8d7da;">Expired</span>
</div>

<?php include_once '../../components/table/table_top.php';?>
    <?php foreach ($datas as $data):?>
        <tr class="<?php getStatus($data['STATUS']);?>">
            <th><?php echo $data['pnumber'];?></th>
            <td><?php echo $data['title'];?></td>
            <td><?php echo $data['date_start'];?></td>
            <td><?php echo $data['deadline'];?></td>
            <td><?php echo $data['dnum'];?></td>
            <?php if ($actions): ?>
                <td>
                    <a href="view.php?pid=<?php echo $data['pnumber'];?>" class="text-white btn btn-info btn-sm">View</a>
                </td>
            <?php endif;?>
        </tr>
    <?php endforeach;?> 
<?php include_once '../../components/table/table_bot.php';?>

</div>
<?php include_once '../../components/base/bottom.php';?>