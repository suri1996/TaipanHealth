<!doctype html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/d6146c3d93.css">
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
        <li><g:link action = "info" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" class = "black_link">
        <g:message code = 'my.localized.account_info' /> </g:link>
        </li>
        <li>
         <g:link action = "group" class = "black_link" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
         <g:message code = 'my.localized.member_list' /></g:link></li>
         <li class = "active tab">
           <g:link action = "history" class = "black_link" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
        <g:message code = 'my.localized.history' />
         </g:link>
       </li>

    </ul>


<br />

<div>


<table id = "list" class = "table table-striped">

  <thead>
    <tr>
<th><g:message code = "my.localized.date"/></th><th><g:message code = "my.localized.invoice_no"/></th><th><g:message code = "my.localized.member"/></th><th><g:message code = "my.localized.amount"/></th><th>
<g:message code = "my.localized.download_document"/></th>
    </tr>
  </thead>
  <col width="300px"/>
  <col width="200px"/>
  <col width="300px"/>

<g:each var = "invoice"  in = "${invoices}">
  <tr>

  <td>${invoice.date.toString().substring(0,10)}</td>
  <td>${invoice.invoiceNo}</td>
  <td>${invoice.member.firstName}</td>
  <td>HKD $<g:formatNumber type = "number" number = "${invoice.amount}"/></td>
  <td>
    <a href = "/${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}/pdf/show?invoice=${invoice.id}&member=${invoice.member.firstName}"  target = "_blank" >
<span class="btn btn-danger btn-circle text-uppercase"><i class="fa fa-file-pdf-o" style = "color: white;" aria-hidden="true">Pdf</i></span></a>
  </td>
</tr>
</g:each>



</table>
</div>


</div>
<asset:javascript src="jquery.min.js"/>
<asset:javascript src = "jquery.inline-edit.js"/>

<script>

  		$(document).ready(function(){



        $('#list td #gen').click(function(){
          var $item = $(this).closest("tr"),
          $invoice_no = $item.find('td:nth-child(1)').find('span');
          $.ajax({
              url: 'generate_pdf',
              responseType: 'blob',
              data: {'invoice_no' : $invoice_no.text()},
              success: function( blob ){
                console.log(blob.size);

              }
          });

        });

      });


</script>
</html>
