package core;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Routing {
	public static void dispatch(String page, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String root = request.getContextPath();
		switch (page) {
			case "login":
				request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
				break;
			case "atm":
				request.getRequestDispatcher("/WEB-INF/atm.jsp").forward(request, response);
				break;
			case "trade":
				request.getRequestDispatcher("/WEB-INF/trade.jsp").forward(request, response);
				break;
			default:
				request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
				break;
		}
		return;
	}
}
