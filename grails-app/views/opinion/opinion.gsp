<!doctype html>
<html>
	<head>
	    <meta name="layout" content="main"/>
			<meta name="keywords" content="Review radiology report, Second opinion, Other specialist, Alternative treatment plan, Western specialist, Review treatment plan, Sports injury knee, Knee arthroplasty, Orthopedic surgery, Cancer second opinion">
	    <title><g:message code="my.localized.footera" /> | <g:message code = "my.localized.opi1"/></title>
  </head>
  <body>
		<asset:stylesheet src="h.css"/>
    <div class="container content">
			<div class="text-center">
      	<h1><g:message code = "my.localized.welcome"/> <g:message code = "my.localized.opinion"/></h1>
	    </div>
			<br>
			<div class = "col-md-12">
				<p>
					<g:message code = "my.localized.opiniondes"/>
				</p>
			</div>
			<br>
			<div class="col-md-12 col-sm-12">
				<div class = "row text-center">
					<div class = "col-md-4">
						<g:link controller = "opinion" action="review_report" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
							<asset:image class="img-circle" src="sca.png" style="img-responsive"/>
							<br>
							<h4><g:message code = "my.localized.opser1"/></h4>
						</g:link>
					</div>
					<div class = "col-md-4">
						<g:link controller = "opinion" action="review_plan" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
							<asset:image class="img-circle" src="rev.png" style="img-responsive"/>
							<br>
							<h4><g:message code = "my.localized.opser2"/></h4>
						</g:link>
					</div>
					<div class = "col-md-4">
						<g:link controller = "opinion" action="alternative_plan" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
							<asset:image class="img-circle" src="tre.png" style="img-responsive"/>
							<br>
							<h4><g:message code = "my.localized.opser3"/></h4>
						</g:link>
					</div>
				</div>
			</div>
			<br><br><br><br>
  	</div>
	  <br><br><br>
  </body>
</html>
