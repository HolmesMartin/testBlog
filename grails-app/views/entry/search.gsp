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

        <g:if test="${session.user}">
            <div class="nav" role="navigation">
                <ul>
                    <li>
                        <a class="home" href="${createLink(uri: '/')}">
                            <g:message code="default.home.label" />
                        </a>
                    </li>
                    <li>
                        <g:link class="create" action="create">
                            <g:message code="default.new.label" args="[entityName]" /></g:link>
                    </li>
                </ul>
            </div>
        </g:if>
        <div class="list">
            <g:each var="Entry" in="${Entrys}">
                <div class="entry">

                    <g:link action="search" id="${Entry?.id}">
                        <h2>${Entry?.title}</h2>
                    </g:link>
                    <div class="summary">
                        <p>${Entry?.summary}</p>
                    </div>
                    <b>${Entry?.author}</b>
                    <span style="float: right;" class="entry-date">${Entry?.lastUpdated}</span>
                </div>

                <hr>
            </g:each>
        </div>
        <g:if test="${Entrys.size>10}">
            <div class="row col-md-offset-1 col-md-10">
                <div class="pagination center-block">
                    <g:paginate action="Search" total="${Entrys.size ?: 0}" />
                </div>
            </div>
        </g:if>
    </body>

    </html>