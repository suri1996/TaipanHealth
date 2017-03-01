<!doctype html>
<html>
<head>
<meta name="layout" content="main_form"/>
<meta name = "keywords" content = "taipan login">

<meta name="description" content="Taipan helath login page">
  <asset:stylesheet src="freelancer.css"/>
  <asset:stylesheet src="style.css"/>
<asset:stylesheet src="login_register.css"/>
<title><g:message code="my.localized.login_title" /></title>

</head>
<body>
  <div class="container">
    <div class="card card-container">
        <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
        <h4 style = "text-align:center;"><g:message code = "my.localized.login"/></h4>
        <form class="form-signin" action = "login">

          <div class="row control-group">
              <div class="col-xs-12 floating-label-form-group controls">
                    <label><g:message code = "my.localized.email"/></label>
                    <input type="email" name = "email" class="form-control" placeholder="${message(code: 'my.localized.email')}" id="name" required data-validation-required-message="Please enter your name.">

                </div>
            </div>
            <div class="row control-group">
                <div class="col-xs-12 floating-label-form-group controls">
                    <label><g:message code = "my.localized.password"/></label>
                    <input type="password"  name = "password" class="form-control" placeholder="${message(code: 'my.localized.password')}" id="name" required data-validation-required-message="Please enter your name.">
                </div>
            </div>
            <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit"><g:message code = "my.localized.submit"/></button>
            <g:if test = "${re_controller && re_action}">
            <input type = "hidden" name = "re_controller" value = "${re_controller}" />
            <input type = "hidden" name = "re_action" value = "${re_action}" />
            </g:if>
            <g:if test="${flash.message}">
              <div class="error_message" style="display: block"><g:message code = "my.localized.incorrect_password"/></div>
            </g:if>
            <div style = "margin-top: 30px;">
            <g:link controller="registration" class = "clickLink" action = "index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code = "my.localized.not_member"/></g:link>
            </div>
            <div>
            <g:link controller="user" class = "clickLink" action = "forget_password" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code = "my.localized.forget_password" /></g:link>
            </div>
        </form><!-- /form -->
    </div><!-- /card-container -->
</div><!-- /container -->
<asset:javascript src="jquery.min.js"/>
<asset:javascript src="bootstrap.min.js"/>
<asset:javascript src="freelancer.js"/>

</body>
</html>
