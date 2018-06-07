<%-- 
    Document   : order-form
    Created on : Jun 6, 2018, 9:54:05 PM
    Author     : Nerianne
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Make an Order</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="happy-bear-friends/stylesheets/styles.css">
	<script>
		function passSelectedValue(value){
			if(value.length == 0){
				document.getElementById("dynamic-zip").innerHTML = "";
			} else {
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function() {
					if(this.readyState == 4 && this.status == 200) {
						document.getElementById("dynamic-zip").innerHTML = this.responseText;
						getSalesTax();
					}
				}
				
				xmlhttp.open("GET", "get_zipcodes.php?q=" + value, true);
				xmlhttp.send();
			}
		}
		function calculateTotal(){
			var subtotal = document.getElementById("subtotal").innerHTML.replace(/\s/g, "");
			var sales_tax = document.getElementById("sales-tax").innerHTML.replace(/\s/g, "");

			subtotal = subtotal.substr(1, subtotal.length);

			if(subtotal.length == 0 || sales_tax.length == 0){
				document.getElementById("total").innerHTML = "Can't calculate, missing data.";
			}else{
                                var xmlhttp = new XMLHttpRequest();
                                xmlhttp.onreadystatechange = function() {
                                       	if(this.readyState == 4 && this.status == 200) {
                                               	document.getElementById("total").innerHTML = "$" + this.responseText;
                                       	}
                               	}

                               	xmlhttp.open("GET", "get_total.php?subtotal=" + subtotal + "&sales_tax=" + sales_tax);
                               	xmlhttp.send();
                       }
		}
		function calculateSubtotal(){
			var product_id = document.getElementById("productid").value;
                        var quantity = document.getElementById("quantity").value;

			if(product_id.length == 0 || quantity.length == 0){
				document.getElementById("subtotal").innerHTML = "Cannot calculate, missing data.";
			}else{
				var xmlhttp = new XMLHttpRequest();
                                xmlhttp.onreadystatechange = function() {
                                        if(this.readyState == 4 && this.status == 200) {
                                                document.getElementById("subtotal").innerHTML = "$" + this.responseText;
						calculateTotal();
                                        }
                                }

                                xmlhttp.open("GET", "get_subtotal.php?product_id=" + product_id +
                                                "&quantity=" + quantity, true);
                                xmlhttp.send();
			}
		}
		function getSalesTax(){
			var s = document.getElementById("select-state");
                        var state = s.options[s.selectedIndex].value;
                        var z = document.getElementById("dynamic-zip");
                        var zipcode = z.options[z.selectedIndex].value;

                        if(state.length == 0 && zipcode.length == 0){
                                document.getElementById("sales-tax").innerHTML = "Can't calculate, missing data.";
                        } else {
                                var xmlhttp = new XMLHttpRequest();
                                xmlhttp.onreadystatechange = function() {
                                        if(this.readyState == 4 && this.status == 200) {
                                                document.getElementById("sales-tax").innerHTML = this.responseText;
						calculateTotal();
                                        }
                                }

                                xmlhttp.open("GET", "get_sales_tax.php?state=" + state + "&zipcode=" + zipcode, true);
                                xmlhttp.send();
                        }
		}
	</script>
    </head>
    <body>
	<div class="navbar">
            <a href="index.jsp">HOME</a>
            <a href="happy-bear-friends/views/ourstory.html">OUR STORY</a>
        </div>

        <div class="main">
            <h3>Order Form</h3>
            <form action="http://centaurus-7.ics.uci.edu:9994/mpr4/api/orders" method="POST">
                * Required Fields
                <fieldset>
                    <legend>PRODUCT</legend>
                    <input type="text" id="productid" name="product_id" onkeyup="calculateSubtotal()" placeholder="Product ID*" required pattern="[0-9]{2}"> Input must be two digits. <br/>
                    <input type="text" id="quantity" name="quantity" onkeyup="calculateSubtotal()" placeholder="Quantity*" required pattern="[0-9]{2}"> Input must be two digits. <br/> 
                </fieldset>
                
                <fieldset>
                    <legend>SHIPPING ADDRESS</legend>
                    <input type="text" id="firstname" name="first_name" placeholder="First Name*" required><br/>
                    <input type="text" id="lastname" name="last_name" placeholder="Last Name*" required><br/>
                    <input type="text" id="email" name="email" placeholder="Email*" required pattern="[0-9a-zA-Z._-]+[@][a-zA-Z_]+[.][a-zA-Z]{2,3}"> Needs to be a valid email address. <br/>
                    <input type="text" id="address1" name="address_one" placeholder="Address 1 (Street Address)*" required><br/>
                    <input type="text" id="address2" name="address_two" placeholder="Address 2 (Apt #, Suite, Floor, etc.)"required><br/>
		    <input type="text" id="city" name="city" placeholder="City*" required pattern="[a-zA-Z ]+"><br/>

		    <select name="state" id="select-state" style="width: 175px;" onchange="passSelectedValue(this.value)">
		    <?php
			$stmt = $conn->prepare("SELECT DISTINCT state from zipcodes ORDER BY state ASC");
		        $stmt->execute();
			foreach(new RecursiveArrayIterator($stmt->fetchAll()) as $k=>$v){
                		echo '<option value="'.$v["state"].'">'.$v["state"].'</option>';
		        }
		    ?>
		    </select>
		    <br>
		    <select name="zipcode" id="dynamic-zip" style="width: 175px;" onchange="getSalesTax()">

		    </select>	
		    <br>
                    <input type="text" id="phone" name="phone"  placeholder="Phone*" required pattern="[0-9]{3}[ -][0-9]{3}[ -][0-9]{4}"> Format must be 000 000 0000 or 000-000-0000. <br/>
                </fieldset>
                
                <fieldset>
                    <legend>DELIVERY METHOD</legend>
                    <input type="radio" name="shipping" value="standard" checked>Standard (3-7 Business Days)<br/>
                    <input type="radio" name="shipping" value="twoday">Two Day (2-3 Business Days)<br/>
                    <input type="radio" name="shipping" value="express">Express (1-2 Business Days)<br/>
                </fieldset>
                
                <fieldset>
                    <legend>PAYMENT</legend>
                    <input type="text" id="nameoncard" name="name_on_card" placeholder="Name on Card*" required pattern="[a-zA-Z]+[ ][a-zA-Z]+"> First name and last name separated with a space. <br/> 
                    <input type="text" id="cardnumber" name="card_number" placeholder="Card Number*" required pattern="[0-9]{16}"> Must be valid card number (16 digits). <br/>
                    Expiration Date 
                    <select id="expr-month" name="expiry_month" required>
                        <option selected="selected" value="january">January</option>
                        <option value="february">February</option>
                        <option value="march">March</option>
                        <option value="april">April</option>
                        <option value="may">May</option>
                        <option value="june">June</option>
                        <option value="july">July</option>
                        <option value="august">August</option>
                        <option value="september">September</option>
                        <option value="october">October</option>
                        <option value="november">November</option>
                        <option value="december">December</option>
                    </select>
                    <input type="text" id="year" name="expiry_year" placeholder="Year*" required pattern="[0-9]{4}"> Must be 4 digit year. <br/> 
                    <input type="text" id="securitycode" name="security_code" placeholder="Security Code*" required pattern="[0-9]{3}"> Must be 3 digit code. <br/>
                </fieldset>
		<fieldset>
			<legend>TOTALS</legend>
			<table style="width: 50%">
				<tr>
					<td>SUBTOTAL</td>
					<td id="subtotal">Cannot calculate subtotal.</td>
				</tr>
				<tr>
					<td>SALES TAX</td>
					<td id="sales-tax">Cannot calculate sales tax.</td>
				</tr>
				<tr>
					<td>TOTAL</td>
					<td id="total">Cannot calculate total.</td>
				</tr>
			</table>
		</fieldset>
                <input type="submit" name="Buy">
            </form>
        </div>
    </body>
</html>