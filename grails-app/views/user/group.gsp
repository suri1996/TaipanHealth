<!doctype html>
<%@ page import="wireframe.Country" %>
<html>
<head>
<meta name="layout" content="main"/>
<title>Taipan Health | Group</title>
<style = "type/css">
.black_link{
  color: #000000;
}
.row{
  margin-bottom: 20px;
}


.highlight {
  background-color: #dcc2ff;
}

.group{
  margin: 0px;
  padding: 0px;
}

#error{
    color: red;
    text-align: center;
}

.footer{
    text-align: right;
}
#editButton, #deleteButton{
  padding-left: 0px;
  padding-right: 0px;
}




</style>


</head>





<div class = "container content">

    <ul class="nav nav-tabs nav-justified">
        <li><g:link action = "info" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" class = "black_link">
        <g:message code = 'my.localized.account_info' /> </g:link>
        </li>
        <li class = "active tab">
         <g:link action = "group" class = "black_link" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
         <g:message code = 'my.localized.member_list' /></g:link></li>
         <li>
           <g:link action = "history" class = "black_link" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
        <g:message code = 'my.localized.history' />
         </g:link>
       </li>

    </ul>

<br />
  	<div class="row">
          <div class="col-md-12">
          <h4><g:message code = "my.localized.member_list"/></h4>
          <div class="table-responsive">
                <table id="mytable" class="table table-bordred table-striped">
                     <thead>

                     <th><g:message code = "my.localized.title"/></th>
                     <th><g:message code = "my.localized.first_name"/></th>
                     <th><g:message code = "my.localized.last_name"/></th>
                     <th><g:message code = "my.localized.gender"/></th>
                     <th><g:message code = "my.localized.dob"/></th>
                     <th><g:message code = "my.localized.country"/></th>
                     <th><g:message code = "my.localized.phone"/></th>
                     <th><g:message code = "my.localized.email"/></th>
                     <th><g:message code = "my.localized.edit"/></th>
                     <th><g:message code = "my.localized.delete"/></th>
                          <th></th>
                     </thead>
      <tbody>
      <g:each var = "member" in = "${user.members}">
      <tr id = "row_data">

      <td><g:message code = "my.localized.${member.title}"/></td>
      <td>${member.firstName}</td>
      <td>${member.lastName}</td>
      <td><g:message code = "my.localized.${member.gender}"/></td>
      <td><g:formatDate format="dd-MM-yyyy" date="${member.dob}"/></td>

      <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'en'}">
      <td>${member.country_name_en}</td>
      </g:if>
      <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
      <td>${member.country_name_zt}</td>
      </g:if>
      <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
      <td>${member.country_name_zs}</td>
      </g:if>

      <td>${member.phone}</td>
      <td>${member.email}</td>
      <td><p><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" style = "width: 46px;" id = "editButton"><span class="glyphicon glyphicon-pencil"></span></button></p></td>
      <td><p><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" id = "deleteButton"><span class="glyphicon glyphicon-trash"></span></button></p></td>
      <td style = "display:none;">${member.id}</td>
      </tr>
      </g:each>
      </tbody>
  </table>
  <div class = "col-md-3"><button type="button" class="btn btn-primary" id = "newButton" data-title="Create Member" data-toggle="modal" data-target="#edit"><g:message code = "my.localized.new"/></button></div>
    <div class = "col-md-3"></div>
    <div class = "col-md-6"></div>
  <div class="clearfix"></div>
  <!--
  <ul class="pagination pull-right">
    <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left" data-target="#edit"></span></a></li>
    <li class="active"><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
  </ul> -->

              </div>

          </div>
  	</div>
  </div>

  <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <form action = "edit" >
        <div class="modal-dialog">
      <div class="modal-content">
            <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
        </div>
            <div class="modal-body">
              <input type = "hidden" name = "member_id" id="name"/>
              <input type = "hidden" name = "submit_type"/>
              <div class="row control-group group">
                <div class="form-group col-xs-12">
                    <label><g:message code = "my.localized.title"/></label>
                    <input type = "hidden" name = "title" />
                    <select rows="4" class="form-control" name = "title_select" required = "required">
                      <option value = "">
                        <g:message code = "my.localized.title" />
                      </option>
                      <option value = "${message(code: 'my.localized.Mr.')}"><g:message code = "my.localized.Mr."/></option>
                      <option value = "${message(code: 'my.localized.Mrs.')}"><g:message code = "my.localized.Mrs."/></option>
                      <option value = "${message(code: 'my.localized.Ms.')}"><g:message code = "my.localized.Ms."/></option>
                      <option value = "${message(code: 'my.localized.Miss')}"><g:message code = "my.localized.Miss"/></option>
                    </select>
                      <p class="help-block text-danger"></p>
                    </div>
                  </div>
              <div class="row control-group group">
                <div class="form-group col-xs-12">
                    <label><g:message code = "my.localized.first_name"/></label>
                    <input type="text" class="form-control" name = "firstName" placeholder="${message(code: 'my.localized.first_name')}" required data-validation-required-message="Please enter your name.">
                      <p class="help-block text-danger"></p>
                    </div>
                  </div>
                  <div class="row control-group group">
                    <div class="form-group col-xs-12">
                        <label><g:message code = "my.localized.last_name"/></label>
                        <input type="text" class="form-control" name = "lastName" placeholder="${message(code: 'my.localized.last_name')}" required data-validation-required-message="Please enter your name.">
                          <p class="help-block text-danger"></p>
                        </div>
                      </div>

                      <div class="row control-group group">
                        <div class="form-group col-xs-12">
                            <label><g:message code = "my.localized.gender" /></label>
                            <input type = "hidden" name = "gender" />
                            <select rows="3" class="form-control" name = "gender_select" required = "required">
                              <option value = "">
                                <g:message code = "my.localized.gender" />
                              </option>
                              <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'en'}">
                                <option value = "Male">Male</option>
                                <option value = "Female">Female</option>
                              </g:if>
                              <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
                                <option value = "男">男</option>
                                <option value = "女">女</option>
                              </g:if>
                              <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
                                <option value = "男">男</option>
                                <option value = "女">女</option>
                              </g:if>

                            </select>
                              <p class="help-block text-danger"></p>
                            </div>
                          </div>

                          <div class="row control-group group">
                            <input type = "hidden" name = "dob"/>
                            <div class="form-group col-xs-12">
                                <label><g:message code = "my.localized.dob"/></label>
                                <div class = "form_control">
                                  <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'en'}">
                                    <g:select name="day" from="${1..31}" class = "form-control" style = "width: 20%; display: inline-block;"
                                              noSelection="['':'Day']" required = "required"/>
                                  </g:if>

                                  <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
                                    <g:select name="day" from="${1..31}"class = "form-control" style = "width: 20%; display: inline-block;"
                                              noSelection="['':'日']" required = "required"/>
                                  </g:if>
                                  <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
                                    <g:select name="day" from="${1..31}"class = "form-control" style = "width: 20%; display: inline-block;"
                                              noSelection="['':'日']" required = "required"/>
                                  </g:if>
                                  <input type = "hidden" name = "month" />
                                  <select  name = "month_select" required = "required" class = "form-control" style = "width: 40%; display: inline-block;">
                                    <option value = ""><g:message code = "my.localized.select_month" /></option>
                                    <option value = "${message(code: 'my.localized.january')}"><g:message code = "my.localized.january"/></option>
                                    <option value = "${message(code: 'my.localized.february')}"><g:message code = "my.localized.february"/></option>
                                    <option value = "${message(code: 'my.localized.march')}"><g:message code = "my.localized.march"/></option>
                                    <option value = "${message(code: 'my.localized.april')}"><g:message code = "my.localized.april"/></option>
                                    <option value = "${message(code: 'my.localized.may')}"><g:message code = "my.localized.may"/></option>
                                    <option value = "${message(code: 'my.localized.june')}"><g:message code = "my.localized.june"/></option>
                                    <option value = "${message(code: 'my.localized.july')}"><g:message code = "my.localized.july"/></option>
                                    <option value = "${message(code: 'my.localized.august')}"><g:message code = "my.localized.august"/></option>
                                    <option value = "${message(code: 'my.localized.september')}"><g:message code = "my.localized.september"/></option>
                                    <option value = "${message(code: 'my.localized.october')}"><g:message code = "my.localized.october"/></option>
                                    <option value = "${message(code: 'my.localized.november')}"><g:message code = "my.localized.november"/></option>
                                    <option value = "${message(code: 'my.localized.december')}"><g:message code = "my.localized.december"/></option>
                                  </select>
                                  <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'en'}">
                                  <g:select name="year" from="${1930..2016}"
                                            noSelection="['':'Year']" required = "required" class = "form-control" style = "width: 20%; display: inline-block;"/>
                                  </g:if>
                                  <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
                                  <g:select name="year" from="${1930..2016}"
                                            noSelection="['':'年']" required = "required" class = "form-control" style = "width: 20%; display: inline-block;"/>
                                  </g:if>
                                  <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
                                  <g:select name="year" from="${1930..2016}"
                                            noSelection="['':'年']" required = "required" class = "form-control" style = "width: 20%; display: inline-block;"/>
                                  </g:if>

                                  </div>
                                  <p class="help-block text-danger"></p>
                                </div>
                              </div>

                              <div class="row control-group group">
                                <div class="form-group col-xs-12">
                                    <label><g:message code = "my.localized.phone"/></label>
                                    <input type="tel" onkeypress = "return isNumberKey(event)"  class="form-control" name = "phone" placeholder="${message(code: 'my.localized.phone')}" required data-validation-required-message="Please enter your name.">
                                      <p class="help-block text-danger"></p>
                                    </div>
                                  </div>

                                  <div class="row control-group group">
                                    <div class="form-group col-xs-12">
                                        <label><g:message code = "my.localized.country" /></label>
                                					<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'en'}">
                                          <g:select name = "country_name_en" from = "${Country.listOrderByName_en()}" optionKey = "name_en" optionValue = "name_en"  class = "form-control" noSelection="${['':'Select Country']}" required = "required"
                                            value = "${flash.country}"  required = "required" />
                                          </g:if>
                                          <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
                                          <g:select name = "country_name_zt" from = "${Country.listOrderByName_en()}" optionKey = "name_zt" optionValue = "name_zt"  class = "form-control" noSelection="${['':'選擇國家']}" required = "required"
                                           value = "${flash.country}"  required = "required" />
                                          </g:if>
                                          <g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
                                          <g:select name = "country_name_zs" from = "${Country.listOrderByName_en()}" optionKey = "name_zs" optionValue = "name_zs"  class = "form-control" noSelection="${['':'选择国家']}" required = "required"
                                           value = "${flash.country}" required = "required" />
                                          </g:if>
                                          <p class="help-block text-danger"></p>
                                        </div>
                                      </div>

                                      <div class="row control-group group">
                                        <div class="form-group col-xs-12">
                                            <label><g:message code = "my.localized.email"/></label>
                                            <input type="email" class="form-control" name = "email" placeholder="${message(code: 'my.localized.email')}" required data-validation-required-message="Please enter your name.">
                                              <p class="help-block text-danger"></p>
                                            </div>
                                          </div>

                                        <div class="form-group col-xs-12" id = "error">

                                            Duplicate email address

                                        </div>

        </div>
            <div class="modal-footer ">
          <input type="submit" value = "${message(code: 'my.localized.submit')}" id = "edit_submit" class="btn btn-warning btn-lg" style="width: 100%;">

        </div>
          </div>
      <!-- /.modal-content -->
    </div>
        <!-- /.modal-dialog -->
            </form>
      </div>

      <form action = "delete" id = "delete_form">
      <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
        <div class="modal-dialog">
      <div class="modal-content">
            <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
        </div>
            <div class="modal-body">

         <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>Are you sure you want to delete this Record?</div>
         <input type = "hidden" name = "delete_id"/>
        </div>
          <div class = "footer">
          <button type="submit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
        </div>
          </div>
      <!-- /.modal-content -->
    </div>
        <!-- /.modal-dialog -->
</form>
</div>


<div class="modal fade" id="multi_delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
  <div class="modal-dialog">
<div class="modal-content">
      <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
    <h4 class="modal-title custom_align" id="Heading">Delete these entry</h4>
  </div>
      <div class="modal-body">

   <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>Are you sure you want to delete THESE Record?</div>

  </div>
<div class = "footer">
    <button type="submit" id = "mul_del_button" class="btn btn-primary" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
    <button type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
</div>
    </div>
<!-- /.modal-content -->
</div>
  <!-- /.modal-dialog -->

</div>



<asset:javascript src="jquery.min.js"/>

<script>

function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

$(document).ready(function(){
$('#error').hide();
var id = "";
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });

    $("[data-toggle=tooltip]").tooltip();
var submit = "";




$('[name="email"]').keyup(function(){
check_email();

});

$('[name="email"]').change(function(){
check_email();

});


var items = [];


$('#newButton').click(function(){
    $('#error').hide();

});

$('#edit_submit').click(function(){
  $('[name="month"]').val($('[name="month_select"]').prop('selectedIndex'));
      $('[name="title"]').val($('[name="title_select"]').val());
      $('[name="gender"]').val($('[name="gender_select"]').val());
if($('[name="gender_select"]').val() == '男')
{
      $('[name="gender"]').val("M");

}
else if($('[name="gender_select"]').val() == '女')
{
  $('[name="gender"]').val("F");
}

if($('[name="title_select"]').val() == '先生')
{
  $('[name="title"]').val('Mr.');

}
else if($('[name="title_select"]').val() == '太太')
{
  $('[name="title"]').val('Mrs.');
}
else if($('[name="title_select"]').val() == '女士')
{
  $('[name="title"]').val('Ms.');
}
else if($('[name="title_select"]').val() == '小姐')
{
  $('[name="title"]').val('Miss');
}

    if(submit == "false")
    {
        $('#error').show();
        return false;
    }
    else
    {
        $('#error').hide();
    }
});

$('#mytable td #editButton').click(function(){
  $('#Heading').text("<g:message code = 'my.localized.edit_info'/>");
  var $item = $(this).closest("tr"),
      $title = $item.find('td:nth-child(1)'),
      $firstName = $item.find('td:nth-child(2)'),
      $lastName = $item.find('td:nth-child(3)'),
      $gender = $item.find('td:nth-child(4)'),
      $dob = $item.find('td:nth-child(5)'),
      $country = $item.find('td:nth-child(6)'),
      $contact = $item.find('td:nth-child(7)'),
      $email = $item.find('td:nth-child(8)'),
      $member_id = $item.find('td:nth-child(11)');
      $('[name="title_select"]').val($title.text());
      $('[name="firstName"]').val($firstName.text());
      $('[name="lastName"]').val($lastName.text());
      $('[name="phone"]').val($contact.text());
      $('[name="country_name_en"]').val($country.text());
      $('[name="country_name_zt"]').val($country.text());
      $('[name="country_name_zs"]').val($country.text());
      if($dob.text().substring(0,1) == "0"){
        $('[name="day"]').val($dob.text().substring(1,2));
      }
      else {
        $('[name="day"]').val($dob.text().substring(0,2));
      }
      $('[name="month_select"]').prop('selectedIndex', $dob.text().substring(3,5));
      $('[name="month"]').val($dob.text().substring(3,5));
      $('[name="year"]').val($dob.text().substring(6,10));
      $('[name="gender_select"]').val($gender.text());
      $('[name="email"]').val($email.text());
      $('[name="member_id"]').val($member_id.text());
      $('[name="submit_type"]').val('2');

});

$('#mytable td #deleteButton').click(function(){
  var $item = $(this).closest("tr"),
  $member_id = $item.find('td:nth-child(11)');
  $('[name="delete_id"]').val($member_id.text());

});

$('#multiDelete').click(function()
{
  id = "";
  var index = 0;
  $("#mytable td input[type=checkbox]").each(function () {
    var $item = $(this).closest("tr"),
    $member_id = $item.find('td:nth-child(10)');
      if($(this).prop('checked'))
      {
        var $item = $(this).closest("tr"),
        $member_id = $item.find('td:nth-child(11)');
        $('[name="delete_id"]').val($member_id.text());
        id = id + $member_id.text() + ",";
      }
});

});

$('#mul_del_button').click(function()
{
  document.location.href= '${createLink(controller: 'user' , action:'delete_multiple', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ])}?id=' + id;
});

  $('#newButton').click(function(){
  $('[name="title"]').val(null);
  $('[name="firstName"]').val(null);
  $('[name="lastName"]').val(null);
  $('[name="phone"]').val(null);
  $('[name="country"]').val(null);
  $('[name="day"]').val(null);
  $('[name="month_select"]').prop('selectedIndex', 0);
  $('[name="year"]').val(null);
  $('[name="gender"]').val(null);
  $('[name="email"]').val(null);
  $('[name="member_id"]').val(null);
  $('#Heading').text("<g:message code = 'my.localized.create_member'/>");
  $('[name="submit_type"]').val('1');
});




});
</script>


</html>
