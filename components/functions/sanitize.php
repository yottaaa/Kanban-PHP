<?php

function sanitize($data){
    $data = htmlspecialchars(stripslashes($data));
    return $data;
}

?>