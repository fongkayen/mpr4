<?php
	require_once 'pdo.php';

	try{
		$subtotal = $_REQUEST["subtotal"];
		$sales_tax = $_REQUEST["sales_tax"];
		
		$total = $subtotal + ($subtotal * $sales_tax);
		echo $total;
		$conn->close();
	}catch (PDOException $e){
		echo "ERROR:".$e->getMessage();
	}
?>
