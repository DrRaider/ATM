package dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class Database {
    private static String url = "jdbc:mysql://localhost:3306/atm";
    private static String driverName = "com.mysql.jdbc.Driver";
    private static String username = "root";
    private static String password = "";
    private static Connection db = null;

    public static Connection getConnection() {
    	if (db == null) {
	    	try {
	            Class.forName(driverName);
	            try {
	            	db = DriverManager.getConnection(url, username, password);
	            } catch (SQLException ex) {
	                System.out.println("Failed to create the database connection : " + ex);
	            }
	        } catch (ClassNotFoundException ex) {
	            System.out.println("Driver not found."); 
	        }
    	}

        return db;
    }

    public static void logout(){
        try {
            if (db != null) {
                db.close();
                db = null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
