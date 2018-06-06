package mpr4;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
 *
 * @author kayen
 */
public class database {
    
        String servername = "matt-smith-v4.ics.uci.edu";
        String dbname = "inf124db012";
        String username = "inf124db012";
        String password = "happybearfriends";
        Connection conn = null;
        public Connection getConnection(){

        
        try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://" + servername + "/" + dbname + "?useSSL=FALSE&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", username, password);    

        } catch(Exception e) {
			System.out.println(e.getMessage());
			//e.printStackTrace();
	}
	return conn;
    }
}
