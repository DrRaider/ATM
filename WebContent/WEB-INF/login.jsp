<% if (session.getAttribute("user") != null) {
	String root = request.getContextPath();
	request.getRequestDispatcher("/WEB-INF/atm.jsp").forward(request, response);
} %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Sign in</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Custom styles for this template-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css"/>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    </head>
    <body>
        <hgroup>
        <h3>Sign In</h3>
        </hgroup>
        <form action="Controller" method="post">
            <% String error = (String) session.getAttribute("error");
            if (error != null) {
            %>
	            <div class="alert alert-danger">
	                <p><%= error %></p>
	            </div>
	        	<% session.removeAttribute("error");
            } %>
           	
            <!-- 
            <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                    <p>You have been logged out successfully.</p>
                </div>
            </c:if>
            -->
            <div class="group">
                <input type="text" id="username" name="username" required/>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Login</label>
            </div>
            <div class="group">
                <input type="password" id="password" name="password" required><span class="highlight"></span><span class="bar"></span>
                <label>Password </label>
            </div>
            <div class="group">
                <div class="form-actions">
                    <input class="btn btn-primary" type="submit" value="Login" name="login"/>
                </div>
            </div>
        </form>
    </body>
    <script>
        $(document).ready(function() {
            $('input').blur(function () {
                var $this = $(this);
                if ($this.val())
                    $this.addClass('used');
                else
                    $this.removeClass('used');
            });
        });
    </script>
</html>







