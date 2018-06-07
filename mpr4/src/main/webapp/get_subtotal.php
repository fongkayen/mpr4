<?php
	require_once 'pdo.php';

	try{
		$product_id = $_REQUEST["product_id"];
		$quantity = $_REQUEST["quantity"];
		
		$stmt = $conn->prepare("SELECT price FROM plushies WHERE plushie_id=\"".$product_id."\"");
		$stmt->execute();
		$result = $stmt->fetch(PDO::FETCH_ASSOC);
		$subtotal = $result["price"]*$quantity;

		echo $subtotal;
		$conn->close();
	}catch (PDOException $e){
		echo "ERROR:".$e->getMessage();
	}
?>
