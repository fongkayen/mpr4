<%@ page contentType="text/html; charset=UTF-8" language="java" %>

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

    String jsonResponse =
            target.path("api").path("plushies").
                    request(). //send a request
                    accept(MediaType.APPLICATION_JSON). //specify the media type of the response
                    get(String.class); // use the get method and return the response as a string
    //System.out.println(jsonResponse);

    ObjectMapper objectMapper = new ObjectMapper(); // This object is from the jackson library

    List<Plushie> plushieList = objectMapper.readValue(jsonResponse, new TypeReference<List<Plushie>>(){});  
%>

<!DOCTYPE html>
<!--<html>
    <body>
        <div>
            Response: <//%= jsonResponse %>
            
        </div>
    </body>
</html>-->
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/happy-bear-friends/stylesheets/styles.css">
    </head>
    <body>
        <h1>STUFFED ANIMALS</h1>
        <div class="navbar">
            <a href="index.html">HOME</a>
            <a href="views/pages/ourstory.html">OUR STORY</a>
            <a href="views/pages/products.html">PRODUCTS</a>
        </div>
        
        <div class="main">
            <img src="/happy-bear-friends/images/bear-header.jpg">
            <h1>Welcome to Happy Bear Friends</h1>
            <p>We are a Non-Profit based in Irvine, California and we focus on kid-friendly toys made from all natural environment-friendly materials.
            We hope to bring awareness to rare animals that not a lot of people have heard of, and then turn these animals into plushies with the goal
            of educating children about these animals.</p>
        </div>



<div class="main">
    <h3>PRODUCTS</h3>
    <div class="products-table"> 
	<table>
	
<!--
				int plushie_id = images.getInt("plushie_id");
				String image_path = images.getString("image_path");
				String plushie_name = images.getString("name");
				int plushie_price = images.getInt("price");
				String plushie_madein = images.getString("made_in");-->
        <tr>
            <td>
                <!--EACH PLUSHIE-->
		<%	
            for(Plushie plushie : plushieList) {
            out.print("<li>");
            out.print(plushie.getPlushie_id() + " - " + plushie.getName());
            out.print("</li>");
            }
                %>
                
                <!--"<a href=\"DisplayDescription?id=" + plushie_id + "\"><img src=\"" + image_path + "\" alt=\"plushie\" name=\"plushie_name\"" +
						"\"></a><br/>\r\n" + 
						plushie_name + "<br/>\r\n" + "$" +
						plushie_price + "<br/>\r\n" + 
						plushie_madein + "\r\n" + -->
            </td> 
	</tr>	
<!--				if(images.getInt("image_id") != 33) {
					images.next();
					images.next();
				}-->

    </body>
</html>