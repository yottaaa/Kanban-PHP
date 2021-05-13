<?php

date_default_timezone_set('Asia/Manila'); // set timezone for local date time

// date format "Y-m-d"
// time format "H:i:s"

function deadline($pdo){
    $date_now = date("Y-m-d");
    // get all the projects
    $stmt = $pdo->prepare("SELECT pnumber,deadline,STATUS FROM project JOIN dept_proj ON pnumber = pnum");
    $stmt->execute();
    $projects = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($projects as $project) {
        if ($date_now > $project['deadline'] && $project['deadline'] != "0000-00-00") {
            if ($project['STATUS'] != "Done") {
                $stmt = $pdo->prepare("UPDATE dept_proj SET STATUS = 'Expired' WHERE pnum = :pnum");
                $stmt->bindValue(":pnum", $project['pnumber']);
                $stmt->execute();
            }
        }
    }
    // get all the tasks
    $stmt = $pdo->prepare("SELECT tnumber, deadline, STATUS FROM task JOIN emp_task ON tnumber = tnum");
    $stmt->execute();
    $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($tasks as $task) {
        if ($date_now > $task['deadline'] && $project['deadline'] != "0000-00-00") {
            if ($task['STATUS'] != "Done") {
                $stmt = $pdo->prepare("UPDATE emp_task SET STATUS = 'Expired' WHERE tnum = :tnum");
                $stmt->bindValue(":tnum", $task['tnumber']);
                $stmt->execute();
            }
        }
    }
}

?>