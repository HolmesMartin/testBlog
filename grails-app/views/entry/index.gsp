
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
  <div class="entry row">
   <g:link action="show" id="${entryInstance.id}"> 
   	<h2 id="blogId${i}">${entryInstance.title}</h2></g:link>
   	<div class = "col-md-12 summary">${entryInstance.summary}</div>

   		<div class = "col-md-4 text-left"><b>${entryInstance.author}</b></div>
        <div class = "col-md-8 text-right">
   		<span><b>Last Updated: <g:formatDate date="${entryInstance.lastUpdated}" type="datetime" style="SMALL"/></b></span>          
        </div>
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
