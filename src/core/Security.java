package core;

import dao.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Security {
	public static Boolean login(String login, String password) {
        Connection db = Database.getConnection();
        PreparedStatement statement = null;
        ResultSet result;
        
        try {
            String query = "SELECT CARD.ID FROM CARD INNER JOIN USERS ON USERS.ID = CARD.ID_USER WHERE CARD.CARD = SHA1(?) AND CARD.PASSWORD = SHA1(?) AND USERS.BANK = 1";
            statement = db.prepareStatement(query);
            statement.setString(1, login);
            statement.setString(2, password);
            result = statement.executeQuery();

            if (result.next()) {
                return true;
            } else {
                query = "SELECT CARD.ID FROM CARD INNER JOIN USERS ON USERS.ID = CARD.ID_USER WHERE CARD.CARD = SHA1(?) AND CARD.PASSWORD = SHA1(?) AND USERS.BANK = 0";
                statement = db.prepareStatement(query);
                statement.setString(1, login);
                statement.setString(2, password);
                result = statement.executeQuery();

                if (result.next()) {
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
	}
	
	public static int getIdCard(String login) {
        Connection db = Database.getConnection();
        PreparedStatement statement = null;
        ResultSet result;
        int idCard = 1;

        try {
            String query = "SELECT CARD.ID FROM CARD INNER JOIN USERS ON USERS.ID = CARD.ID_USER WHERE CARD.CARD = ?";
            statement = db.prepareStatement(query);
            statement.setString(1, login);
            result = statement.executeQuery();

            while (result.next()) {
            	idCard = result.getInt("ID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return idCard;
	}
}
