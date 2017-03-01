<!doctype html>
<html>
	<head>
	  <meta name="layout" content="finder_layout"/>
	  <title>Taipan Health | Clinic Finder</title>

    <asset:stylesheet src="bootstrap.css" />
		<asset:stylesheet src="carousel.css"/>
    <asset:stylesheet src="in_finder.css"/>
  </head>
  <body>
		<div class = "container content">
			<div class="col-md-6 col-sm-6"></div>
			<div class = "col-md-3 col-sm-3">
						<a class="btn btn-success"><h5 id = "tab"><g:message code = "my.localized.international"/></h5></a>
			</div>
			<div class = "col-md-3 col-sm-3">
						<g:link class="btn"  controller = "clinic_finder" action="hongkong" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code = "my.localized.hong_kong"/></h5></g:link>
			</div>
			<div class="h row text-center text-title">
				<h1><g:message code = "my.localized.international_clinic_finder"/></h1>
				<br> <br>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<g:message code="my.localized.finderad"/>
					</div>
					<div class="col-md-3 col-xs-12 hidden-sm">
						<br>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="ch-landing__badge">
	            <div class="ch-landing__badge__wrapper">
	              <p><g:message code="my.localized.opad1"/></p>
	            </div>
	          </div>
						<g:link class="width button" controller = "opinion" action="indexx" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.opad"/></h5></g:link>
					</div>
				</div>
			</div>
			<br>




			<!--
			<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
				<g:select name = "purpose_select" id = "purpose_select"  from = "${purpose}" optionKey = "name_en" optionValue = "name_zs"   noSelection="${['':'选择服务']}" required = "required" />
			</g:if>
			<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
				<g:select name = "purpose_select" id = "purpose_select"  from = "${purpose}" optionKey = "name_en" optionValue = "name_zt"  noSelection="${['':'選擇服務']}" required = "required" />
			</g:elseif>
			<g:else>
				<g:select name = "purpose_select" id = "purpose_select"  from = "${purpose}" optionKey = "name_en" optionValue = "name_en"  noSelection="${['':'Select Purpose']}" required = "required" />
			</g:else>
		</div>
		!-->
			<div class = "container" id = "nav_item">
				<div class="col-md-3 col-sm-3">
					<g:link controller = "clinic_finder"  action = "orthopedics" class = "btn"  params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<g:message code = "my.localized.orthopedics"/>
					</g:link>
				</div>
				<div class="col-md-3 col-sm-3">
					<g:link controller = "clinic_finder"   action = "oncology" class ="btn btn-success"  params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<g:message code = "my.localized.oncology"/>
					</g:link>
				</div>
				<div class="col-md-3 col-sm-3">
					<g:link controller = "clinic_finder"  action = "aesthetic_surgery" class="btn" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<g:message code = "my.localized.aesthetic_surgery"/>
					</g:link>
				</div>
				<div class="col-md-3 col-sm-3"></div>
			</div>
			<br>
				<div class = "row">
					<div class = "list-group-item-heading header">
						<div class = "col-md-3">Hospital name</div>
						<div class = "col-md-6">Description</div>
						<div class = "col-md-2">City</div>
						<div class = "col-md-1"></div>
					</div>
				</div>


				<!-- ADD LIST VIEW CODE HERE -->
				<g:if test = "${lang_code == 'en'}">
					<div id = "list-group">
						<g:each var = "hospital" in = "${hospitals}">
							<a class="list-group-item" onClick="hospital_details(\'' + resp.hospital[i] + '\')" >
							<div class = "row">
								<div class = "col-md-3">
									<h4 class= "list-group-item-heading"> ${hospital.name_en}</h4>
									<img src=  "https://s3.ap-northeast-2.amazonaws.com/taipanhealth/images/${hospital.image}"  class = "hospital_image" />
								</div>
								<div class = "col-md-6">
									<span>${hospital.description_en}</span>
								</div>
								<div class = "col-md-2">
				 					${hospital.location_en}
									<img src=  "https://s3.ap-northeast-2.amazonaws.com/taipanhealth/images/${hospital.country.flag}"  class = "flag_mobile" />
								</div>
								<div class = "col-md-1">
								<img src=  "https://s3.ap-northeast-2.amazonaws.com/taipanhealth/images/${hospital.country.flag}"  class = "flag" />
								</div>
							</div>
						</a>
						</g:each>
				</div>
				</g:if>
				<g:if test = "${lang_code == 'zs'}">
					<div id = "list-group">
						<g:each var = "hospital" in = "${hospitals}">
							<a class="list-group-item" onClick="hospital_details(\'' + resp.hospital[i] + '\')" >
							<div class = "row">
								<div class = "col-md-3">
									<h4 class= "list-group-item-heading"> ${hospital.name_zs}</h4>
									<img src=  "https://s3.ap-northeast-2.amazonaws.com/taipanhealth/images/${hospital.image}"  class = "hospital_image" />
								</div>
								<div class = "col-md-6">
									<span>${hospital.description_zs}</span>
								</div>
								<div class = "col-md-2">
			 						${hospital.location_zs}
								<img src=  "https://s3.ap-northeast-2.amazonaws.com/taipanhealth/images/${hospital.country.flag}"  class = "flag_mobile" />
								</div>
								<div class = "col-md-1">
								<img src=  "https://s3.ap-northeast-2.amazonaws.com/taipanhealth/images/${hospital.country.flag}"  class = "flag" />
								</div>
							</div>
						</a>
					</g:each>
				</div>

				</g:if>
				<g:if test = "${lang_code == 'zt'}">
					<div id = "list-group">
						<g:each var = "hospital" in = "${hospitals}">
							<a class="list-group-item" onClick="hospital_details(\'' + resp.hospital[i] + '\')" >
								<div class = "row">
									<div class = "col-md-3">
										<h4 class= "list-group-item-heading"> ${hospital.name_zt}</h4>
									<img src=  "https://s3.ap-northeast-2.amazonaws.com/taipanhealth/images/${hospital.image}"  class = "hospital_image" />
									</div>
									<div class = "col-md-6">
										<span>${hospital.description_zt}</span>
									</div>
									<div class = "col-md-2">
		 								${hospital.location_zt}
								<img src=  "https://s3.ap-northeast-2.amazonaws.com/taipanhealth/images/${hospital.country.flag}"  class = "flag_mobile" />
									</div>
									<div class = "col-md-1">
								<img src=  "https://s3.ap-northeast-2.amazonaws.com/taipanhealth/images/${hospital.country.flag}"  class = "flag" />
									</div>
								</div>
							</a>
							</g:each>
					</div>

				</g:if>

				</div>
				</body>
				</html>
