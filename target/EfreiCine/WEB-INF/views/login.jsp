<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <link rel="icon" href="../../favicon.ico"/>
        <title>Sign in</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
        <!-- Custom styles for this template-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css"/>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    </head>
    <body>
        <hgroup>
        <h3>Sign In</h3>
        </hgroup>
        <c:url var="loginUrl" value="/login" />
        <form action="${loginUrl}" method="post">
            <c:if test="${param.error != null}">
            <div class="alert alert-danger">
                <p>Invalid username and password.</p>
            </div>
            </c:if>
            <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                    <p>You have been logged out successfully.</p>
                </div>
            </c:if>
            <div class="group">
                <input type="text" id="username" name="ssoId" required/>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Login</label>
            </div>
            <div class="group">
                <input type="password" id="password" name="password" required><span class="highlight"></span><span class="bar"></span>
                <label>Password </label>
            </div>                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
            <div class="group">
                <div class="form-actions">
                    <input class="btn btn-primary" type="submit" value="Login"/>
                </div>
                <p class="forgot">
                    <a class="col-md-6" href="register">Don't have an account? Sign up !</a>
                    <a class="col-md-6 text-right" href="/forgot-password">Forgot Password?</a>
                </p>
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







