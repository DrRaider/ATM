<% if (session.getAttribute("user") == null) {
	String root = request.getContextPath();
	request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
} %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <link rel="icon" href="../../favicon.ico"/>
        <title>Welcome</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Custom styles for this template-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css"/>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    </head>
    <body>
        <hgroup>
            <h3>ATM</h3>
        </hgroup>
        <form action="Controller" method="post">
            <div class="group">
                <div class="form-actions">
                    <input class="btn btn-primary" type="submit" value="Logout" name="logout"/>
                    <input class="btn btn-primary" type="submit" value="Withdraw" name="withdraw" />
                    <input class="btn btn-primary" type="submit" value="Add money" name="add"/>
                    <input class="btn btn-primary" type="submit" value="Details" name="details"/>
                </div>
            </div>
            <% 	if (request.getAttribute("success") != null) { %>
            <div class="alert alert-success" id="success-alert">
                <%= request.getAttribute("success") %>
            </div>
            <%	} %>
        </form>
    </body>
    <script>
            $("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
                $("#success-alert").slideUp(500);
            });
    </script>
</html>