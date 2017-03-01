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
                     <th><input type="checkbox" id="checkall" /></th>
                     <th><g:message code = "my.localized.first_name"/></th>
                     <th><g:message code = "my.localized.last_name"/></th>
                     <th><g:message code = "my.localized.gender"/></th>
                     <th><g:message code = "my.localized.dob"/></th>
                     <th><g:message code = "my.localized.country"/></th>
                     <th><g:message code = "my.localized.contact"/></th>
                     <th><g:message code = "my.localized.email"/></th>
                     <th><g:message code = "my.localized.edit"/></th>
                     <th><g:message code = "my.localized.delete"/></th>
                          <th></th>
                     </thead>
      <tbody>
      <g:each var = "member" in = "${user.members}">
      <tr id = "row_data">
      <td><input type="checkbox" class="checkthis" /></td>
      <td>${member.firstName}</td>
      <td>${member.lastName}</td>
      <td>${member.gender}</td>
      <td><g:formatDate format="dd-MM-yyyy" date="${member.dob}"/></td>
      <td>${member.phone}</td>
      <td>${member.country}</td>
      <td>${member.email}</td>
      <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" id = "editButton"><span class="glyphicon glyphicon-pencil"></span></button></p></td>
      <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" id = "deleteButton"><span class="glyphicon glyphicon-trash"></span></button></p></td>
      <td style = "display:none;">${member.id}</td>
      </tr>
      </g:each>
      </tbody>
  </table>
  <div class = "col-md-3"><button type="button" class="btn btn-primary" id = "newButton" data-title="Create Member" data-toggle="modal" data-target="#edit"><g:message code = "my.localized.new"/></button></div>
    <div class = "col-md-3"><button type="button" class="btn btn-danger" id = "multiDelete" data-title="Create Member" data-toggle="modal" data-target="#multi_delete"><g:message code = "my.localized.delete"/></button></div>
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
              <input type = "hidden" name = "member_id"/>
              <input type = "hidden" name = "submit_type" value = "1"/>
              <div class="row control-group group">
                <div class="form-group col-xs-12">
                    <label>First Name</label>
                    <input type="text" class="form-control" name = "firstName" placeholder="Name" required data-validation-required-message="Please enter your name.">
                      <p class="help-block text-danger"></p>
                    </div>
                  </div>
                  <div class="row control-group group">
                    <div class="form-group col-xs-12">
                        <label>Last Name</label>
                        <input type="text" class="form-control" name = "lastName" placeholder="Name" required data-validation-required-message="Please enter your name.">
                          <p class="help-block text-danger"></p>
                        </div>
                      </div>

                      <div class="row control-group group">
                        <div class="form-group col-xs-12">
                            <label>Gender</label>
                            <select rows="2" class="form-control" name = "gender" required = "required">
                              <option value = "">
                                Gender
                              </option>
                              <option value = "M">M</option>
                              <option value = "F">F</option>
                            </select>
                              <p class="help-block text-danger"></p>
                            </div>
                          </div>

                          <div class="row control-group group">
                            <input type = "hidden" name = "dob"/>
                            <div class="form-group col-xs-12">
                                <label>Date of Birth</label>
                                <div class = "form_control">

                                  <g:select name="day" from="${1..31}"
                                            noSelection="['':'Day']" required = "required"/>
                                  <g:set var="months" value="${month}"/>
                                  <g:select name="month" from="${months as List}"
                                            noSelection="['':'Month']" required = "required" />
                                  <g:select name="year" from="${1930..2016}"
                                            noSelection="['':'Year']" required = "required"/>
                                  </div>
                                  <p class="help-block text-danger"></p>
                                </div>
                              </div>

                              <div class="row control-group group">
                                <div class="form-group col-xs-12">
                                    <label>Contact</label>
                                    <input type="text" class="form-control" name = "phone" placeholder="Phone Number" required data-validation-required-message="Please enter your name.">
                                      <p class="help-block text-danger"></p>
                                    </div>
                                  </div>

                                  <div class="row control-group group">
                                    <div class="form-group col-xs-12">
                                        <label>Country</label>
                                          <g:select name = "country" from = "${Country.listOrderByName_en().name_en}" class = "form-control" noSelection="${['':'Select Country']}" required = "required"
                                            value = "${flash.country}"  required = "required" />
                                          <p class="help-block text-danger"></p>
                                        </div>
                                      </div>

                                      <div class="row control-group group">
                                        <div class="form-group col-xs-12">
                                            <label>Email</label>
                                            <input type="email" class="form-control" name = "email" placeholder="Email" required data-validation-required-message="Please enter your name.">

                                              <p class="help-block text-danger"></p>
                                            </div>
                                          </div>

                                        <div class="form-group col-xs-12" id = "error">

                                            Duplicate email address

                                        </div>

        </div>
            <div class="modal-footer ">
          <input type="submit" id = "edit_submit" class="btn btn-warning btn-lg" style="width: 100%;">

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
$('#newButton').click();

$('#newButton').click(function(){
    $('#error').hide();

});

$('#edit_submit').click(function(){

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
  $('#Heading').text("Edit your information");
  var $item = $(this).closest("tr"),
      $firstName = $item.find('td:nth-child(2)'),
      $lastName = $item.find('td:nth-child(3)'),
      $gender = $item.find('td:nth-child(4)'),
      $dob = $item.find('td:nth-child(5)'),
      $contact = $item.find('td:nth-child(6)'),
      $country = $item.find('td:nth-child(7)'),
      $email = $item.find('td:nth-child(8)'),
      $member_id = $item.find('td:nth-child(11)');

      $('[name="firstName"]').val($firstName.text());
      $('[name="lastName"]').val($lastName.text());
      $('[name="phone"]').val($contact.text());
      $('[name="country"]').val($country.text());

      if($dob.text().substring(0,1) == "0"){
        $('[name="day"]').val($dob.text().substring(1,2));
      }
      else {
        $('[name="day"]').val($dob.text().substring(0,2));
      }
      $('[name="month"]').prop('selectedIndex', $dob.text().substring(3,5));
      $('[name="year"]').val($dob.text().substring(6,10));
      $('[name="gender"]').val($gender.text());
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
    $member_id = $item.find('td:nth-child(11)');
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
  $('[name="firstName"]').val(null);
  $('[name="lastName"]').val(null);
  $('[name="phone"]').val(null);
  $('[name="country"]').val(null);
  $('[name="day"]').val(null);
  $('[name="month"]').prop('selectedIndex', 0);
  $('[name="year"]').val(null);
  $('[name="gender"]').val(null);
  $('[name="email"]').val(null);
  $('[name="member_id"]').val(null);
  $('#Heading').text("Create your member");
  $('[name="submit_type"]').val('1');
});




});
</script>


</html>
