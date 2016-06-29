
<%@ page import="testblog.Entry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
		<title>${entryInstance.title}</title>
	</head>
	<body>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<a href="#show-entry" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<g:if test="${session.user}">
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</div>
		</g:if>
		<div id="show-entry" class="content scaffold-show" role="main">
			<h1 id="blogTitle">${entryInstance.title}</h1>
			<div id="blogContent" class="entry col-md-12">
				<div class = "col-md-10">         
                	<p>${entryInstance.summary}</p>
				</div>
			</div> 
            <div class = "col-md-12">            
                <b>${entryInstance.author}</b>    
                <span style = "float: right;" class="entry-date">${entryInstance.lastUpdated}</span>
            </div>        
			  
			<g:if test="${session.user}">
				<g:form url="[resource:entryInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<g:link class="edit" action="edit" resource="${entryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</fieldset>
				</g:form>
			</g:if>
			<g:else>
				<g:form url="[resource:entryInstance, action:'comment']" method="PUT">
					<fieldset class="buttons col-md-12">
						<g:actionSubmit action="comment" value="${message(code: 'default.button.comment.label', default: 'Comment')}"/>
					</fieldset>
				</g:form>
			</g:else>
		</div>
	</body>
</html>
