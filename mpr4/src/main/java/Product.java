/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author kayen
 */
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Product {
	int plushieID;
	String plushieName;
	String imagePath;

	Product(int pid, String name, String path){
		plushieID = pid;
		plushieName = name;
		imagePath = path;

	}
}
