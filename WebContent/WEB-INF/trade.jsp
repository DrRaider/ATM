<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
	<head>
		<meta charset="UTF-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<meta name="description" content=""/>
		<meta name="author" content=""/>
		<link rel="icon" href="../../favicon.ico"/>
		<title>${trade}</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
		<!-- Custom styles for this template-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css"/>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	</head>
	<body>
		<hgroup>
            <h3>${trade}</h3>
        </hgroup>
		<form action="Controller" method="post">
			<div class="group">
				<input type="hidden" value="${trade}" name="trade"/>
				<input type="number" name="amount"/>
				<span class="highlight"></span>
				<span class="bar"></span>
				<label>Amount : </label>
			</div>
            <br>
            <br>
			<div class="group">
				<div class="form-actions">
                    <input class="btn btn-primary" type="submit" value="Submit" name="run"/>
				</div>
			</div>
            <% 	if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= request.getAttribute("error") %>
            </div>
            <%	} %>
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