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

    System.out.println(jsonResponse);

    ObjectMapper objectMapper = new ObjectMapper(); // This object is from the jackson library

    List<Plushie> plushieList = objectMapper.readValue(jsonResponse, new TypeReference<List<Plushie>>(){});  
%>

<!DOCTYPE html>
<html>
    <body>
        <div>
            Plushie Name: 
        </div>
    </body>
</html>