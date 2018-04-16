package core;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Statement;

import dao.Database;

public class Central {
	private int idCard;
	private Connection db = Database.getConnection();
	
	public Central(int idCard) {
		this.idCard = idCard;
	}
	
	public boolean withdraw(String input) {
		int amount = 0;

		try {
			amount = Integer.parseInt(input);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return false;
	    }
		
		try {
			PreparedStatement preparedStatement = db.prepareStatement("SELECT SUM(AMOUNT) SUM FROM TRANSACTION WHERE ID_CARD = ?");
	        preparedStatement.setInt(1, idCard);
	        ResultSet result = preparedStatement.executeQuery();
	        int total_amount = 0;
	
	        while (result.next()) {
	        	total_amount = result.getInt("SUM");
	        }

	    	if (amount <= total_amount) {
				Statement statement = (Statement) db.createStatement();
				statement.execute("INSERT INTO TRANSACTION (ID, AMOUNT, ID_CARD) VALUES (NULL, -" + amount + ", " + this.idCard + ")");
	    	} else {
	    		return false;
	    	}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}
	
	public boolean addMoney(String input) {
		int amount = 0;

		try {
			amount = Integer.parseInt(input);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return false;
	    }

		try {
			Statement statement = (Statement) db.createStatement();
			statement.execute("INSERT INTO TRANSACTION (ID, AMOUNT, ID_CARD) VALUES (NULL, " + amount + ", " + this.idCard + ")");
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}
	
	public String amount() {
        PreparedStatement statement = null;
        ResultSet result = null;

        try {
            statement = db.prepareStatement("SELECT SUM(AMOUNT) SUM FROM TRANSACTION WHERE ID_CARD = ?");
            statement.setInt(1, idCard);
            result = statement.executeQuery();

            while (result.next()) {
            	if (result.getString("SUM") != null) {
            		return result.getString("SUM");
            	}
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "0";
	}
	
	public ArrayList transactions() {
		ArrayList t = new ArrayList();
		PreparedStatement statement = null;
        ResultSet result = null;

        try {
            statement = db.prepareStatement("SELECT AMOUNT FROM TRANSACTION WHERE ID_CARD = ?");
            statement.setInt(1, idCard);
            result = statement.executeQuery();

            while (result.next()) {
            	t.add(result.getString("AMOUNT"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		return t;
	}
}
