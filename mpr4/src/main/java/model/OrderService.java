package model;

import mpr4.Database;
import mpr4.DatabaseUtils;
import model.Order;
import model.Plushie;
import model.Cart;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class OrderService {
    private final static String ALL_ORDERS_QUERY = "SELECT * FROM orders";
    private static final Database db = new Database();

    public static Cart getOrderByCartId(int id) {
        //Get a new connection object before going forward with the JDBC invocation.
        Connection connection = db.getConnection();
        System.out.println("Connection established");
        ResultSet resultSet = DatabaseUtils.retrieveQueryResults(connection, ALL_ORDERS_QUERY + " WHERE cart_id = " + id);

        Cart myCart = new Cart();
        
        if (resultSet != null) {
            try {
                while (resultSet.next()) {
                    Order order = new Order();
                    order.setCartID(resultSet.getInt("cart_id"));
                    order.setProductID(resultSet.getInt("product_id"));
                    order.setPrice(resultSet.getInt("price"));
                    order.setFirstName(resultSet.getString("first_name"));
                    order.setLastName(resultSet.getString("last_name"));
                    order.setEmail(resultSet.getString("email"));
                    order.setAddress1(resultSet.getString("address_one"));
                    order.setAddress2(resultSet.getString("address_two"));
                    order.setState(resultSet.getString("state"));
                    order.setCity(resultSet.getString("city"));
                    order.setZipcode(resultSet.getString("zipcode"));
                    order.setPhone(resultSet.getString("phone"));
                    order.setDeliverymethod(resultSet.getString("delivery_method"));
                    order.setNameoncard(resultSet.getString("name_on_card"));
                    order.setCardnumber(resultSet.getString("card_number"));
                    order.setExpirymonth(resultSet.getString("expiry_month"));
                    order.setExpiryyear(resultSet.getString("expiry_year"));
                    order.setSecuritycode(resultSet.getString("security_code"));
                    
                    myCart.addOrder(order);
                }
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

        return myCart;
    }

    public static List<Order> getAllOrders(){
        List<Order> allOrders = new ArrayList<Order>();
        
        Connection connection = db.getConnection();
        ResultSet resultSet = DatabaseUtils.retrieveQueryResults(connection, ALL_ORDERS_QUERY);

        if (resultSet != null) {
            try {
                while (resultSet.next()) {
                    Order order = new Order();
                    order.setCartID(resultSet.getInt("cart_id"));
                    order.setProductID(resultSet.getInt("product_id"));
                    order.setPrice(resultSet.getInt("price"));
                    order.setFirstName(resultSet.getString("first_name"));
                    order.setLastName(resultSet.getString("last_name"));
                    order.setEmail(resultSet.getString("email"));
                    order.setAddress1(resultSet.getString("address_one"));
                    order.setAddress2(resultSet.getString("address_two"));
                    order.setState(resultSet.getString("state"));
                    order.setCity(resultSet.getString("city"));
                    order.setZipcode(resultSet.getString("zipcode"));
                    order.setPhone(resultSet.getString("phone"));
                    order.setDeliverymethod(resultSet.getString("delivery_method"));
                    order.setNameoncard(resultSet.getString("name_on_card"));
                    order.setCardnumber(resultSet.getString("card_number"));
                    order.setExpirymonth(resultSet.getString("expiry_month"));
                    order.setExpiryyear(resultSet.getString("expiry_year"));
                    order.setSecuritycode(resultSet.getString("security_code"));
                    
                    allOrders.add(order);
                }
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

        return allOrders;
    }
//    public static Plushie getProductById(int id){
//        Connection connection = db.getConnection();
//        ResultSet resultSet = DatabaseUtils.retrieveQueryResults(connection, ALL_PRODUCTS_QUERY + " WHERE PLUSHIE_ID = " + id);
//
//        if (resultSet != null) {
//            try {
//                while (resultSet.next()) {
//                    Plushie product = new Plushie();
//
//                    product.setPlushie_id(resultSet.getInt("plushie_id"));
//                    product.setName(resultSet.getString("name"));
//                    product.setDescription(resultSet.getString("description"));
//                    product.setAbout(resultSet.getString("about"));
//                    product.setPrice(resultSet.getInt("price"));
//                    product.setMaterial(resultSet.getString("material"));
//                    product.setIn_stock(resultSet.getString("in_stock"));
//                    product.setNum_stock(resultSet.getInt("num_stock"));
//                    product.setMade_in(resultSet.getString("made_in"));
//                    
//                    return product;
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            } finally {
//                try {
//                    // We will always close the connection once we are done interacting with the Database.
//                    connection.close();
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//
//        return null;
//    }
//    public static List<Plushie> getAllProducts() {
//        List<Plushie> products = new ArrayList<Plushie>();
//
//        Connection connection = db.getConnection();
//        ResultSet resultSet = DatabaseUtils.retrieveQueryResults(connection, ALL_PRODUCTS_QUERY);
//
//        if (resultSet != null) {
//            try {
//                while (resultSet.next()) {
//                    Plushie product = new Plushie();
//
//                    product.setPlushie_id(resultSet.getInt("plushie_id"));
//                    product.setName(resultSet.getString("name"));
//                    product.setDescription(resultSet.getString("description"));
//                    product.setAbout(resultSet.getString("about"));
//                    product.setPrice(resultSet.getInt("price"));
//                    product.setMaterial(resultSet.getString("material"));
//                    product.setIn_stock(resultSet.getString("in_stock"));
//                    product.setNum_stock(resultSet.getInt("num_stock"));
//                    product.setMade_in(resultSet.getString("made_in"));
//                    
//                    products.add(product);
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            } finally {
//                try {
//                    connection.close();
//                } catch (SQLException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//
//        return products;
//    }

    public static boolean AddOrder(Order order) {
        String sql = "INSERT INTO ORDERS  (cart_id, product_id, price, first_name, last_name, email, address_one, address_two,"
                + "state, city, zipcode, phone, delivery_method, name_on_card, card_number, expiry_month, expiry_year, security_code)" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection connection = db.getConnection();
        return DatabaseUtils.performDBUpdate(connection, sql, Integer.toString(order.getCartID()), Integer.toString(order.getProductID()),
                Integer.toString(order.getPrice()), order.getFirstName(), order.getLastName(), order.getEmail(), order.getAddress1(),
                order.getAddress2(), order.getState(), order.getCity(), order.getZipcode(), order.getPhone(), order.getDeliverymethod(),
                order.getNameoncard(), order.getCardnumber(), order.getExpirymonth(), order.getExpiryyear(), order.getSecuritycode()); //Kayen copy-paste params

    }

    public static Order getOrder(int cart_id, int order_id){
        Connection connection = db.getConnection();
        ResultSet resultSet = DatabaseUtils.retrieveQueryResults(connection, ALL_ORDERS_QUERY + " WHERE CART_ID = " + cart_id + " AND ORDER_ID = " + order_id);

        if (resultSet != null) {
            try {
                while (resultSet.next()) {
                    Order order = new Order();

                    order.setCartID(resultSet.getInt("cart_id"));
                    order.setProductID(resultSet.getInt("product_id"));
                    order.setPrice(resultSet.getInt("price"));
                    order.setFirstName(resultSet.getString("first_name"));
                    order.setLastName(resultSet.getString("last_name"));
                    order.setEmail(resultSet.getString("email"));
                    order.setAddress1(resultSet.getString("address_one"));
                    order.setAddress2(resultSet.getString("address_two"));
                    order.setState(resultSet.getString("state"));
                    order.setCity(resultSet.getString("city"));
                    order.setZipcode(resultSet.getString("zipcode"));
                    order.setPhone(resultSet.getString("phone"));
                    order.setDeliverymethod(resultSet.getString("delivery_method"));
                    order.setNameoncard(resultSet.getString("name_on_card"));
                    order.setCardnumber(resultSet.getString("card_number"));
                    order.setExpirymonth(resultSet.getString("expiry_month"));
                    order.setExpiryyear(resultSet.getString("expiry_year"));
                    order.setSecuritycode(resultSet.getString("security_code"));
                    
                    return order;
                }
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
    public static boolean updateOrder(Order order) {
        String sql = "UPDATE ORDERS SET cart_id=?, product_id=?, price=?, first_name=?, last_name=?, email=?, address_one=?, address_two=?,"
                + "state=?, city=?, zipcode=?, phone=?, delivery_method=?, name_on_card=?, card_number=?, expiry_month=?, expiry_year=?, security_code=?;";

        Connection connection = db.getConnection();

        boolean updateStatus = DatabaseUtils.performDBUpdate(connection, sql, Integer.toString(order.getCartID()), Integer.toString(order.getProductID()),
                Integer.toString(order.getPrice()), order.getFirstName(), order.getLastName(), order.getEmail(), order.getAddress1(),
                order.getAddress2(), order.getState(), order.getCity(), order.getZipcode(), order.getPhone(), order.getDeliverymethod(),
                order.getNameoncard(), order.getCardnumber(), order.getExpirymonth(), order.getExpiryyear(), order.getSecuritycode());
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updateStatus;

    }

    public static boolean deleteOrder(Order retrievedOrder) {
        String sql = "DELETE FROM ORDERS WHERE CART_ID=? AND ORDER_ID=?;";
        Connection connection = db.getConnection();

        boolean updateStatus = DatabaseUtils.performDBUpdate(connection, sql, String.valueOf(retrievedOrder.getCartID()), String.valueOf(retrievedOrder.getProductID()));

        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updateStatus;
    }
}
