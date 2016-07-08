<g:if test="${session.user}">
    <div class="nav gap" role="navigation">
        <ul>
            <li>
                <a href="${createLink(uri: '/')}">
                    <g:message code="default.home.label" />
                </a>
            </li>
            <li>
                <g:link action="create">
                    <g:message code="default.new.label" args="[entityName]" />
                </g:link>
            </li>
            <g:if test="${showMenu}">
                <li>
                    <g:link action="edit" resource="${entryInstance}">
                        <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>
                </li>
                <li>
                    <g:form url="[resource:entryInstance, action:'delete']" method="DELETE">
                        <g:actionSubmit class="deleteButton" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:form>
                </li>
            </g:if>
        </ul>
    </div>
</g:if>