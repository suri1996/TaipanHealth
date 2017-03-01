<!doctype html>
<html>
<head>
<meta name="layout" content="main"/>
<title>Taipan Health | Information</title>
<style = "type/css">
.black_link{
  color: #000000;
}
.row{
  margin-bottom: 20px;
}

/**
 * Inline Text Editing 1.3 - CSS Temp
 * April 26, 2010
 * Corey Hart @ http://www.codenothing.com
 */

textarea {
	width: 300px;
	height: 150px;
}

.inline-edit {
	width: 500px;
}

.inline-edit .form {
	display: none;
}

.inline-edit .hover {
	background-color: #EEEEEE;
	cursor: pointer;
}
.inline-edit{
  border: none;
}


</style>


</head>

<div class = "container content">

    <ul class="nav nav-tabs nav-justified">
        <li class = "active tab"><g:link action = "info" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" class = "black_link">
        <g:message code = 'my.localized.account_info' /> </g:link>
        </li>
        <li>
         <g:link action = "group" class = "black_link" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
         <g:message code = 'my.localized.member_list' /></g:link></li>
         <li>
           <g:link action = "history" class = "black_link" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
        <g:message code = 'my.localized.history' />
         </g:link>
       </li>

    </ul>
<br />
<div class = "row">
<div class="col-md-4">
<g:message code = "my.localized.account"/>:
</div>
<div class="col-md-8">
<g:if test="${parmas.email}">
  <div class="error_message" style="display: block">${parmas.email}</div>
</g:if>
</div>
</div>
<div class = "row">
<div class="col-md-4">
<g:message code = "my.localized.password"/>:
</div>
<div class="col-md-8">
<g:if test="${password}">
  <div class="error_message" style="display: block">${password}
    <g:link controller = "user" action = "change_password" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"
        class = "black_link" style = "color: #cccccc; text-decoration: none;">  &nbsp <g:message code = "my.localized.changepassword" /></g:link></div>
</g:if>
</div>
</div>


<!--
<div class = "row">
<div class="col-md-4">
<g:message code = "my.localized.name"/>:
</div>
<div class="col-md-8 inline-edit" id = "name">
<g:if test="${parmas.name}">
  <div class="display"  style="display: block">${parmas.name}</div>
  <div class='form'>
    <input type='text' class='text'/><br>
    <input type='submit' class='save' value=' Save ' />
    <input type='submit' class='cancel' value=' Cancel ' />
  </div>

</g:if>
</div>
</div>
-->
<!--
<div class = "row">
<div class="col-md-4">
<g:message code = "my.localized.phone"/>:
</div>

<div class="col-md-8 inline-edit" id = "phone">
<g:if test="${parmas.phone}">
  <div class="display" style="display: block">${parmas.phone}</div>
  <div class='form'>
    <input type='tel' class='text' onkeypress = "return isNumberKey(event)" /><br>
    <input type='submit' class='save' value=' Save ' />
    <input type='submit' class='cancel' value=' Cancel ' />
  </div>
</g:if>
</div>
</div>
-->
<div class = "row">
<div class="col-md-4">
<g:message code = "my.localized.country"/>:
</div>
<div class="col-md-8 inline-edit">
  <g:if test="${parmas.country}">
  <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
  <g:select name = "company_select"  class="form-control" id = "company_select" from = "${country_list}"  optionKey = "name_en" optionValue = "name_zt" value = "${parmas.country}"   required = "required" />
</g:if>
<g:elseif test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
<g:select name = "company_select"  class="form-control" id = "company_select" from = "${country_list}"  optionKey = "name_en" optionValue = "name_zs" value = "${parmas.country}"   required = "required" />
</g:elseif>
<g:else>
<g:select name = "company_select"  class="form-control" id = "company_select" from = "${country_list}"  optionKey = "name_en" optionValue = "name_en" value = "${parmas.country}"   required = "required" />
</g:else>
</g:if>
</div>
</div>


</div>
</div>
<asset:javascript src="jquery.min.js"/>
<asset:javascript src = "jquery.inline-edit.js"/>

<script>

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

   jQuery(function( $ ){
   	$('.inline-edit').inlineEdit({hover: 'hover'})
  });

  		$(document).ready(function(){
        $('#name').keyup(function(event){
          if(event.keyCode == 13)
            $('#name .save').click();
        });
        $('#phone').keyup(function(event){
          if(event.keyCode == 13)
            $('#phone .save').click();

        });


        $('#company_select').change(function(){

          $.ajax({
              url: 'edit_country',
              data: {'text' : $('#company_select').val()},
              success: function( response ){
                console.log(response);
              }
          });

        });

      });


</script>
</html>
