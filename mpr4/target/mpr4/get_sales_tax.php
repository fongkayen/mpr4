<?php
	require_once 'pdo.php';

	try{
		$state = $_REQUEST["state"];
		$zipcode = $_REQUEST["zipcode"];
		
		$stmt = $conn->prepare("SELECT combined_rate FROM `tax_rates` WHERE state=\"".$state."\""." and zipcode=\"".$zipcode."\"");
                $stmt->execute();
                $result = $stmt->fetch(PDO::FETCH_ASSOC);
		$combined_rate = $result["combined_rate"];

		echo $combined_rate;
		$conn->close();
	}catch (PDOException $e){
		echo "ERROR:".$e->getMessage();
	}
?>
