
<%@ page import="testblog.Entry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" href=".../web-app/css/style.css">
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
		<div class="list col-md-12 center-block">
 <g:each in="${entryInstanceList}" status="i" var="entryInstance">
  <div class="entry">
   <g:link action="show" id="${entryInstance.id}"> 
   	<h2>${entryInstance.title}</h2></g:link>
   	<div class = "summary">${entryInstance.summary}</div>

   		<b>${entryInstance.author}</b>    
   		<span style = "float: right;" class="entry-date">${entryInstance.lastUpdated}</span>
  
              
  </div> 
     <hr>
 </g:each>
</div>
	<g:if test="${entryInstanceCount>10}">
        <div class="row col-md-offset-1 col-md-10">
		<div class="pagination center-block">
			<g:paginate total="${entryInstanceCount ?: 0}" />
		</div>
        </div>
	</g:if>
	</body>
</html>
