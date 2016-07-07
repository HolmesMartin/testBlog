<%@ page import="testblog.Entry" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
        <title>
            <g:message code="default.edit.label" args="[entityName]" />
        </title>
    </head>

    <body>
        <a href="#edit-entry" class="skip" tabindex="-1">
            <g:message code="default.link.skip.label" default="Skip to content&hellip;" />
        </a>
        <g:render template="adminNav"></g:render>
        <div id="edit-entry" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:hasErrors bean="${entryInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${entryInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                            <g:message error="${error}" />
                        </li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form url="[resource:entryInstance, action:'update']" method="PUT">
                <g:hiddenField name="version" value="${entryInstance?.version}" />
                <fieldset class="form">
                    <g:render template="form" />
                </fieldset>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>

    </html>