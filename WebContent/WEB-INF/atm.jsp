<% if (session.getAttribute("user") == null) {
	String root = request.getContextPath();
	request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
} %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
</head>
<body>
	<h1>Index</h1>
	
	<form action="Controller" method="post">
		<div class="group">
            <div class="form-actions">
                <input class="btn btn-primary" type="submit" value="Logout" name="logout"/>
                <input class="btn btn-primary" type="submit" value="Withdraw" name="withdraw" />
				<input class="btn btn-primary" type="submit" value="Add money" name="add"/>
            </div>
        </div>
	</form>
</body>
</html>