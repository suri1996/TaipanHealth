<!doctype html>
<html>
	<head>
	    <meta name="layout" content="opinion_layout"/>
	    <title>Taipan Health | Medical Bill</title>
			<style>
#totalAmount2{
	display: none;
}
#abc{
	display: none;
}
			</style>
  </head>
  <body>
		<asset:stylesheet src="medbill.css"/>
    <div class="row container">
			<div class="row bs-wizard">
        <div class="col-xs-3 bs-wizard-step complete">
          <div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.services"/></div>
          <div class="progress"><div class="progress-bar"></div></div>
          <div class="bs-wizard-dot"></div>
				</div>
				<div class="col-xs-2 bs-wizard-step complete">
					<div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.question"/></div>
					<div class="progress"><div class="progress-bar"></div></div>
					<div class="bs-wizard-dot"></div>
				</div>
				<div class="col-xs-3 bs-wizard-step complete">
          <div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.delivery"/></div>
          <div class="progress"><div class="progress-bar"></div></div>
          <div class="bs-wizard-dot"></div>
        </div>
        <div class="col-xs-2 bs-wizard-step active">
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
			<div class="col-md-12">

        <h2><g:message code = "my.localized.medical_bill"/></h2>
			</div>
      <div class="col-md-9 col-sm-8 col-xs-12">
        <div class="container x">

          <h4 style="text-align:right">${member.firstName}</h4>
					<form id = "invoice_form" action = "addcart">
						<input type = "hidden" name = "member_select" value = "${member.id}" />
						<input type = "hidden" name = "num" value = "${num}"  />

						<input type = "hidden" name = "question" value = "${question}"  />
          	<table class="table">
            	<thead>
								<tr>
									<th><g:message code = "my.localized.review_service"/></th>
									<th><g:message code = "my.localized.price_hkd"/></th>
									<th><g:message code = "my.localized.quantity"/></th>
									<th><g:message code = "my.localized.subtotal"/></th>
								</tr>
							</thead>
          		<tbody>
								<g:each var = "item" in = "${product}">
            			<tr>
            				<td>
											<input type = "hidden" name = "name" value = "${item.name}" />
              				${item.name}
            				</td>
            				<td>
											<input type = "hidden" name = "price" value = "${item.price}" />
              				<g:formatNumber number= '${item.price}' type="number" />
            				</td>
            				<td>
											<input type = "hidden" name = "quan" value = "${item.quan}" />
              				${item.quan}
            				</td>
            				<td>
						  				$<g:formatNumber number= '${item.subtotal}' type="number" />
            				</td>
            			</tr>
								</g:each>
          		</tbody>
          		<tfoot>
								<tr>
          			<th class="text-right" colspan="3"  id = "totalTitle"><g:message code = "my.localized.total"/>:</th>
            		<th><input type = "hidden" name = "total" value = "${total}" />$ <g:formatNumber  number= '${total}' type="number" />
							</th>
						</tr>
          		</tfoot>
          	</table>
						<input type = "hidden" name = "discount" value = "0" />
						<input type = "hidden" name = "net_pay" value = "0" />
        </div>
				<div class="a col-md-7 col-sm-8 col-xs-12">
					<div class="input-group">
        		<input type="text" id = "promote_code" class="form-control" placeholder="${message(code: 'my.localized.enter_promo')}">
							<input type = "hidden" name = "promotion_code" value = "" />
							<span class="input-group-btn">
			          <div class="btn btn-default" id = "redeem" type="button"><g:message code = "my.localized.redeem"/></div>
	            </span>
					</div>
				</div>
				<div class = "a col-md-5 col-sm-4">
						<span id = "error_message" class = "form-control" style = "border: 0; color: red;"></span>
				</div>
      </div>
			<div class="col-md-3 col-sm-4 col-xs-12">
				<div class="container xx">
					<h4><g:message code = "my.localized.delivery_choice"/>:</h4>
					<g:if test = "${choice == '1'}">
						<input type = "hidden" name = "delivery_method" value = "Send by express mail" />
						<input type = "hidden" name = "delivery_content" value = "123" />
						<h5><g:message code = "my.localized.express_mail"/></h5>
						<p>
							Room 1612, 16/f,<br/>
							Hong Kong Plaza, 186 Connaught Road West.<br />
							Hong Kong
						</p>
					</g:if>
					<g:elseif test = "${choice == '2'}">
						<input type = "hidden" name = "delivery_method" value = "Have us pick it up" />
						<input type = "hidden" name = "delivery_content" value = "${address1} ${address2} ${territory} ${' Hong Kong'}" />
						<h5><g:message code = "my.localized.pick_it_up"/></h5>
						<h5>Address:</h5>
						<p>
							<g:if test = "${address1}">
							${address1}<br/>
							</g:if>
							<g:if test = "${address2}">
							${address2}<br/>
							</g:if>
							${territory}<br/>
							Hong Kong
						</p>
						<h5>Phone:</h5>
						<input type = "hidden" name = "phone" value = "${phone}" />
						<p>${phone}</p>
					</g:elseif>
					<g:else>
						<input type = "hidden" name = "delivery_method" value = "Access storage link" />
						<input type = "hidden" name = "delivery_content" value = "${link}" />
						<h5><g:message code = "my.localized.access_storage_link" /></h5>
					<p style = "word-wrap: break-word;">${link}</p>
					</g:else>
				</div>
			</div>
			<div class="col-md-9 col-sm-8 col-xs-12">
				<div class="container xx">
					<div class="checkbox">
  					<label><input type="checkbox" id = "agree"  value="" required = "required"  />
						<g:message code = "my.localized.terms_proceed" />
						</label>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-md-offset-2">
				<button class="z btn btn-success" id = "backButton"><h5><span class="glyphicon glyphicon-chevron-left" style="float:left;"></span><g:message code = "my.localized.edit_delivery"/></h5></button>
			</div>
			<div class="col-md-3 col-md-offset-2">
				<button type = "submit" id = "submit_button" class="y btn btn-success"><h5><g:message code = "my.localized.proceed_to_pay"/><span class="glyphicon glyphicon-chevron-right" style="float:right;"></span></h5></button>
			</div>
					</form>

			<form method = "post" id = "bill_form2" action = "medicalBill_mobile" style = "display: none;" >
				<div class="table-responsive" >
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
				<input type = "hidden" name = "choice_delivery" value = "${choice}"  />
				<input type = "hidden" name = "address1" value = "${address1}"  />
				<input type = "hidden" name = "address2" value = "${address2}"  />
				<input type = "hidden" name = "territory_name" value = "${territory}"  />
				<input type = "hidden" name = "link" value = "${link}"  />
				<input type = "hidden" name = "phone" value = "${phone}"  />
				<input type = "hidden" name = "back" value = "${back}" />
				<input type = "hidden" name = "member_select" value = "${member.id}"  />
				<div class = "row">
					<div class="right">
						<button type = "button"  id = "addCart"  class="x btn btn-success">Proceed to Pay</button>
					</div>
				</div>
			</form>
    </div>
		<asset:javascript src="jquery.min.js"/>
		<asset:javascript src="medbill.js"/>

		<asset:javascript src="jquery.min.js"/>
		<script>

		$(document).ready(function(){
			var isUsed = false;
			$.fn.digits = function(){
		      return this.each(function(){
		          $(this).text( $(this).text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
		      })
		  }

			$('#redeem').click(function(){

				var URL = '${createLink(controller: 'opinion' , action:'promotion', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ])}';
				$.ajax({
					url:URL,
					data: {code: $('#promote_code').val()},
					success: function(resp){
						console.log(resp);
						if(resp == 'false')
						{
							$('#error_message').text('<g:message code = "my.localized.invalid_code"/>');
						}
						else if(!isUsed) {
							isUsed = true;
							$('#invoice_form tr:last').after('<tr><th class="text-right" colspan = "3">Discount ' + resp +  '%</th><th>$<span id = "discount">' + $('[name="total"]').val() * resp / 100 + '</span></th></tr>')
							$('#invoice_form tr:last').after('<tr><th class="text-right" colspan = "3">Net pay </th><th>$<span id = "net_pay">' + $('[name="total"]').val() * (100 - resp) / 100 + '</span></th></tr>')
							$('#net_pay').digits();
							$('#discount').digits();
							$('[name="discount"]').val($('[name="total"]').val() * resp / 100);
							$('[name="net_pay"]').val($('[name="total"]').val() * (100 - resp) / 100);
							$('[name="promotion_code"]').val($('#promote_code').val());
							$('#error_message').text('');
						}
						else{

						}

				}
				});

			});


		});

		</script>
  </body>
</html>
