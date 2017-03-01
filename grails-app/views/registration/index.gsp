<!doctype html>

<html>
<head>
<meta name="layout" content="main_form"/>
<asset:stylesheet src="freelancer.css"/>
<asset:stylesheet src="style.css"/>
<asset:stylesheet src = "login_register.css"/>
<title><g:message code="my.localized.registration_title" /></title>
<style>
.tooltip-inner {
  white-space:nowrap;
  max-width:none;
}
.tooltip > .tooltip-inner{
  background: red;
}
</style>

</head>
<body>

<div class="container">
    <div class="card card-container">
        <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
        <h4 style = "text-align:center;"><g:message code = "my.localized.register"/></h4>
        <form class="form-signin" action = "save" id = "register_form">
          <div class="row control-group">
              <div class="col-xs-12 floating-label-form-group controls">
                    <label><g:message code = "my.localized.email"/></label>
                  <input type="email" name = "email" class="form-control" placeholder="${message(code: 'my.localized.email')}" id="name" required data-validation-required-message="Please enter your name.">

              </div>
          </div>
          <div class="row control-group">
              <div class="col-xs-12 floating-label-form-group controls">
                    <label><g:message code = "my.localized.password"/></label>
                  <input type="password"  name = "password" class="form-control" placeholder="${message(code: 'my.localized.password')}" id="password" required data-validation-required-message="Please enter your name.">

              </div>
          </div>

          <div class="row control-group">
              <div class="col-xs-12 floating-label-form-group controls">
                    <label><g:message code = "my.localized.confirm_password"/></label>
                  <input type="password"  data-toggle = "tooltip" data-placement="right"  title = "password not match"  class="form-control" placeholder="${message(code: 'my.localized.confirm_password')}" id="confirm_pw" required data-validation-required-message="Please enter your name.">
              </div>
          </div>

              <div id="remember" class="checkbox">
                  <label>
                      <input type="checkbox" value="remember-me" required><g:message code = "my.localized.agree_condition"/>
                  </label>
              </div>
              <g:if test = "${re_controller && re_action}">
              <input type = "hidden" name = "re_controller" value = "${re_controller}" />
              <input type = "hidden" name = "re_action" value = "${re_action}" />
              </g:if>
            <button class="btn btn-lg btn-primary btn-block btn-signin" type = "submit" ><g:message code = "my.localized.submit"/></button>
    <g:if test="${flash.message}">
      <div class="error_message" style="display: block;color: red;">${flash.message}</div>
    </g:if>
        </form><!-- /form -->

    </div><!-- /card-container -->




</div><!-- /container -->
    <asset:javascript src="jquery.min.js"/>
    <asset:javascript src="bootstrap.min.js"/>
    <asset:javascript src="freelancer.js"/>
    <script>
    $(document).ready(function(){

    $('#confirm_pw').tooltip().off("mouseover focus hover");
    var isCorrect = false;
    $('#confirm_pw').tooltip().off('focusout');
    $('#confirm_pw').tooltip().off('mouseover');
    $('#register_form').submit(function(){

      return isCorrect;

    });

    $('#confirm_pw').mouseover(function(){
      if($('#password').val() == $('#confirm_pw').val())
      {
        isCorrect = true;
        $('#confirm_pw').tooltip('hide');
      }
      else {
        isCorrect = false;
        $('#confirm_pw').tooltip('show');
      }
    });

    $('#confirm_pw').focus(function(){
      if($('#password').val() == $('#confirm_pw').val())
      {
        isCorrect = true;
        $('#confirm_pw').tooltip('hide');
      }
      else {

        isCorrect = false;
        $('#confirm_pw').tooltip('show');
      }
    });



    $('#confirm_pw').keyup(function(){

      if($('#password').val() == $('#confirm_pw').val())
      {
        isCorrect = true;
        $('#confirm_pw').tooltip('hide');
      }
      else {

        isCorrect = false;
        $('#confirm_pw').tooltip('show');
      }
    });

    });
    </script>
</body>
</html>
