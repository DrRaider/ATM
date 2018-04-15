<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
</head>
<body>
	<h1>${trade}</h1>
	<%
		if (request.getAttribute("error") != null) {
			out.println("<span style=\"color:red\">" + request.getAttribute("error") + "</span>");
		}
	%>
	<form action="Controller" method="post">
		<input type="hidden" name="trade" value=${trade}/>
		<label>Amount : </label>
		<input type="text" name="amount" value=""/><br>
        <%
        	System.out.println("trade:"+request.getAttribute("trade"));
        	if (request.getAttribute("trade") == "Transfert money") {
        		out.println("<label>receiver : </label><input type='text' name='2account' value=''/><br>");
        	}
        %>
        <input type="submit" name="run" value="Submit"/>
	</form>
</body>
</html>