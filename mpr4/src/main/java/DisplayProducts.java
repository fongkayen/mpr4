/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author kayen
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class DisplayProducts
 */
//@WebServlet("/DisplayProducts")
public class DisplayProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out =  response.getWriter();
                out.println("HelloBye");
		
//		String servername = "matt-smith-v4.ics.uci.edu";
//        String dbname = "inf124db012";
//        String username = "inf124db012";
//        String password = "happybearfriends";
//        
//		HttpSession session = request.getSession();
//		if (session.isNew()) {
//			ArrayList<Integer> cartarray = new ArrayList<Integer>();
//			session.setAttribute("cart", cartarray);
//		}
//
//		
//		// Set response content type
//		response.setContentType("text/html");
//		
//		out.println("<html>");
//		String header = 
//				"<head>\r\n" + 
//				"        <meta charset=\"UTF-8\">\r\n" + 
//				"        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n" + 
//				"        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n" + 
//				"        <link rel=\"stylesheet\" href=\"happy-bear-friends/stylesheets/styles.css\">\r\n" + 
//				"    </head>";
//		out.println(header);
//		
//		String description = 
//				"<h1>STUFFED ANIMALS</h1>\r\n" + 
//				"        <div class=\"navbar\">\r\n" + 
//				"            <a href=\"index.jsp\">HOME</a>\r\n" + 
//				"             <a href=\"happy-bear-friends/views/pages/ourstory.html\">OUR STORY</a>\r\n" + 
//				"        </div>\r\n" + 
//				"        \r\n" + 
//				"        <div class=\"main\">\r\n" + 
//				"            <img src=\"happy-bear-friends/images/bear-header.jpg\">\r\n" + 
//				"            <h1>Welcome to Happy Bear Friends</h1>\r\n" + 
//				"            <p>We are a Non-Profit based in Irvine, California and we focus on kid-friendly toys made from all natural environment-friendly materials.\r\n" + 
//				"            We hope to bring awareness to rare animals that not a lot of people have heard of, and then turn these animals into plushies with the goal\r\n" + 
//				"            of educating children about these animals.</p>\r\n" + 
//				"        </div>";
//		out.println(description);
//		
//		String navbar = 
//				"<div class=\"navbar\">\r\n" + 
//						"            <a href=\"index.jsp\">HOME</a>\r\n" + 
//						"             <a href=\"happy-bear-friends/views/pages/ourstory.html\">OUR STORY</a>\r\n" + 
//				"        </div>";
//		out.println(navbar);
//		out.println("<div class=\"main\">\r\n");
//		
//		String preRecent = 
//				"<div class=\"recent\">\r\n" + 
//				"	<table>\r\n" + 
//				"		<tr>\r\n";
//		out.println(preRecent);
//		
//		if(session.getAttribute("recent") == null) {
//			out.println("<td>No recently viewed items</td>");
//		}else {
//			RecentProducts recentList = (RecentProducts)session.getAttribute("recent");
//			out.println("<h1>Recently Viewed Items</h1>");
//			for(int i=0; i<recentList.recentlyViewed.size(); ++i) {
//				out.println("<td>\r\n" + 
//						"<a href=\"DisplayDescription?id=" + recentList.recentlyViewed.get(i).plushieID + 
//						"\"><img src=\"" + recentList.recentlyViewed.get(i).imagePath + "\" alt=\"plushie\" name=\"plushie_name\"" +
//						"\"></a><br/>\r\n" + 
//						recentList.recentlyViewed.get(i).plushieName + "<br/>\r\n" +
//						"</td>\r\n");
//			}
//		}
//		
//		String postRecent = 
//				"		</tr>\r\n" + 
//				"	</table>\r\n" + 
//				"</div>";
//		out.println(postRecent);
//		String preTable = 
//				"<div class=\"main\">\r\n" + 
//				"            <h3>PRODUCTS</h3>\r\n" + 
//				"            <div class=\"products-table\">\r\n" + 
//				"                <table>";
//		out.println(preTable);
//		try{
//			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
//		    Connection conn = DriverManager.getConnection("jdbc:mysql://" + servername + "/" + dbname + "?useSSL=FALSE&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", username, password);    
//		    
//			//Execute SQL query
//			Statement stmt = conn.createStatement();
//			String sql = "SELECT * FROM `plushies` INNER JOIN `images` ON plushies.plushie_id=images.plushie_id";
//			ResultSet images = stmt.executeQuery(sql);
//			
//			int counter = 1;
//			while(images.next()){
//				int plushie_id = images.getInt("plushie_id");
//				String image_path = images.getString("image_path");
//				String plushie_name = images.getString("name");
//				int plushie_price = images.getInt("price");
//				String plushie_madein = images.getString("made_in");
//				
//				if(counter % 4 == 0) {
//					out.println("<tr>");
//				}
//				out.println("<td>\r\n" + 
//						"<a href=\"DisplayDescription?id=" + plushie_id + "\"><img src=\"" + image_path + "\" alt=\"plushie\" name=\"plushie_name\"" +
//						"\"></a><br/>\r\n" + 
//						plushie_name + "<br/>\r\n" + "$" +
//						plushie_price + "<br/>\r\n" + 
//						plushie_madein + "\r\n" + 
//						"</td> ");
//				if(counter % 3 == 0) {
//					out.println("</tr>");
//				}
//				if(images.getInt("image_id") != 33) {
//					images.next();
//					images.next();
//				}
//				
//				counter = counter + 1;
//			}
//			out.println("</body></html>");  
//			images.close();
//			stmt.close();      	
//			conn.close();
//		} catch(SQLException se) {
//			out.println(se.getMessage());
//			//se.printStackTrace();
//		} catch(Exception e) {
//			out.println(e.getMessage());
//			//e.printStackTrace();
//		}
//		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
