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
public class Database {
    
        private String servername = "matt-smith-v4.ics.uci.edu";
        private String dbname = "inf124db012";
        private String username = "inf124db012";
        private String password = "happybearfriends";
        private static Connection conn;
        
        public Database(){
            conn = null;
        }
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
