<?php
	require('connect.php');
	$db = mysqli_connect($dbServer, $dbUser, $dbPass) or die ("Could not connect to my SQL");
	mysqli_select_db($db, $dbName) or die ("Could not select db");
	$query = "select * from destinations";
	$result = mysqli_query($db, $query);
	while($row = mysqli_fetch_array($result)) {
		$row_set[] = $row;
	}
	echo trim(json_encode($row_set));
	mysqli_close($db);
?>