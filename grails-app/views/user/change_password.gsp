<!doctype html>
<html>
<head>
<meta name="layout" content="main_form"/>
<asset:stylesheet src="freelancer.css"/>
<asset:stylesheet src="style.css"/>
<asset:stylesheet src="login_register.css"/>
<title>Taipan Health | Change Password</title>
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

        <h4 style = "text-align:center;"><g:message code = "my.localized.changepassword"/></h4>
        <form class="form-signin" action = "password_check" id = "change_form">

          <div class="row control-group">
              <div class="col-xs-12 floating-label-form-group controls">
                    <label><g:message code = "my.localized.ori_password"/></label>
                    <input type="password" name = "old_password" class="form-control" placeholder="${message(code: 'my.localized.ori_password')}" id="old" required data-validation-required-message="Please enter your name.">

                </div>
            </div>
            <div class="row control-group">
                <div class="col-xs-12 floating-label-form-group controls">
                    <label><g:message code = "my.localized.password"/></label>
                    <input type="password"  name = "new_password" class="form-control" placeholder="${message(code: 'my.localized.new_password')}" id="new_pw" required data-validation-required-message="Please enter your name.">

                </div>
            </div>

            <div class="row control-group">
                <div class="col-xs-12 floating-label-form-group controls">
                    <label><g:message code = "my.localized.confirm_password"/></label>
                    <input type="password"  data-toggle = "tooltip" data-placement="right"  title = "password not match" class="form-control" placeholder="${message(code: 'my.localized.confirm_password')}" id="confirm_pw" required data-validation-required-message="Please enter your name.">

                </div>
            </div>
            <button class="btn btn-lg btn-primary" type="submit"><g:message code = "my.localized.submit"/></button>
            <g:if test = "${params.control && params.link}">
            <input type = "hidden" name = "control" value = "${params.control}" />
            <input type = "hidden" name = "link" value = "${params.link}" />
            </g:if>
            <g:if test="${flash.message}">
              <div class="error_message" style="display: block">${flash.message}</div>
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
$('#change_form').submit(function(){
  return isCorrect;

});

$('#confirm_pw').mouseover(function(){
  if($('#new_pw').val() == $('#confirm_pw').val())
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
  if($('#new_pw').val() == $('#confirm_pw').val())
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

  if($('#new_pw').val() == $('#confirm_pw').val())
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
