<%@ page import="testblog.Entry" %>
    <!DOCTYPE html>
    <html>
    <head>
        <meta name="layout" content="main">
        <link rel="stylesheet" href=".../web-app/css/style.css">
        <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
        <title>
            <g:message code="default.list.label" args="[entityName]" />
        </title>
    </head>

    <body>
        <g:render template="adminNav"/>
        <g:render template="posts" />
    </body>
    </html>