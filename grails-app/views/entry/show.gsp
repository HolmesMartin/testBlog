
<%@ page import="testblog.Entry" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
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
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list entry">
			
				<g:if test="${entryInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="entry.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${entryInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entryInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="entry.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${entryInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${entryInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="entry.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${entryInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${entryInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="entry.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${entryInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
				
				<g:if test="${entryInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="entry.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label">${entryInstance?.author}</span>
					
				</li>
				</g:if>
			
			</ol>
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
					<fieldset class="buttons">
						<g:actionSubmit class="comment" action="comment" value="${message(code: 'default.button.comment.label', default: 'Comment')}"/>
					</fieldset>
				</g:form>
			</g:else>
		</div>
	</body>
</html>
