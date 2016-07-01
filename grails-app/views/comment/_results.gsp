<div class="list">
		<g:each var="comment" in="${Comments}" status="i">
			<div class="entry row">
				<div class="col-md-12 summary">
					${comment?.content}
				</div>

				<div class="col-md-6 text-left">
					<b>
						${comment?.author}
					</b>
				</div>
				<div class="col-md-6 text-right">
					<span><b>Last Updated: ${comment?.lastUpdated}</b></span>
				</div>
			</div>

			<hr>

		</g:each>
	</div>