<?php 

session_start();

require_once '../../config/db.php';

$id = $_GET['id'] ?? null;

if ($_SERVER['REQUEST_METHOD']=="POST") {
    $stmt = $pdo->prepare("DELETE FROM task WHERE tnumber = :id");
    $stmt->bindValue(":id", $_POST['id']);
    $stmt->execute();

    header("Location: view_all.php?uid=".$_SESSION['user_id']."&dept=".$_SESSION['dept']);
} 

?>

<?php include_once '../../components/base/top.php';?>
    
    <div class="container">
        <div class="col-6 mx-auto mt-4">
            <div class="row mt-4 mb-4 px-3">
                <div class="mb-4">Are you sure you wan to delete Department <?php echo $id;?>?</div>
                <a href="view_all.php?uid=<?php echo $_SESSION['user_id'].'&dept='.$_SESSION['dept'];?>" class="col-6 btn btn-warning btn-sm">Cancel</a>
                <form action="delete.php" method="post" class="col-6">
                    <input type="hidden" name="id" value="<?php echo $id;?>">
                    <button type="submit" class="col-12 btn btn-danger btn-sm">Delete</button>
                </form>
            </div>
        </div>
    </div>
    
    <?php include_once '../../components/base/bottom.php';?>