<?php
	require_once 'pdo.php';

	$q = $_REQUEST["q"];
	try{	
		$stmt = $conn->prepare("SELECT * FROM zipcodes WHERE state = \"".$q."\"");
		$stmt->execute();
		$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
	
		foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v){
			echo '<option value="'.$v["zip"].'">'.$v["zip"].'</option>';
		}
		$conn->close();
	} catch (PDOException $e){
		echo "ERROR:".$e->getMessage();
	}
?>
