<!doctype html>
<%@ page import="wireframe.Country" %>
<html>
	<head>
	    <meta name="layout" content="opinion_layout"/>
	    <title><g:message code="my.localized.footera" /> | <g:message code = "my.localized.review_report"/></title>
  </head>
  <body>
		<asset:stylesheet src="report.css"/>
		<asset:stylesheet src="h.css"/>
    <div class="container">
			<div class="row bs-wizard">
        <div class="col-xs-3 bs-wizard-step active">
          <div class="text-center bs-wizard-stepnum"><g:message code = "my.localized.services"/></div>
          <div class="progress"><div class="progress-bar"></div></div>
          <div class="bs-wizard-dot"></div>
				</div>
				<div class="col-xs-2 bs-wizard-step">
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
      <div class="text-center hidden-xs">
      	<h1><g:message code = "my.localized.review_report"/></h1>
	    </div>
      <div class="col-md-7 col-sm-8 col-xs-12">
        <h3 class="text-center"><g:message code = "my.localized.review_services"/></h3>
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
				  var products = htmlDecode('${load_string.invoke('(fn [products] (pr-str (map #(vector (.getName_en %) (.getPrice %)) products)))').invoke(product)}')
					var members = htmlDecode('${load_string.invoke('(fn [members] (pr-str (map #(vector (.getFirstName %) (.getId %)) members)))').invoke(members)}')
					var messages = htmlDecode('${load_string.invoke('''(fn [current-locale application-context]
					(pr-str
						(into {} (map #(vector % (.getMessage application-context % nil current-locale))
							["my.localized.services" "my.localized.price_hkd" "my.localized.quantity" "my.localized.total" "my.localized.member" "my.localized.add_member"])))
					)''').invoke(current_locale, applicationContext)}')
				</script>
				<div id="bill_form_div">

				</div>
				<!--<form method = "post" id = "bill_form" action = "question">
      		<div class="table-responsive" >
          	<table class="table table-striped table-bordered table-hover" id = "product_table">
            	<thead>
              	<tr>
                	<th><g:message code = "my.localized.services"/></th>
                	<th><g:message code = "my.localized.price_hkd"/></th>
                	<th><g:message code = "my.localized.quantity"/></th>
									<th style="display:none;">Sub total</th>
              	</tr>
            	</thead>
            	<tbody>
								<g:each var = "product_item" in = "${product}">
									<tr>
										<td name = "abc"><input type = "hidden" value = "${product_item.name_en}" name = "name"/>${product_item.name_en}</td>
										<td><input type = "hidden" value = "${product_item.price}" name = "price"/>$<g:formatNumber number= '${product_item.price}' type="number" /></td>
										<td><input id = "quantity" type = "text" value = "0"  name = "quan" class="center" READONLY/>
										<div>
											<button type="button" class="badge" id="sub_button" style="margin-right:5%;color:#ff6666;"><b>-</b></button>
											<button type="button" class="badge" id="add_button" style="color:#00cc99;"><b>+</b></button>
										</div></td>
										<td style="display:none;">0</td>
									</tr>
								</g:each>
								<input type = "hidden" name = "num" id = "itemNumber" value = "0" />
            	</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
										<g:message code = "my.localized.total" />:
									</td>
									<td id = "total" class="center">
									0
									</td>
								</tr>
							</tfoot>
          	</table>
        	</div>
					<div class = "row">
						<div class = "col-md-6"><p id = "error">No item is selected</p></div>
						<div class = "col-md-6 member">
							<g:message code = "my.localized.member" /> <span id="tooltip"><span class="glyphicon glyphicon-info-sign"><p>You can choose to use our service for yourself, your family or your friends. Click on "Add a Member" to add to your member list.</p></span></span>
							<g:if test = "${members.size() > 0}">
								<g:select id = "member_select" name = "member_select"  class="form-control" value="${members.first().id}" from = "${members}" optionKey = "id" optionValue = "firstName" noSelection="${['': 'Please Select']}"  required = "required" />
							</g:if>
							<g:else>
								<g:select id = "member_select" name = "member_select"  class="form-control"  from = "${members}" optionKey = "id" optionValue = "firstName" noSelection="${['': 'Please Select']}"  required = "required" />
							</g:else>
						</div>
					</div>
					<a id = "add_member" data-title="Edit" data-toggle="modal" data-target="#edit"  style="float:right"><g:message code = "my.localized.add_member"/></a>
					<br><br><br>
					<div class = "row">
						<div class="right">
							<button type = "button"  id = "addCart"  class="x btn btn-success">Proceed to Pay</button>
						</div>
					</div>
					<input type = "hidden" name = "back" value = "1" />
					<input type = "hidden" name = "type"  id = "type" value = "" />
				</form> -->
      </div>
			<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
				<form action = "/${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}/user/add_new_member">
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
												<g:select name="day" from="${1..31}"
												noSelection="['':'Day']" required = "required"/>
											</g:if>
											<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
												<g:select name="day" from="${1..31}"
												noSelection="['':'日']" required = "required"/>
											</g:if>
											<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
												<g:select name="day" from="${1..31}"
												noSelection="['':'日']" required = "required"/>
											</g:if>
											<input type = "hidden" name = "month" />
	                    <select  name = "month_select" required = "required">
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
												noSelection="['':'Year']" required = "required"/>
											</g:if>
											<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
												<g:select name="year" from="${1930..2016}"
												noSelection="['':'年']" required = "required"/>
											</g:if>
											<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
												<g:select name="year" from="${1930..2016}"
												noSelection="['':'年']" required = "required"/>
											</g:if>
										</div>
										<p class="help-block text-danger"></p>
									</div>
								</div>
								<div class="row control-group group">
									<div class="form-group col-xs-12">
										<label><g:message code = "my.localized.phone"/></label>
										<input type="tel" onkeypress = "return isNumberKey(event)"  class="form-control"  name = "phone" placeholder="${message(code: 'my.localized.phone')}" required data-validation-required-message="Please enter your name.">
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
							<div class="modal-footer">
								<input type="submit" value = "${message(code: 'my.localized.submit')}" id = "edit_submit" class="btn btn-warning btn-lg" style="width: 100%;" />
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</form>
			</div>
  	</div>
		<!--<asset:javascript src="report.js"/> -->
		<asset:javascript src="taipan_reagent/release/taipan_reagent.js"/>
		<script>
			taipan_reagent.core.main(products)
		</script>
  </body>
</html>
