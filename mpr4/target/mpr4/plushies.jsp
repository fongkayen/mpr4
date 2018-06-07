<%-- 
    Document   : plushies
    Created on : Jun 5, 2018, 10:35:04 PM
    Author     : Nerianne
--%>

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
            target.path("api").path("plushies").path(request.getParameter("plushieid")).
                    request(). //send a request
                    accept(MediaType.APPLICATION_JSON). //specify the media type of the response
                    get(String.class); // use the get method and return the response as a string
    //System.out.println(jsonResponse);

    ObjectMapper objectMapper = new ObjectMapper(); // This object is from the jackson library

    Plushie plushie = objectMapper.readValue(jsonResponse, new TypeReference<Plushie>(){});  
%>

<!DOCTYPE html>
<!--<html>
//    <head>
//        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
//        <title>JSP Page</title>
//    </head>
//    <body>
//        <h1>PLUSHIES!</h1>
//    </body>
//</html>
//	-->		
<html>
    <head>
        <title> <%= plushie.getName() %></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="happy-bear-friends/stylesheets/styles.css">
    </head>
	<body>
            <div class="navbar">
                <a href="/mpr4">HOME</a>
                <a href="happy-bear-friends/views/ourstory.html">OUR STORY</a>
            </div>
            <div class="main">
                <h3> <%= plushie.getName()%> </h3>
            <div class="product-pic">
                <%out.print("<img src=" + plushie.getImageOne() + "></a>");%>
	</div>
	            <div class="more-product-pic">
	                <a href= <%= plushie.getImageTwo() %> > 
	                    <img class="more-product-pic" id="picture2" src= <%= plushie.getImageTwo() %>  alt="image2">
	                </a>
	                <a href= <%= plushie.getImageThree()%> >
	                    <img class="more-product-pic" id="picture3" src= <%= plushie.getImageThree()%> alt="image3">
	                </a>
	            </div> 
	            
	            <hr> 
                      <table class="det-desc">
	                <tr>
	                    <td class="desc-left">Description</td>
	                    <td class="desc-right"> <%= plushie.getDescription()%>  </td>
	                </tr>
	                <tr>
	                    <td class="desc-left">About</td>
	                    <td class="desc-right animal-desc"> <%= plushie.getAbout()%> </td>
	                </tr>
	                <tr>
	                    <td class="desc-left">ID #: </td>
                            <td class="desc-right"> <%= plushie.getPlushie_id() %> </td>
	                </tr>
	                <tr> 
	                    <td class="desc-left">Price: </td>
	                    <td class="desc-right"> <%= plushie.getPrice() %> </td>
	                </tr>
	                <tr>
	                    <td class="desc-left">Material: </td>
	                    <td class="desc-right"> <%= plushie.getMaterial() %> </td>
	                </tr> 
	                <tr> 
	                    <td class="desc-left in-stock"> <%= plushie.getIn_stock() %> </td>
	                </tr>
	            </table>
	            <hr> 
	            <a href='Checkout'>ADD TO CART</a><br/>
	            <p>*Disclaimer: No animals were harmed in making these products.</p>
	        </div>
        </body> 
</html>
	