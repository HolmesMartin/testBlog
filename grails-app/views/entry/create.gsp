<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
    <title>
        <g:message code="default.create.label" args="[entityName]" />
    </title>
</head>

<body>
    <a href="#create-entry" class="skip" tabindex="-1">
        <g:message code="default.link.skip.label" default="Skip to content&hellip;" />
    </a>
    <g:render template="adminNav" />
    <div id="create-entry" class="content scaffold-create" role="main">
        <h2><g:message code="default.create.label" args="[entityName]" /></h2>
        <g:hasErrors bean="${entryInstance}">
            <ul class="errors" role="alert">
                <g:eachError bean="${entryInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                        <g:message error="${error}" />
                    </li>
                </g:eachError>
            </ul>
        </g:hasErrors>
        <g:form url="[resource:entryInstance, action:'save']">
            <fieldset class="form">
                <g:render template="form" />
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="create" id="blogSubmit" class="button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            </fieldset>
        </g:form>
    </div>
</body>

</html>