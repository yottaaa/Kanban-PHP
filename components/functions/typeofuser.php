<?php

// determine the type of user and redirect to the their designated panel
function typeOfUser($pdo,$id){

    // redirect to admin
    $stmt = $pdo->prepare("SELECT emp_id,pass,CONCAT(fname,' ',mi,'. ',lname) as name,dnum FROM employee JOIN department 
                            ON Mgr_id = emp_id WHERE dname = 'Administration' AND emp_id = :id");
    $stmt->bindValue(":id", $id);
    $stmt->execute();
    $fetch_user = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($fetch_user)) {
        $_SESSION['user_id'] = $fetch_user['emp_id'];
        $_SESSION['user_pass'] = $fetch_user['pass'];
        $_SESSION['fullname'] = $fetch_user['name'];
        $_SESSION['dept'] = $fetch_user['dnum'];

        // insert record to employee logs
        $stmt = $pdo->prepare("INSERT INTO employee_logs (e_id,date,time,active) VALUES
                                (:e_id,:date,:time,1)");
        $stmt->bindValue(":e_id", $_SESSION['user_id']);
        $stmt->bindValue(":date", date("Y-m-d"));
        $stmt->bindValue(":time", date("H:i:s"));
        $stmt->execute();

        header("Location: admin/departments/view_all.php?uid=" . $_SESSION['user_id'] . "&dept=" . $_SESSION['dept']);
        exit;
    }

    // redirect to manager
    $stmt = $pdo->prepare("SELECT emp_id,pass,CONCAT(fname,' ',mi,'. ',lname) as name,dnum FROM employee JOIN department 
                            ON Mgr_id = emp_id WHERE NOT dname = 'Administration' AND emp_id = :id");
    $stmt->bindValue(":id", $id);
    $stmt->execute();
    $fetch_user = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($fetch_user)) {
        $_SESSION['user_id'] = $fetch_user['emp_id'];
        $_SESSION['user_pass'] = $fetch_user['pass'];
        $_SESSION['fullname'] = $fetch_user['name'];
        $_SESSION['dept'] = $fetch_user['dnum'];

        // insert record to employee logs
        $stmt = $pdo->prepare("INSERT INTO employee_logs (e_id,date,time,active) VALUES
                                (:e_id,:date,:time,1)");
        $stmt->bindValue(":e_id", $_SESSION['user_id']);
        $stmt->bindValue(":date", date("Y-m-d"));
        $stmt->bindValue(":time", date("H:i:s"));
        $stmt->execute();

        header("Location: manager/employees/view_all.php?uid=" . $_SESSION['user_id'] . "&dept=" . $_SESSION['dept']);
        exit;
    }
    
    // redirect to employee
    $stmt = $pdo->prepare("SELECT emp_id,pass,CONCAT(fname,' ',mi,'. ',lname) as name,dnum FROM employee WHERE emp_id = :id");
    $stmt->bindValue(":id", $id);
    $stmt->execute();
    $fetch_user = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($fetch_user)) {
        $_SESSION['user_id'] = $fetch_user['emp_id'];
        $_SESSION['user_pass'] = $fetch_user['pass'];
        $_SESSION['fullname'] = $fetch_user['name'];
        $_SESSION['dept'] = $fetch_user['dnum'];

        // insert record to employee logs
        $stmt = $pdo->prepare("INSERT INTO employee_logs (e_id,date,time,active) VALUES
                                (:e_id,:date,:time,1)");
        $stmt->bindValue(":e_id", $_SESSION['user_id']);
        $stmt->bindValue(":date", date("Y-m-d"));
        $stmt->bindValue(":time", date("H:i:s"));
        $stmt->execute();

        header("Location: employee/projects/view_all.php?uid=" . $_SESSION['user_id'] . "&dept=" . $_SESSION['dept']);
        exit;
    }
}


?>