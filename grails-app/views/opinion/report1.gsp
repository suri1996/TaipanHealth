<!doctype html>
<html>
	<head>
	    <meta name="layout" content="main"/>
			<meta name="keywords" content="Review radiology report, Second opinion, Other specialist, Alternative treatment plan, Western specialist, Review treatment plan, Sports injury knee, Knee arthroplasty, Orthopedic surgery, Cancer second opinion">
	    <title><g:message code="my.localized.footera" /> | <g:message code = "my.localized.review_report"/></title>
  </head>
  <body>
		<asset:stylesheet src="h.css"/>
    <div class="container">
      <div class="text-center">
      	<h1><g:message code = "my.localized.review_report"/></h1>
	    </div>
      <div class="col-md-6 col-sm-8 col-xs-12">
        <h3 class="text-center"><g:message code = "my.localized.review_services"/></h3>
        <div class="table-responsive">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th><g:message code = "my.localized.services"/></th>
              </tr>
            </thead>
						<tbody>
    				<g:each var = "product_item" in = "${product}">
							<tr>
							<td><g:link controller = "user" action="report" params = "${[lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">${product_item.name_en}</g:link></td>
							</tr>
						</g:each>
            </tbody>
          </table>
        </div>
      </div>
      <div class = "col-md-6 col-sm-4 col-xs-12">
        <br>
        <br>
        <p>
					<g:message code = "my.localized.radiology_login" />
        </p>
      </div>
  	</div>
  </body>
</html>
