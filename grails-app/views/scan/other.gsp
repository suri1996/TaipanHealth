<!doctype html>
<html>
	<head>
		<meta name="layout" content="scan_layout"/>
    <title>Scan Assist</title>
	</head>
	<body>
		<asset:stylesheet src="carousel.css"/>
		<asset:stylesheet src="tab.css"/>
		<asset:stylesheet src="scan.css"/>
  	<div class = "container content" >
			<div class = "row text-right hidden-xs hidden-sm aa">
				<div class = "col-md-2 col-md-offset-2">
					<g:link class = "btn" controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<asset:image class="img-circle" src="skel.png" style="img-responsive"/>
						<br>
						<h6><g:message code="my.localized.assist1"/></h6>
					</g:link>
				</div>
				<div class = "col-md-2">
					<g:link class="btn" controller = "scan" action="body_part" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
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
					<g:link class="btn btn-success" controller = "scan" action="other" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<asset:image class="img-circle" src="oth.png" style="img-responsive"/>
						<br>
						<h6><g:message code="my.localized.assist4"/></h6>
					</g:link>
				</div>
			</div>
			<div class="hidden-md hidden-lg col-sm-12 col-xs-12">
				<li class="dropdown">
					<div class="btn btn-success" data-toggle ="dropdown"><h5><g:message code="my.localized.assist4"/><span class="caret" style="float:right"></span></h5></div>
					<ul class = "dropdown-menu">
						<g:link class="btn" controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist1"/></h5></g:link>
						<g:link class="btn" controller = "scan" action="body_part" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist2"/></h5></g:link>
						<g:link class="btn" controller = "scan" action="organ" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist3"/></h5></g:link>
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
			<div class="col-md-12 col-xs-12 col-sm-12">
				<!--<div class="col-md-9 col-sm-9"></div>
				<div class="col-md-3 col-sm-3 col-xs-12" style="padding-right:0px;padding-left:0px;">
					<g:link controller = "clinic_finder"  action = "hongkong" class = "btn btn-success"  params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.find"/>!</g:link>
				</div>-->
				<ul class="tab row">
  				<div class="col-md-3"><li><a class="tablinks active col-xs-12" onclick="openCity(event, 'Pediatrics')">Pediatrics</a></li></div>
  				<div class="col-md-3"><li><a class="tablinks col-xs-12" onclick="openCity(event, 'Soft Tissues and Extremities')">Soft Tissues and Extremities</a></li></div>
  				<div class="col-md-3"><li><a class="tablinks col-xs-12" onclick="openCity(event, 'Angiography')">Angiography</a></li></div>
					<div class="col-md-3"><li><a class="tablinks col-xs-12" onclick="openCity(event, 'Intervention')">Intervention</a></li></div>
				</ul>
				<div id="Pediatrics" class="tabcontent" style="display:block">
					<h3>Pediatrics</h3>
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Condition</th>
									<th>First Choice</th>
									<th>Second Choice</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Congenital hip dislocation (between 3-9 months)</td>
									<td>Ultrasound</td>
									<td>Rosen View</td>
								</tr>
								<tr>
									<td>Congenital hip dislocation (>9 months)</td>
									<td>Xray Pelvis</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Transient Synovitis</td>
									<td>Ultrasound + Xray</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Heart defect (left or right shunt)</td>
									<td>Xray Thorax</td>
									<td>Ultrasound</td>
								</tr>
								<tr>
									<td>Intussuseption</td>
									<td>BOZ + Ultrasound</td>
									<td>Xray Colon</td>
								</tr>
								<tr>
									<td>Perthes disease</td>
									<td>Xray</td>
									<td>MRI</td>
								</tr>
								<tr>
									<td>Positie PH elektrode</td>
									<td>Xray Thorax</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Pyloric stenosis</td>
									<td>Ultrasound</td>
									<td>Xray Stomach</td>
								</tr>
								<tr>
									<td>Screening of  neonatal  neonatal pathology</td>
									<td>Ultrasound Skull</td>
									<td>MRI/CT</td>
								</tr>
								<tr>
									<td>Spina bifida</td>
									<td>Ultrasound + LWK</td>
									<td>MRI</td>
								</tr>
								<tr>
									<td>Abdominal trauma (kids)</td>
									<td>Ultrasound</td>
									<td>CT</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div id="Soft Tissues and Extremities" class="tabcontent">
					<h3>Soft Tissues and Extremities</h3>
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Condition</th>
									<th>First Choice</th>
									<th>Second Choice</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Fistula</td>
									<td>Fistulagram</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Delayed union after fracture of the long bones</td>
									<td>Xray</td>
									<td>CT + MPR</td>
								</tr>
								<tr>
									<td>Swelling or Mass</td>
									<td>Xray + Ultrasound</td>
									<td>MRI</td>
								</tr>
								<tr>
									<td>Further Analysis</td>
									<td>CT and/or MRI</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Bone Length Study</td>
									<td>Xray</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Scoliosis</td>
									<td>Xray</td>
									<td>-</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div id="Angiography" class="tabcontent">
					<h3>Angiography</h3>
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Condition</th>
									<th>First Choice</th>
									<th>Second Choice</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Cerebral aneurysm</td>
									<td>MR Angiography</td>
									<td>CT Angiography</td>
								</tr>
								<tr>
									<td>Aorta iliac artery pathology</td>
									<td>CT Angiography</td>
									<td>MR Angiography</td>
								</tr>
								<tr>
									<td>Deep vein thrombosis</td>
									<td>Ultrasound Doppler</td>
									<td>Phlebography</td>
								</tr>
								<tr>
									<td>Periferal atheroocclusive disease of the legs</td>
									<td>MR Angiography</td>
									<td>Digital Subtraction Angiography</td>
								</tr>
								<tr>
									<td>Carotid stenosis</td>
									<td>Ultrasond Doppler</td>
									<td>CT Angiography/MR Angiography</td>
								</tr>
								<tr>
									<td>Trombosis</td>
									<td>MR Angiography</td>
									<td>Digital Subtraction Angiography/CT Angiography</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div id="Intervention" class="tabcontent">
					<h3>Intervention</h3>
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Condition</th>
									<th>First Choice</th>
									<th>Second Choice</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Abscess Drainage</td>
									<td>CT</td>
									<td>Ultrasound</td>
								</tr>
								<tr>
									<td>Cyst Puncture</td>
									<td>CT</td>
									<td>Ultrasound</td>
								</tr>
								<tr>
									<td>Cyst Puncture (neck)</td>
									<td>Ultrasound</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Gallstone Extraction</td>
									<td>ERCP</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Biliary Drainage</td>
									<td>ERCP</td>
									<td>PTC</td>
								</tr>
								<tr>
									<td>Nephrostomy</td>
									<td>Ultrasound</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Percutaneous coronary intervention</td>
									<td>Digital subtraction angiography</td>
									<td>-</td>
								</tr>
								<tr>
									<td>Embolisation</td>
									<td>Digital subtraction angiography</td>
									<td>-</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
  	</div>
		<asset:javascript src="tab.js"/>
	</body>
</html>
