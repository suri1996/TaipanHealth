<!doctype html>
<%@ page import="wireframe.Territory" %>
<html>
	<head>
	    <meta name="layout" content="opinion_layout"/>
	    <title><g:message code="my.localized.footera" /> | Delivery Options</title>
  </head>
  <body>
    <asset:stylesheet src="medbill.css"/>
		<asset:stylesheet src="delivery.css"/>
    <div class="container">
			<div class="row bs-wizard">
        <div class="col-xs-3 bs-wizard-step complete">
          <div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.services"/></div>
          <div class="progress"><div class="progress-bar"></div></div>
          <div class="bs-wizard-dot"></div>
				</div>
        <div class="col-xs-2 bs-wizard-step active">
					<div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.question"/></div>
					<div class="progress"><div class="progress-bar"></div></div>
					<div class="bs-wizard-dot"></div>
				</div>
				<div class="col-xs-3 bs-wizard-step">
          <div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.delivery"/></div>
          <div class="progress"><div class="progress-bar"></div></div>
          <div class="bs-wizard-dot"></div>
        </div>
        <div class="col-xs-2 bs-wizard-step">
          <div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.summary"/></div>
          <div class="progress"><div class="progress-bar"></div></div>
          <div class="bs-wizard-dot"></div>
        </div>
        <div class="col-xs-2 bs-wizard-step">
          <div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.payment"/></div>
          <div class="progress"><div class="progress-bar"></div></div>
          <div class="bs-wizard-dot"></div>
				</div>
      </div>
      <form action = "medicalBill" method = "post">

        <div class="col-md-9 col-sm-8 col-xs-12">
        <div class="container xx" style = "border: 0px;">
                <label><g:message code = "my.localized.leaving_question" /></label>
            <textarea rows="5" class="form-control" style = "width: 100%;" name = "question"  id="message" ></textarea>
        <br />
      </div>
        </div>

        <div class="col-md-3 col-sm-4 col-xs-12">
  				<div class="container xx">
  					<h4><g:message code = "my.localized.product_summary" /></h4>
  					<table class="table">
  						<thead>
  							<tr>
  								<th>#</th>
  								<th><g:message code = "my.localized.services" /></th>
  								<th><g:message code = "my.localized.subtotal"/></th>
  							</tr>
  						</thead>
  						<tbody>
  							<g:each var = "item" in = "${product}">
  								<tr>
  									<td>
  										${item.quan}
  									</td>
  									<td>
  										${item.name}
  									</td>
  									<td>
  										$<g:formatNumber number= '${item.subtotal}' type="number" />
  									</td>
  								</tr>
  							</g:each>
  						</tbody>
  					</table>
  					<b style="color:#004080"><g:message code = "my.localized.grand_total"/>: HK $<g:formatNumber number= '${total}' type="number" /></b>
  				</div>
  			</div>


        			<input type = "hidden" name = "member_select" value = "${member.id}"  />
        <table class="table table-striped table-bordered table-hover" style = "display: none;">
					<thead>
						<tr>
							<th>Services</th>
							<th>Price (HK$)</th>
							<th>Quantity</th>
							<th>Sub total</th>
						</tr>
					</thead>
					<tbody>
						<input type = "hidden" name = "num" value = "${num}"  />
						<g:each var = "product_item" in = "${product}">
							<tr>
								<td name = "abc"><input type = "hidden" value = "${product_item.name}" name = "name"/>${product_item.name}</td>
								<td><input type = "hidden" value = "${product_item.price}" name = "price"/>${product_item.price}</td>
								<td><input id = "quantity" type = "text" value = "${product_item.quan}" name = "quan" class="center" READONLY/>
								</td>
								<td>0</td>
							</tr>
						</g:each>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								Total:
							</td>
							<td id = "total" class="center">
								0
							</td>
						</tr>
					</tfoot>
				</table>
			<div class="col-md-3 col-md-offset-2">
				<button class="z btn btn-success" id = "backButton"><h5><span class="glyphicon glyphicon-chevron-left" style="float:left;"></span><g:message code = "my.localized.edit_order" /></h5></button>
			</div>
			<div class="col-md-3 col-md-offset-2">
				<button id = "submit_button" type = "submit" class="y btn btn-success"><h5><g:message code = "my.localized.proceed_to_pay" /><span class="glyphicon glyphicon-chevron-right" style="float:right;"></span></h5></button>
			</div>
      </form>
			<div class="table-responsive"  style = "display: none;">
				<table class="table table-striped table-bordered table-hover" id = "product_table">
					<thead>
						<tr>
							<th>Services</th>
							<th>Price (HK$)</th>
							<th>Quantity</th>
							<th>Sub total</th>
						</tr>
					</thead>
					<tbody>
						<input type = "hidden" name = "num" value = "${num}"  />
						<g:each var = "product_item" in = "${product}">
							<tr>
								<td name = "abc"><input type = "hidden" value = "${product_item.name}" name = "name"/>${product_item.name}</td>
								<td><input type = "hidden" value = "${product_item.price}" name = "price"/>${product_item.price}</td>
								<td><input id = "quantity" type = "text" value = "${product_item.quan}" name = "quan" class="center" READONLY/>
								</td>
								<td>0</td>
							</tr>
						</g:each>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								Total:
							</td>
							<td id = "total" class="center">
								0
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<input type = "hidden" name = "back" value = "${back}" />
			<input type = "hidden" name = "member_select" value = "${member.id}"  />
		</form>
		<form method = "post"  id = "bill_form2" style = "display: none;" action = "medicalBill">
			<div class="table-responsive" >
				<table class="table table-striped table-bordered table-hover" id = "product_table">
					<thead>
						<tr>
							<th>Services</th>
							<th>Price (HKD)</th>
							<th>Quantity</th>
							<th>Sub total</th>
						</tr>
					</thead>
					<tbody>
						<g:each var = "product_item" in = "${arrayProduct}">
							<tr>
								<td name = "abc"><input type = "hidden" value = "${product_item.name}" name = "name"/>${product_item.name}</td>
								<td><input type = "hidden" value = "${product_item.price}" name = "price"/>$<g:formatNumber number= '${product_item.price}' type="number" /></td>
								<td><input id = "quantity" type = "text" value = "${product_item.quan}"  name = "quan" class="center" READONLY/>
								<button type = "button" id = "add_button"><span class="badge">+</span></button>
								<button type = "button" id = "sub_button"><span class="badge">−</span></button></td>
								<td>0</td>
							</tr>
						</g:each>
						<input type = "hidden" name = "num" id = "itemNumber" value = "0" />
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2">
								Total:
							</td>
							<td id = "total" class="center">
							0
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<input type = "hidden" name = "back" value = "${back}" />
			<input type = "hidden" name = "member_select" value = "${member.id}"  />
			<input type = "hidden" name = "type"  id = "type" value = "" />
		</form>
		</div>
		<asset:javascript src="question.js"/>
		<asset:javascript src="jquery.min.js"/>
  </body>
</html>
