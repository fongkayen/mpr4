package model;

import mpr4.Database;
import mpr4.DatabaseUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PlushieService {
    private final static String ALL_PLUSHIES_QUERY = "SELECT * FROM plushies";
    private final static String ALL_PLUSHIE_IMAGES_QUERY = "SELECT * FROM images";
    private static final Database db = new Database();

    public static Plushie getPlushieById(int id){
        Connection connection = db.getConnection();
        ResultSet resultSet = DatabaseUtils.retrieveQueryResults(connection, ALL_PLUSHIES_QUERY + " WHERE plushie_id = " + id);

        if (resultSet != null) {
            try {
                resultSet.first();
                
                Plushie plushie = new Plushie();
                plushie.setPlushie_id(resultSet.getInt("plushie_id"));
                plushie.setName(resultSet.getString("name"));
                plushie.setDescription(resultSet.getString("description"));
                plushie.setAbout(resultSet.getString("about"));
                plushie.setPrice(resultSet.getInt("price"));
                plushie.setMaterial(resultSet.getString("material"));
                plushie.setIn_stock(resultSet.getString("in_stock"));
                plushie.setNum_stock(resultSet.getInt("num_stock"));
                plushie.setMade_in(resultSet.getString("made_in"));

                return plushie;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    // We will always close the connection once we are done interacting with the Database.
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return null;
    }
    public static List<Plushie> getAllPlushies() {
        List<Plushie> products = new ArrayList<Plushie>();

        Connection connection = db.getConnection();
        ResultSet resultSet = DatabaseUtils.retrieveQueryResults(connection, ALL_PLUSHIES_QUERY);

        if (resultSet != null) {
            try {
                resultSet.first();
                do {
                    Plushie product = new Plushie();

                    product.setPlushie_id(resultSet.getInt("plushie_id"));
                    product.setName(resultSet.getString("name"));
                    product.setDescription(resultSet.getString("description"));
                    product.setAbout(resultSet.getString("about"));
                    product.setPrice(resultSet.getInt("price"));
                    product.setMaterial(resultSet.getString("material"));
                    product.setIn_stock(resultSet.getString("in_stock"));
                    product.setNum_stock(resultSet.getInt("num_stock"));
                    product.setMade_in(resultSet.getString("made_in"));
                    
                    products.add(product);
                } while (resultSet.next());
                
                resultSet.close();
                
                resultSet = DatabaseUtils.retrieveQueryResults(connection, ALL_PLUSHIE_IMAGES_QUERY);
                
                resultSet.first();
                do {
                   int plushie_id = resultSet.getInt("plushie_id");
                   
                   for(int i=0; i<products.size(); ++i){
                       if(products.get(i).getPlushie_id() == plushie_id){
                           products.get(i).setImages(products.get(i).getImageCounter(), resultSet.getString("image_path"));
                           break;
                       }
                   }
                } while(resultSet.next());
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        
        return products;
    }
}