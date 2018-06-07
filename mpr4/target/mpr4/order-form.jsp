<%-- 
    Document   : order-form
    Created on : Jun 6, 2018, 9:54:05 PM
    Author     : Nerianne
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="org.codehaus.jackson.map.ObjectMapper" %>
<%@ page import="org.codehaus.jackson.type.TypeReference" %>
<%@ page import="org.glassfish.jersey.client.ClientConfig" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.ws.rs.client.Client" %>
<%@ page import="javax.ws.rs.client.ClientBuilder" %>
<%@ page import="javax.ws.rs.client.WebTarget" %>
<%@ page import="javax.ws.rs.core.MediaType" %>
<%@ page import="javax.ws.rs.core.UriBuilder" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.URI" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Plushie" %>

<%
    ClientConfig clientConfig = new ClientConfig();
    Client client = ClientBuilder.newClient(clientConfig);
    WebTarget target = client.target(UriBuilder.fromUri("http://centaurus-7.ics.uci.edu:9994/mpr4").build());
    
    int plushie_id = Integer.parseInt(request.getParameter("plushie_id"));
    
    String jsonResponse =
            target.path("api").path("plushies").path(request.getParameter("plushie_id")).
                    request().
                    accept(MediaType.APPLICATION_JSON).
                    get(String.class);

    ObjectMapper objectMapper = new ObjectMapper();

    Plushie plushie = objectMapper.readValue(jsonResponse, new TypeReference<Plushie>(){});  
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Make an Order</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="happy-bear-friends/stylesheets/styles.css">
    </head>
    <body>
	<div class="navbar">
            <a href="index.jsp">HOME</a>
            <a href="happy-bear-friends/views/ourstory.html">OUR STORY</a>
        </div>

        <div class="main">
            <h3>Order Form</h3>
            <form action="http://centaurus-7.ics.uci.edu:9994/mpr4/api/orders" method="POST">
                <input type="hidden" name="cart_id" value="1" />
                <input type="hidden" name="product_id" value="<%= plushie.getPlushie_id() %>" />
                * Required Fields
                <fieldset>
                    <legend>PRODUCT</legend>
                    <p>You are ordering...</p>
                    <table>
                        <tbody>
                            <tr>
                                <td></td>
                                <td><%= plushie.getImageOne() %></td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><%= plushie.getName() %></td>
                            </tr>
                            <tr>
                                <td>Price</td>
                                <td><%= plushie.getName() %></td>
                            </tr>
                            <tr>
                                <td>Price</td>
                                <td><%= plushie.getPrice() %></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="text" id="productid" name="product_id" placeholder="Product ID*" required pattern="[0-9]{2}"> Input must be two digits. <br/>
                </fieldset>
                
                <fieldset>
                    <legend>SHIPPING ADDRESS</legend>
                    <input type="text" id="firstname" name="first_name" placeholder="First Name*" required><br/>
                    <input type="text" id="lastname" name="last_name" placeholder="Last Name*" required><br/>
                    <input type="text" id="email" name="email" placeholder="Email*" required pattern="[0-9a-zA-Z._-]+[@][a-zA-Z_]+[.][a-zA-Z]{2,3}"> Needs to be a valid email address. <br/>
                    <input type="text" id="address1" name="address_one" placeholder="Address 1 (Street Address)*" required><br/>
                    <input type="text" id="address2" name="address_two" placeholder="Address 2 (Apt #, Suite, Floor, etc.)"required><br/>
		    <input type="text" id="city" name="city" placeholder="City*" required pattern="[a-zA-Z ]+"><br/>
                    <input type="text" id="state" name="state" placeholder="State*" required pattern="[a-zA-Z ]+"><br/>
                    <input type="text" id="zipcode" name="zipcode" placeholder="Zipcode*" required pattern="[0-9]{5}"><br/>
                    <input type="text" id="city" name="city" placeholder="City*" required pattern="[a-zA-Z ]+"><br/>
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
                <input type="submit" name="Buy">
            </form>
        </div>
    </body>
</html>