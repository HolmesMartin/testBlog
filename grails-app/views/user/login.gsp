<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="body">
	      <h2>Login</h2>
	      <g:if test="${flash.message}">
	        <div class="message">${flash.message}</div>
	      </g:if>
	      <g:form action="authenticate" method="post" >
	        <div class="dialog">
	          <table>
	            <tbody>            
	              <tr class="prop">
	                <td class="name">
	                  <label for="login">Login:</label>
	                </td>
	                <td>
	                  <input type="text" id="login" name="login"/>
	                </td>
	              </tr> 
	          
	              <tr class="prop">
	                <td class="name">
	                  <label for="password">Password:</label>
	                </td>
	                <td>
	                  <input type="password" id="password" name="password"/>
	                </td>
	              </tr> 
	            </tbody>
	          </table>
	        </div>
	        <div class="buttons">
                <span class="button">
	               <input type="submit" value="Login" />
                </span>
                <span>
                    <a href="/testBlog/user/create">Create User</a>
                </span>
	        </div>
              <br>
	      </g:form>
	    </div>
	</body>
</html>
