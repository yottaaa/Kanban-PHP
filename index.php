<?php

/** 
 *  
 * 
 * 
 * 
 * 
 * 
 * 
*/

session_start();

require 'config/db.php';
require 'components/functions/typeofuser.php';

if (!empty($_SESSION)) {
    $id = $_SESSION['user_id'];
    typeOfUser($pdo,$id);
} else {
    header("Location: login.php");
}

?>