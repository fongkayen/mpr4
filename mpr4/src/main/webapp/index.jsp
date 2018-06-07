<%-- 
    Document   : index
    Created on : Jun 5, 2018, 9:23:14 PM
    Author     : Nerianne
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<% %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
        <a href="/orders" 
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<%@ page import="java.util.List" %>


<% 
    ClientConfig config = new ClientConfig();
        Client client = ClientBuilder.newClient(config);
        WebTarget target = client.target(getBaseURI());

        String jsonResponse =
                target.path("v1").path("api").path("todos").
                        request(). //send a request
                        accept(MediaType.APPLICATION_JSON). //specify the media type of the response
                        get(String.class); // use the get method and return the response as a string

        System.out.println(jsonResponse);

        ObjectMapper objectMapper = new ObjectMapper(); // This object is from the jackson library

        List<Todo> todoList = objectMapper.readValue(jsonResponse, new TypeReference<List<Todo>>(){});

        PrintWriter out = response.getWriter();
%>