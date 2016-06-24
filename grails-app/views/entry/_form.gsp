<%@ page import="testblog.Entry" %>



<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="entry.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${entryInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: entryInstance, field: 'summary', 'error')} required">
	<label for="summary">
		<g:message code="entry.summary.label" default="Summary" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="summary" cols="40" rows="5" maxlength="1000" required="" value="${entryInstance?.summary}"/>

</div>

