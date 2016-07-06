<%@ page import="testblog.Entry" %>



<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="entry.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="blogTitle" name="title" required="" value="${entryInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'summary', 'error')} required">
	<label for="summary">
		<g:message code="entry.summary.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea id="blogContent" name="summary" cols="40" rows="5" maxlength="5000" required="" value="${entryInstance?.summary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'Author', 'error')} required">
	<label for="Author">
		<g:message code="entry.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField id="blogAuthor" name="author" required="" value="${session.user.toString()}"/>
</div>

