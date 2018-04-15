<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>${trade}</title>
</head>
<body>
	<h1>${trade}</h1>
	<% 	if (request.getAttribute("error") != null) { %>
			<div class="alert alert-danger" role="alert">
				<%= request.getAttribute("error") %>
		    </div>
	<%	} %>

	<form action="Controller" method="post">
		<input type="hidden" value="${trade}" name="trade"/>
		<label>Amount : </label>
		<input type="text" name="amount"/><br>
        <input type="submit" value="Submit" name="run"/>
	</form>
</body>
</html>