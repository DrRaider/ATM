<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <link rel="icon" href="../../favicon.ico"/>
        <title>Sign up</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
        <!-- Custom styles for this template-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/app.css"/>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    </head>
    <body>
        <hgroup>
        <h3>Sign Up</h3>
        </hgroup>
        <form:form method="POST" modelAttribute="user">
            <div class="group">
                <form:input required="true" type="text" path="firstName" id="firstName"/>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>First Name</label>
                <div class="has-error">
                    <form:errors path="firstName" class="help-inline"/>
                </div>
            </div>
            <div class="group">
                <form:input required="true" type="text" path="lastName" id="lastname"/>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Last Name</label>
                <div class="has-error">
                    <form:errors path="lastName" class="help-inline"/>
                </div>
            </div>
            <div class="group">
                <form:input required="true" type="text" path="ssoId" id="ssoID"/>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>SSO ID</label>
                <div class="has-error">
                    <form:errors path="ssoId" class="help-inline"/>
                </div>
            </div>
            <div class="group">
                <form:input required="true" type="text" path="password" id="password"/>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Password</label>
                <div class="has-error">
                    <form:errors path="password" class="help-inline"/>
                </div>
            </div>
            <div class="group">
                <form:input required="true" type="text" path="email" id="email"/>
                <span class="highlight"></span>
                <span class="bar"></span>
                <label>Email</label>
                <div class="has-error">
                    <form:errors path="email" class="help-inline"/>
                </div>
            </div>
            <div class="form-actions">
                <input class="btn btn-primary" type="submit" value="Sign Up"/>
            </div>
        </form:form>
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







