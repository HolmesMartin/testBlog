<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title>
        <g:message code="default.create.label" args="[entityName]" />
    </title>
</head>

<body>
    <div class="body">
        <h2>Login</h2>
        <g:form action="authenticate" method="post">
            <div class="dialog col-md-4">
                <label for="login">Login:</label>
                <input type="text" id="login" name="login" class="form-control" />
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" class="form-control"/>
            </div>
            <div class="buttons col-md-12">
                <span class="button">
	               <input type="submit" value="Login" />
                </span>
            </div>
            <br>
        </g:form>
    </div>
</body>

</html>