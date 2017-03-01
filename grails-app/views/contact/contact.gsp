<!doctype html>
<html>
	<head>
	    <meta name="layout" content="main"/>
	    <title><g:message code = "my.localized.footera" /> | <g:message code = "my.localized.contact" /></title>
  </head>
  <body>
		<asset:stylesheet src="h.css"/>
		<div class="container content">
      <div class="row">
        <div class="col-md-8 col-sm-4 text-center">
          <h2><g:message code = "my.localized.contact"/></h2>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-sm-8 col-xs-12">
          <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
          <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->

          <form name="sentMessage" id = "sendMessage" method = "post" action =  "/${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}/contact/save">
            <div class="row control-group">
              <div class="floating-label-form-group controls">
                <label><g:message code = "my.localized.name" /></label>
                <input type="text" class="form-control" name = "name" placeholder="${message(code: 'my.localized.name')}" id="name" required data-validation-required-message="Please enter your name.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="row control-group">
              <div class="floating-label-form-group controls">
                <label><g:message code = "my.localized.email" /></label>
                <input type="email" class="form-control" name = "email" placeholder="${message(code: 'my.localized.email')}" id="email" required data-validation-required-message="Please enter your email address.">
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="row control-group">
              <div class="floating-label-form-group controls">
                <label><g:message code = "my.localized.phone" /></label>
                <input type="tel" class="form-control" name = "phone" placeholder="${message(code: 'my.localized.phone')}" id="phone" required data-validation-required-message="Please enter your phone number.">
              	<p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="row control-group">
              <div class="floating-label-form-group controls">
                <label><g:message code = "my.localized.leaving_message" /></label>
                <textarea rows="5" class="form-control" name = "message" placeholder="${message(code: 'my.localized.leaving_message')}" id="message" required data-validation-required-message="Please enter a message."></textarea>
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div>
              <button type="submit"  class="btn btn-success btn-lg" style="width:100%;"><g:message code = "my.localized.submit"/></button>
            </div>
          </form>
        </div>
				<div class="col-md-4 col-sm-4 col-xs-12">
					<p>
						<br>
						<g:message code = "my.localized.faqa47" /><br>
						<g:message code = "my.localized.faqa48" /><br>
						<g:message code = "my.localized.hours" /><br>
						<g:message code = "my.localized.email" />: <a href="mailto:info@taipanhealth.com" target="_top">info@taipanhealth.com</a>
					</p>
				</div>
      </div>
  	</div>

		<asset:javascript src="jquery.min.js"/>
		<asset:javascript src="submit.js"/>
	  <br><br><br>
	</body>
</html>
