<!doctype html>
<html>
	<head>
	    <meta name="layout" content="main"/>
	    <title><g:message code="my.localized.footera" /> | <g:message code = "my.localized.reset_success"/></title>
  </head>


  <body>
		<asset:stylesheet src="h.css"/>
    <div class="row container content text-center">
      <h3><g:message code = "my.localized.reset_success"/></h3>
			<br />
			<g:message code = "my.localized.reset_success_message" />
			<br>
			<br />
			<a href = "/"><g:message code = "my.localized.thanks_redirect"/></a>
			<br/>
			<br/>
		</div>
		<asset:javascript src = "jquery.js"/>
		<script>
		$(document).ready(function(){
			setTimeout(function(){
  			window.location.href = "/";

			},10000);

		});
		</script>
  </body>




</html>
