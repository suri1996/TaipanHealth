<!doctype html>
<html>
	<head>
		<meta name="layout" content="scan_layout"/>
    <title>Scan Assist</title>
	</head>
	<body>
		<asset:stylesheet src="carousel.css"/>
		<asset:stylesheet src="scan.css"/>
  	<div class = "container content">
			<div class = "row text-right hidden-xs hidden-sm aa">
				<div class = "col-md-2 col-md-offset-2">
					<g:link class = "btn" controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<asset:image class="img-circle" src="skel.png" style="img-responsive"/>
						<br>
						<h6><g:message code="my.localized.assist1"/></h6>
					</g:link>
				</div>
				<div class = "col-md-2">
					<g:link class="btn btn-success" controller = "scan" action="body_part" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<asset:image class="img-circle" src="bod.png" style="img-responsive"/>
						<br>
						<h6><g:message code="my.localized.assist2"/></h6>
					</g:link>
				</div>
				<div class = "col-md-2">
					<g:link class="btn" controller = "scan" action="organ" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<asset:image class="img-circle" src="org.png" style="img-responsive"/>
						<br>
						<h6><g:message code="my.localized.assist31"/></h6>
					</g:link>
				</div>
				<div class = "col-md-2">
					<g:link class="btn" controller = "scan" action="other" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<asset:image class="img-circle" src="oth.png" style="img-responsive"/>
						<br>
						<h6><g:message code="my.localized.assist4"/></h6>
					</g:link>
				</div>
			</div>
			<div class="hidden-md hidden-lg col-sm-12 col-xs-12">
				<li class="dropdown">
					<div class="btn btn-success" data-toggle ="dropdown"><h5><g:message code="my.localized.assist2"/><span class="caret" style="float:right"></span></h5></div>
					<ul class = "dropdown-menu">
						<g:link class="btn" controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist1"/></h5></g:link>
						<g:link class="btn" controller = "scan" action="organ" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist3"/></h5></g:link>
						<g:link class="btn" controller = "scan" action="other" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist4"/></h5></g:link>
					</ul>
				</li>
			</div>
    	<div class="row text-center">
      	<h1><g:message code="my.localized.welcome"/> <g:message code="my.localized.scan"/></h1>
    	</div>
			<br>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12">
					<g:message code="my.localized.scanad"/>
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
			<br>
  		<div id="body" class="col-md-4 col-xs-12 col-sm-5">
    		<div>
					<asset:image id="body_image" src="human_body.jpg" width="205" height="318" usemap="#body_map" alt="Body image" />
      	</div>
    	</div>
			<div class="col-md-8 col-xs-12 col-sm-7">
				<!--<div class="col-md-6 col-sm-6"></div>  CLINIC FINDER LINK
				<div class="col-md-6 col-sm-6 col-xs-12" style="padding-right:0px;">
					<g:link controller = "clinic_finder"  action = "hongkong" class = "btn btn-success"  params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.find"/></g:link>
				</div>-->
				<div  id="selections">
					<h3 class="text-center">Thorax</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Airtrapping</td><td>In- and Expiration Xray Thorax</td><td>-</td></tr><tr><td>Thoracic aortic aneurysms</td><td>CT</td><td>-</td></tr><tr><td>Aortic Dissection</td><td>CT</td><td>MRI</td></tr><tr><td>Bronchiectasis</td><td>High Resolution CT</td><td>-</td></tr><tr><td>Diaphragm movement (paradoxically)</td><td>Flouroscopy</td><td>-</td></tr><tr><td>Haemoptoe</td><td>Xray Thorax</td><td>CT</td></tr><tr><td>Cough and Dyspnoea</td><td>Xray Thorax</td><td>-</td></tr><tr><td>IFP or UIP </td><td>High Resolution CT</td><td>-</td></tr><tr><td>Sarcoidosis</td><td>High Resolution CT</td><td>-</td></tr><tr><td>Pneumoconiosis</td><td>High Resolution CT</td><td>-</td></tr><tr><td>Asbestosis</td><td>High Resolution CT</td><td>-</td></tr><tr><td>Pulmonary Embolism</td><td>CT Angiography</td><td>-</td></tr><tr><td>Biopsy Marker Pleural Fluid</td><td>Ultrasound</td><td>-</td></tr><tr><td>Metastases</td><td>CT</td><td>PET</td></tr><tr><td>Further Analysis abn on X Thorax</td><td>CT</td><td>-</td></tr><tr><td>Pericardial Fluid </td><td>Ultrasound</td><td>CT</td></tr><tr><td>Pericardial Fluid Drainage</td><td>Ultrasound Marking</td><td>CT</td></tr><tr><td>Pneumothorax </td><td>In and Expiration Xray Thorax</td><td>CT</td></tr><tr><td>Punction </td><td>CT</td><td>-</td></tr><tr><td>Sarcoidosis Pulmonary </td><td>High Resolution CT</td><td>-</td></tr><tr><td>Screening </td><td>Xray Thorax</td><td>-</td></tr><tr><td>Thorax Pain </td><td>Xray Thorax</td><td>-</td></tr><tr><td>Pectus Pathology </td><td>MRI</td><td>CT</td></tr><tr><td>Trauma </td><td>Xray Thorax + Rib Detail</td><td>CT</td></tr><tr><td>Tumor Staging </td><td>CT - Thorax Abdomen</td><td>CT</td></tr></tbody></table></div>
				</div>
			</div>
	  	<map id="bodyMap" name="body_map">
  			<area alt="Head" href="#" part="Head" shape="poly" coords="101,2,110,4,117,8,122,16,124,26,123,33,128,35,127,43,126,51,122,52,120,62,120,69,101,74,84,68,83,61,82,52,77,51,76,47,75,40,79,35,79,29,79,19,83,11,91,5" />
				<area alt="Neck" href="#" part="Neck" shape="poly" coords="83,68,101,74,120,68,120,79,113,93,90,93,83,79" />
	    	<area alt="Thorax" href="#" part="Thorax" shape="poly" coords="62,107,91,95,114,95,145,107,149,136,144,170,61,172,57,137" />
	    	<area alt="Abdomen" href="#" part="Abdomen" shape="poly" coords="62,177,143,176,145,210,59,211" />
				<area alt="Genetalia" href="#" part="Genetalia" shape="poly" coords="100,271,105,271,117,257,119,241,86,241,88,257" />
	  	</map>
  	</div>
	</body>
</html>
