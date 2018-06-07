<?php
	$servername = "matt-smith-v4.ics.uci.edu";
        $username = "inf124db012";
        $password = "happybearfriends";
	$dbname = "inf124db012";

	try{
	        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	} catch (PDOException $e) {
		echo "Connection failed:".$e->getMessage();
	}
?>

