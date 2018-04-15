package gui;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import core.Central;
import core.Routing;
import core.Security;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Central central = null;
       
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	
    	if (request.getParameter("login") != null) {
    		if (Security.login(request.getParameter("username"), request.getParameter("password"))) {
    			session.setAttribute("user", "connected");
    			central = new Central(Security.getIdCard(request.getParameter("username")));
			 	Routing.dispatch("atm", request, response);
			 } else {
    			session.setAttribute("error", "Card / Password invalid !");
    			Routing.dispatch("login", request, response);
    		}
    	}
    	
    	if (request.getParameter("logout") != null) {
    		session.removeAttribute("user");
    		Routing.dispatch("login", request, response);
    	}

    	if (request.getParameter("withdraw") != null || request.getParameter("add") != null) {
    		if (request.getParameter("withdraw") != null) {
    			request.setAttribute("trade", "Withdraw");
        	} else if (request.getParameter("add") != null)	{
    			request.setAttribute("trade", "Add money");
        	}
    		
    		Routing.dispatch("trade", request, response);
    	}

    	if (request.getParameter("run") != null) {
    		int amount = Integer.parseInt(request.getParameter("amount"));
    		boolean done = false;
    		
    		if (request.getParameter("trade").equals("Withdraw")) {

    		} else if(request.getParameter("trade").equals("Add money")) {

    		}
    		
    		if (done) {
    			request.setAttribute("success", "Success");
    			Routing.dispatch("atm", request, response);
    		} else {
    			request.setAttribute("error", "Error");
    			Routing.dispatch("trade", request, response);
    		}
    	}
    	
    	Routing.dispatch("login", request, response);
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	    processRequest(request, response);
	     
	}
}
