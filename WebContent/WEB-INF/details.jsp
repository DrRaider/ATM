<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Details account</title>
</head>
<body>
	<h1>Details account</h1>
	<p>Amount: ${amount} €</p>
	<% ArrayList<String> transactions = (ArrayList<String>) request.getAttribute("transactions");

	for(String transaction : transactions) {
	    out.println(transaction + " €");
	} %>
</body>
</html>