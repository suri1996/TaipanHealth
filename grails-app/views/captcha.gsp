<!doctype html>
<html>
	<head>
	    <meta name="layout" content="main"/>
	    <title>Taipan Health | Contact us</title>

  </head>
	<body>
	  <g:form controller = "contact" action="reCaptcha" params = "[lang: 'en']" method="post" >
	    <recaptcha:ifEnabled>
    <recaptcha:recaptcha theme="dark"/>
	    </recaptcha:ifEnabled>
	    <br/>
	    <g:submitButton name="submit"/>
	  </g:form>
	  <recaptcha:script/>
	</body>
</html>
