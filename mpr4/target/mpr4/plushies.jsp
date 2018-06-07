<%-- 
    Document   : plushies
    Created on : Jun 5, 2018, 10:35:04 PM
    Author     : Nerianne
--%>



<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>PLUSHIES!</h1>
    </body>
</html>
			
<html>
    <head>
	<title> " + name + " </title>
        <meta charset=\"UTF-8\"> 
	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
	<link rel=\"stylesheet\" href=\"happy-bear-friends/stylesheets/styles.css\">\r\n" + 
	<script type=\"text/javascript\" src=\"happy-bear-friends/scripts/picture_gallery.js\"></script>\r\n" + 
	</head>\r\n" + 
	<body>\r\n" + 
	<div class=\"navbar\">\r\n" + 
	<a href=\"/pa3\">HOME</a>\r\n" + 
	<a href=\"happy-bear-friends/views/pages/ourstory.html\">OUR STORY</a>\r\n" + 
					"        </div>\r\n" + 
					"        \r\n" + 
					"        <div class=\"main\">\r\n" + 
					"            <h3> " + name + " </h3>\r\n" + 
					"            <div class=\"product-pic\">\r\n" + 
					"                <img id=\"main-product-pic\" src=\"" + image1 + "\" alt=\"main_image\">\r\n" + 
					"            </div>\r\n" + 
					"            <div class=\"more-product-pic\">\r\n" + 
					"                <a href= \"" + image2 + "\" >\r\n" + 
					"                    <img class=\"more-product-pic\" id=\"picture2\" src= \"" + image2 + "\" alt=\"image2\">\r\n" + 
					"                </a>\r\n" + 
					"                <a href= \"" + image3 + "\" >\r\n" + 
					"                    <img class=\"more-product-pic\" id=\"picture3\" src= \"" + image3 +"\" alt=\"image3\">\r\n" + 
					"                </a>\r\n" + 
					"            </div>\r\n" + 
					"            \r\n" + 
					"            <hr> \r\n" + 
					"\r\n" + 
					"            <table class=\"det-desc\">\r\n" + 
					"		\r\n" + 
					"                <tr>\r\n" + 
					"                    <td class=\"desc-left\">Description</td>\r\n" + 
					"                    <td class=\"desc-right\"> " + description + "   </td>\r\n" + 
					"                </tr>\r\n" + 
					"                <tr>\r\n" + 
					"                    <td class=\"desc-left\">About</td>\r\n" + 
					"                    <td class=\"desc-right animal-desc\"> " + about + " </td>\r\n" + 
					"                </tr>\r\n" + 
					"                <tr>\r\n" + 
					"                    <td class=\"desc-left\">ID #: </td>\r\n" + 
					"                </tr>\r\n" + 
					"                <tr>\r\n" + 
					"                    <td class=\"desc-left\">Price: </td>\r\n" + 
					"                    <td class=\"desc-right\"> " + price + " </td>\r\n" + 
					"                </tr>\r\n" + 
					"                <tr>\r\n" + 
					"                    <td class=\"desc-left\">Material: </td>\r\n" + 
					"                    <td class=\"desc-right\"> " + material + " </td>\r\n" + 
					"                </tr>\r\n" + 
					"                <tr>\r\n" + 
					"                    <td class=\"desc-left in-stock\"> " + in_stock + " </td>\r\n" + 
					"                </tr>\r\n" + 
					"            </table>\r\n" + 
					"            <hr>\r\n" + 
					"            <a href='Checkout'>ADD TO CART</a><br/>\r\n" + 
					"            <p>*Disclaimer: No animals were harmed in making these products.</p>\r\n" + 
					"        </div>\r\n" + 
					"    </body>\r\n" + 
					"</html>\r\n" + 
					"");