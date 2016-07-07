<g:if test="${Comments}">
    <div class="commentHeader">
        <h3>Converse with your fellow readers and the authors below!</h3>
    </div>
    <div class="list  commentSection">
        <g:each var="comment" in="${Comments}" status="i">
            <div class="entry row">
                <div class="col-md-12 summary">
                    <pre>${comment?.content}</pre>
                </div>

                <div class="col-md-6 text-left author">
                    <b>
						<pre><span><b>${comment?.author}</b></span>
                    </pre>
                    </b>
                </div>
                <div class="col-md-6 text-right date">
                    <pre><span><b>Last Updated: <g:formatDate date="${comment?.lastUpdated}" type="datetime" style="SMALL"/></b></span></pre>
                </div>
            </div>
            <hr>
        </g:each>
    </div>
</g:if>
<g:else>
    <div class="commentSection">
        There are currently no comments. Be the first to share your thoughts!
    </div>
</g:else>