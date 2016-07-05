<%@ page import="testblog.Entry"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'entry.label', default: 'Entry')}" />
<title>
	${entryInstance.title}
</title>
</head>
<body>
	<g:if test="${flash.message}">
		<div class="message" role="status">
			${flash.message}
		</div>
	</g:if>
	<a href="#show-entry" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<g:if test="${session.user}">
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message
							code="default.home.label" /></a></li>
				<li><g:link class="list" action="index">
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="create" action="create">
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
			</ul>
		</div>
	</g:if>
	<div id="show-entry" class="content scaffold-show" role="main">
		<h1 id="blogTitle">
			${entryInstance.title}
		</h1>
		<div id="blogContent" class="entry col-md-12">
			<div class="col-md-10">
				<p>
					${entryInstance.summary}
				</p>
			</div>
		</div>
		<div class="col-md-12">
			<b> ${entryInstance.author}
			 <span style="float: right;" class="entry-date"> <g:formatDate date="${entryInstance.lastUpdated}" type="datetime" style="SMALL"/></b>
			</span>
		</div>

		<g:if test="${session.user}">
			<g:form url="[resource:entryInstance, action:'delete']"
				method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${entryInstance}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:actionSubmit class="delete" action="delete"
						value="${message(code: 'default.button.delete.label', default: 'Delete')}"
						onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</g:if>

		<g:formRemote name ="saveComment" url="[controller:'comment', action:'save']">
			
			<fieldset class="buttons col-md-12">
				<div
					class="fieldcontain ${hasErrors(bean: commentInstance, field: 'author', 'error')} required">
					<label for="author"> <g:message code="comment.author.label"
							default="Author" /> <span class="required-indicator">*</span>
					</label>
					<g:textArea id="author" name="author" cols="40" rows="5"
						maxlength="5000" required="" value="${author}" />
				</div>

				<div
					class="fieldcontain ${hasErrors(bean: commentInstance, field: 'content', 'error')} required">
					<label for="content"> <g:message
							code="comment.content.label" default="Comment" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textArea id="content" name="content" cols="40" rows="5"
						maxlength="5000" required="" value="${content}" />
				</div>
				<g:hiddenField id="entry" name="entry" value="${entryInstance.id}" />
			</fieldset>
			<fieldset>
				<g:submitButton name="create" id="commentSubmit"
					class="btn btn-primary save"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:formRemote>
	</div>
	<g:formRemote name="fetchComments"
		url="[controller:'comment', action:'fetchComments']"
		update="[success:'results', failure:'error']">
		<g:hiddenField id="entry" name="entry" value="${entryInstance.id}" />
	</g:formRemote>
	<div id="error"></div>
	<div>Comments:</div>
	<div id="results"></div>
	<script>
		$(document).ready(function() {
			$('#fetchComments').submit();
		});
		$("#commentSubmit").ajaxComplete(function() {
			$('#fetchComments').submit();
		});
	</script>
</body>
</html>
