package core;

import java.sql.Connection;
import dao.Database;

public class Central {
	private int idCard;
	private Connection db = Database.getConnection();
	
	public Central(int idCard) {
		this.idCard = idCard;
	}
	
	
}
