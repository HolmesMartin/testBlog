<div class="list col-md-12 center-block">

 <g:each in="${entryInstanceList}" status="i" var="entryInstance">
  <div class="entry row">
   <g:link action="show" id="${entryInstance.id}"> 
       <h2 id="blogId${i}">${entryInstance.title}</h2></g:link>
   	<div class = "col-md-12 summary">${entryInstance.summary}</div>

   		<div class = "col-md-4 text-left"><b>${entryInstance.author}</b></div>
        <div class = "col-md-8 text-right">
   		<span><b>Last Updated: <g:formatDate date="${entryInstance.lastUpdated}" type="datetime" style="SMALL"/></b></span>          
        </div>
  </div> 
  
     <hr>
     
 </g:each>
</div>
	<g:if test="${entryInstanceCount>10}">
        <div class="row col-md-offset-1 col-md-10">
			<div class="pagination center-block">
				<g:paginate total="${entryInstanceCount ?: 0}" params="${[value:params.value]}" />
			</div>
        </div>
	</g:if>
