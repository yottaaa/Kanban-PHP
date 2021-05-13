<?php

function setProjectDone($pdo,$pnum) {
    // get the total tasks count
    $stmt = $pdo->prepare("SELECT pnum,COUNT(*) as total_tasks FROM task WHERE pnum = :pnum");
    $stmt->bindValue(":pnum", $pnum);
    $stmt->execute();
    $total_tasks = $stmt->fetch(PDO::FETCH_ASSOC);

    // get the tasks done count
    $stmt = $pdo->prepare("SELECT pnum,COUNT(*) as tasks_done FROM task JOIN emp_task ON tnumber = tnum
                            WHERE STATUS = 'Done' AND pnum = :pnum");
    $stmt->bindValue(":pnum", $pnum);
    $stmt->execute();
    $tasks_done = $stmt->fetch(PDO::FETCH_ASSOC);   

    // we simply subtract the total tasks and done tasks 
    // if the result is equal to zero, it means that all tasks are done
    // and set project status to done.
    if ($total_tasks['total_tasks'] - $tasks_done['tasks_done'] == 0) {
        $stmt = $pdo->prepare("UPDATE dept_proj SET STATUS = 'Done' WHERE pnum = :pnum");
        $stmt->bindValue(":pnum", $pnum);
        $stmt->execute();
    }

    

}

function setProjectInProgress($pdo,$pnum){
    $stmt = $pdo->prepare("SELECT COUNT(*) as tasks_count FROM task WHERE pnum = :pnum");
    $stmt->bindValue(":pnum", $pnum);
    $stmt->execute();
    $count = $stmt->fetch(PDO::FETCH_ASSOC);

    if (count($count) > 0) {
        $stmt = $pdo->prepare("UPDATE dept_proj SET STATUS = 'InProgress' WHERE pnum = :pnum");
        $stmt->bindValue(":pnum", $pnum);
        $stmt->execute();
    }
}

?>