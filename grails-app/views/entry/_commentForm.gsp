<div class="clearfix col-md-12">
    <div class="col-md-9">
        <label class="col-md-12" for="content">
            <g:message code="comment.content.label" default="Comment" />
            <span class="required-indicator">*</span>
        </label>
        <g:textArea class="col-md-8 form-control" id="content" name="content" maxlength="5000" required="" value="${content}" />
        <label class="col-md-12" for="author">
            <g:message code="comment.author.label" default="Author" />
            <span class="required-indicator">*</span>
        </label>
        <g:textField class="col-md-8 form-control" id="author" name="author" maxlength="5000" required="" value="${author}" />
    </div>
    <div class="col-md-10">
        <br>
        <g:hiddenField id="entry" name="entry" value="${entryInstance.id}" />
        <div>
            <button id="commentSubmit" class="btn btn-secondary save">Submit Comment!</button>
        </div>
    </div>
</div>