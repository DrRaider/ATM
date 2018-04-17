<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Objects" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<meta name="description" content=""/>
		<meta name="author" content=""/>
		<link rel="icon" href="../../favicon.ico"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
		<!-- Custom styles for this template-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css"/>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<title>Details account</title>
	</head>
	<body>
		<hgroup>
			<h1>Details account</h1>
		</hgroup>
		<% Map<String, String> transactions = (HashMap<String, String>) request.getAttribute("transactions"); %>
		<form action="Controller" method="post">
			<div class="group">
				<div class="form-actions">
					<table class="table table-striped">
						<tr>
							<th>Transfers</th>
						</tr>
						<%
							for (Map.Entry<String, String> entry : transactions.entrySet()) {
								if (Objects.equals(entry.getKey().substring(0, 1), "-")) {
						%>
						<tr class="danger">
						<%
								}
								else {
						%>
						<tr class="success">
						<%
								}
						%>
							<td>
						<%
								out.println(entry.getKey() + " €");
								out.println("<span style=\"float: right\">" + entry.getValue() + "</span>");
						%>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<h2>Total: ${amount} €</h2>
					<input class="btn btn-primary" type="submit" value="Comeback" name="Return"/>

		</div>
	</body>
</html>