<!doctype html>
<html>
<head>
<meta name="layout" content="main_form"/>
<asset:stylesheet src="freelancer.css"/>
<asset:stylesheet src="style.css"/>
<asset:stylesheet src="login_register.css"/>
<title>Taipan Health | Change Password</title>
<style>


</style>
</head>
<body>

  <div class="container">
    <div class="card card-container">

        <h4 style = "text-align:center;"><g:message code = "my.localized.forget_password"/></h4>
        <form class="form-signin" action = "password_reset" id = "change_form">

          <div class="row control-group">
              <div class="col-xs-12 floating-label-form-group controls">
                    <label><g:message code = "my.localized.email"/></label>
                    <input type="email" name = "email" class="form-control" placeholder="${message(code: 'my.localized.email')}" required data-validation-required-message="Please enter your email.">
                </div>
                </div>
                <!--
                <div class="row control-group">
                    <div class="col-xs-12 floating-label-form-group controls">
                      <label><g:message code = "my.localized.phone"/></label>
                      <input type="text" name = "phone" class="form-control" placeholder="${message(code: 'my.localized.phone')}" required data-validation-required-message="Please enter your phone.">
                    </div>
                  </div>
                -->

            <button class="btn btn-lg btn-primary" type="submit"><g:message code = "my.localized.submit"/></button>

            <g:if test="${flash.message}">
              <div class="error_message" style="display: block"><g:message code = "my.localized.invalid_email_phone" /></div>
            </g:if>

        </form><!-- /form -->
    </div><!-- /card-container -->
</div><!-- /container -->
<asset:javascript src="jquery.min.js"/>
<asset:javascript src="bootstrap.min.js"/>
<asset:javascript src="freelancer.js"/>
</body>
</html>
