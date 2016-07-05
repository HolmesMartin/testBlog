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
		<div class = "clearfix">
        <h2 id="blogTitle">
			${entryInstance.title}
		</h2>
		<div id="blogContent" class="entry col-md-12">
			<div class="col-md-10">
				<p>
					<pre>${entryInstance.summary}</pre>
				</p>
			</div>
		</div>
		<div class="col-md-12">
			<div class = "col-md-8"><b> ${entryInstance.author}</div>
			 <div class = "col-md-2"><b><span  class="entry-date "></b> <g:formatDate date="${entryInstance.lastUpdated}" type="datetime" style="SMALL"/>
                 </span></b></div>
		</div>
       </div> <br>
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
    </div>
		<g:formRemote class = "clearfix" name ="saveComment" url="[controller:'comment', action:'save']">
			
			<div class="col-md-12">
                <div class = "col-md-9">
                <div
					class="${hasErrors(bean: commentInstance, field: 'content', 'error')} required">
					<label for="content"> <g:message
							code="comment.content.label" default="Comment" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textArea class = "col-md-8 form-control" id="content" name="content" 
						maxlength="5000" required="" value="${content}" />
				</div>
				<div
					class="${hasErrors(bean: commentInstance, field: 'author', 'error')} required">
					<label for="author"> <g:message code="comment.author.label"
							default="Author" /> <span class="required-indicator">*</span>
					</label>
					<g:textField class = "form-control" id="author" name="author"
						maxlength="5000" required="" value="${author}" />
				</div>
                </div>
				<div class = "col-md-10">
                    <br>
                    <g:hiddenField id="entry" name="entry" value="${entryInstance.id}" />
                    <div>
                        <g:submitButton name="create" id="commentSubmit"
                            class="btn btn-secondary save"
                            value="Submit Comment!" />
                    </div>
                </div>
			</div>
		</g:formRemote>
	
    <div class = "clearfix"></div>
	<g:formRemote name="fetchComments"
		url="[controller:'comment', action:'fetchComments']"
		update="[success:'results', failure:'error']">
		<g:hiddenField id="entry" name="entry" value="${entryInstance.id}" />
	</g:formRemote>


		<div  class = "col-md-11" id="results"></div>

	<script>
		$(document).ready(function() {
			$('#fetchComments').submit();
			});
        $(document).ajaxSuccess(function(){
            if($("#content").val() != '' && $("#author").val() != ''){
			$('#fetchComments').submit();
            $('#saveComment')[0].reset();
            }
        })
	</script>
</body>
</html>
