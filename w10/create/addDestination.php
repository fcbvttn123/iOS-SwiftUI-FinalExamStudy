<?php
    require('connect.php');
    $db = mysqli_connect($dbServer, $dbUser, $dbPass) or die("Could not connect to MySQL");
    mysqli_select_db($db, $dbName) or die("Could not select db");

    $json = file_get_contents('php://input');
    $data = json_decode($json, true);

    $stop1 = $data['Stop1'] ?? null;
    $stop2 = $data['Stop2'] ?? null;
    $final = $data['Final'] ?? null;
    
    $query = "INSERT INTO destinations (Stop1, Stop2, Final) VALUES ('$stop1', '$stop2', '$final')";
    mysqli_query($db, $query);

    mysqli_close($db);
?>