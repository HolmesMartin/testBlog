<%@ page import="testblog.Entry"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'entry.label', default: 'Entry')}" />
        <title>
            ${entryInstance.title}
        </title>
    </head>

    <body>
        <a href="#show-entry" class="skip" tabindex="-1">
            <g:message code="default.link.skip.label" default="Skip to content&hellip;" />
        </a>
        <g:render template="adminNav" />
        <div>
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
                <div class="col-md-8"><b> ${entryInstance.author}</b></div>
                <div class="col-md-2">
                    <b><span  class="entry-date "> 
                    <g:formatDate date="${entryInstance.lastUpdated}" type="datetime" style="SMALL"/>
                </span></b>
                </div>
            </div>
        </div>
        <br>

        <g:render template="commentForm" />

        <div class="clearfix"></div>

        <g:formRemote name="fetchComments" url="[controller:'comment', action:'fetchComments']" update="[success:'results', failure:'error']">
            <g:hiddenField id="entry" name="entry" value="${entryInstance.id}" />
        </g:formRemote>

        <div class="col-md-11" id="results"></div>

        <script>
            $(document).ready(function () {
                $('#fetchComments').submit();
            });
            $("#commentSubmit").click(function () {
                if ($("#author").val() != "" && $("#content").val() != "") {
                    $.ajax({
                        "url": "${g.createLink(controller: 'comment', action: 'save')}",
                        "type": 'post',
                        "data": {
                            "author": $("#author").val(),
                            "content": $("#content").val(),
                            "entry": $("#entry").val()
                        },
                        "success": function () {
                            $('#fetchComments').submit();
                            $('#author').val("");
                            $('#content').val("");
                            resultsPage.myfunction();
                        }
                    });
                } else {
                    alert("Please fill out both comment fields");
                }
            })
        </script>
    </body>

    </html>