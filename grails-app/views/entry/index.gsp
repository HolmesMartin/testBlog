
<%@ page import="testblog.Entry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${session.user}">
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</g:if>
		<div class="list">
 <g:each in="${entryInstanceList}" status="i" var="entryInstance">
  <div class="entry">
   
   <h2><g:link action="show" id="${entryInstance.id}">${entryInstance.title}</g:link></h2>
   <p>${entryInstance.summary}</p>
   <p><b>${entryInstance.author}</b>    
   <span style = "float: right;" class="entry-date">${entryInstance.lastUpdated}</span></p>            
  </div>  
 </g:each>
</div>
		<div class="pagination">
			<g:paginate total="${entryInstanceCount ?: 0}" />
		</div>
	</body>
</html>
