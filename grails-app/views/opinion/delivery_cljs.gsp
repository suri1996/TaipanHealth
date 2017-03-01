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
				<div class="col-xs-2 bs-wizard-step complete">
					<div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.question"/></div>
					<div class="progress"><div class="progress-bar"></div></div>
					<div class="bs-wizard-dot"></div>
				</div>
				<div class="col-xs-3 bs-wizard-step active">
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
			<div class="col-md-9 col-sm-8 col-xs-12">
      	<div>
        	<h3><g:message code = "my.localized.delivery_way"/></h3>
					<script>
						<%
						load_string = clojure.java.api.Clojure.var('clojure.core', 'load-string')
						current_locale = org.springframework.web.servlet.support.RequestContextUtils.getLocale(request)
						%>
						function htmlDecode(input){
	  					var e = document.createElement('div');
	  					e.innerHTML = input;
	  					return e.childNodes.length === 0 ? "" : e.childNodes[0].nodeValue;
						}
						var messages = htmlDecode('${load_string.invoke('''(fn [current-locale application-context]
						(pr-str
							(into {} (map #(vector % (.getMessage application-context (str "my.localized." %) nil current-locale))
								["express_mail" "pick_it_up" "completed_address" "enter_phone" "access_storage_link" "enter_link" "product_summary" "services"
								 "subtotal" "grand_total" "edit_order" "proceed_to_pay" "select_territory" "upload"
								])))
						)''').invoke(current_locale, applicationContext)}')
						var question = '${question}'
						var locale = "${current_locale}"
						var territories = htmlDecode('${load_string.invoke("(fn [territories] (pr-str (map str territories)))").invoke(Territory.getAll(1, 3, 4))}')
					</script>
					<div id="bill_form_div">
        	<!--<form  method = "post"  id = "bill_form" action = "medicalBill_summary" >
						<input type = "hidden" name = "question" value = "${question}" />
						<div>
          		<input type="radio" name="choice_delivery" value = "1" id = "choice-delivery-mail" checked>
							<label for="choice-delivery-mail"><p><g:message code = "my.localized.express_mail"/></p></label>
						</div>
						<div>
							<input type="radio" name="choice_delivery" value = "2" id="choice-delivery-address">
		      			<label for="choice-delivery-address"><p><g:message code = "my.localized.pick_it_up"/></p></label>
	      			<div class="radioactive" id="address-">
	        			<label for="address"><g:message code = "my.localized.completed_address"/></label><br>
								<div class="form-group">
									<div class = "row">
	        					<input name = "address1" class = "form-control" type="text" />
									</div>
									<div class = "row">
	        					<input name = "address2" class = "form-control" type="text" />
									</div>
								</div>
								<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'en'}">
									<g:select name = "territory_name" from = "${Territory.getAll(1,3,4)}" optionKey = "name_en" optionValue = "name_en"  class = "form-control" noSelection="${['':'Select Territory']}" required = "required"
									value = "${flash.country}"  required = "required" />
								</g:if>
								<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
									<g:select name = "territory_name" from = "${Territory.getAll(1,3,4)}" optionKey = "name_zt" optionValue = "name_zt"  class = "form-control" noSelection="${['':'選擇地區']}" required = "required"
							 		value = "${flash.country}"  required = "required" />
								</g:if>
								<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
									<g:select name = "territory_name" from = "${Territory.getAll(1,3,4)}" optionKey = "name_zs" optionValue = "name_zs"  class = "form-control" noSelection="${['':'选择地區']}" required = "required"
							 		value = "${flash.country}" required = "required" />
								</g:if>
								<input name="country" type="text" class="form-control" value="Hong Kong" READONLY/>
								<label for="address"><g:message code = "my.localized.enter_phone"/></label><br>
								<div class="form-group">
									<div class = "row">
	        					<input name = "phone" class = "form-control" type="tel" required />
									</div>
								</div>
								<br>
	      			</div>
						</div>
						<div>
          		<input type="radio" name="choice_delivery" value = "3" id = "choice-delivery-link">
							<label for="choice-delivery-link"><p><g:message code = "my.localized.access_storage_link" /></p></label>
							<div class="radioactive" id="link">
	        			<label for="address"><g:message code = "my.localized.enter_link" /></label><br>
	        			<input type="url" name = "link" required = "required">
	      			</div>
						</div>
						<br><br>
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
			<br><br>
			<div class="col-md-3 col-md-offset-2">
				<button class="z btn btn-success" id = "backButton"><h5><span class="glyphicon glyphicon-chevron-left" style="float:left;"></span><g:message code = "my.localized.edit_order" /></h5></button>
			</div>
			<div class="col-md-3 col-md-offset-2">
				<button id = "submit_button" type = "submit" class="y btn btn-success"><h5><g:message code = "my.localized.proceed_to_pay" /><span class="glyphicon glyphicon-chevron-right" style="float:right;"></span></h5></button>
			</div>
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
		</form> -->
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
		<asset:javascript src="delivery.js"/>
		<script src="http://malsup.github.com/jquery.form.js"></script>
		<asset:javascript src="taipan_reagent/release/taipan_reagent.js"/>
		<script>
			taipan_reagent.delivery.main()
		</script>


  </body>
</html>
