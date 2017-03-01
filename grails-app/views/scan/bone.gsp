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
			<div class = "row text-center hidden-xs hidden-sm aa">
				<div class = "col-md-2 col-md-offset-2">
					<g:link class = "btn btn-success" controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
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
					<g:link class="btn" controller = "scan" action="other" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
						<asset:image class="img-circle" src="oth.png" style="img-responsive"/>
						<br>
						<h6><g:message code="my.localized.assist4"/></h6>
					</g:link>
				</div>
			</div>
			<div class="hidden-md hidden-lg col-sm-12 col-xs-12">
				<li class="dropdown">
					<div class="btn btn-success" data-toggle ="dropdown"><h5><g:message code="my.localized.assist1"/><span class="caret" style="float:right"></span></h5></div>
					<ul class = "dropdown-menu">
						<g:link class="btn" controller = "scan" action="body_part" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist2"/></h5></g:link>
						<g:link class="btn" controller = "scan" action="organ" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist3"/></h5></g:link>
						<g:link class="btn" controller = "scan" action="other" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist4"/></h5></g:link>
					</ul>
				</li>
			</div>
    	<div class="text-center">
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
			<div id="skeleton" class="col-md-4 col-sm-5 col-xs-12 ">
      	<div>
					<asset:image id="skeleton_image" class="img" src="skeleton.jpg" width="240" height="625" usemap="#bone_map" alt="Skeleton bone image" style="margin-left:auto;"/>
      	</div>
    	</div>
			<div class="col-md-8 col-sm-7 col-xs-12 ">
				<!--<div class="col-md-6 col-sm-6"></div> CLINIC FINDER LINK
				<div class="col-md-6 col-sm-6 col-xs-12" style="padding-right:0px;">
					<g:link controller = "clinic_finder"  action = "hongkong" class = "btn btn-success"  params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.find"/></g:link>
				</div>-->
				<div id="selections">
					<h3 class="text-center">Skeleton</h3>
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-inverse">
							<thead>
								<tr>
									<th>Condition</th>
									<th>First Choice</th>
									<th>Second Choice</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Metastases in the skeleton</td>
									<td>Nuclear medicine- Scintigraphy</td>
									<td>MRI</td>
								</tr>
								<tr>
									<td>Metabolic bone disorder</td>
									<td>Nuclear medicine- Scintigraphy</td>
									<td>Bone Biopsy</td>
								</tr>
								<tr>
									<td>Osteoporosis bone densitometry</td>
									<td>Xray TLWK + Dual energy Xray absorption</td>
										<td>-</td>
								</tr>
								<tr>
									<td>Paget</td>
									<td>Xray</td>
									<td>Nucleur Medicine - Scintigraphy</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<map id="boneMap" name="bone_map">
	      <area alt="Spine" href="#" bone="Spine" shape="poly" coords="111,81,114,112,108,121,115,129,114,167,116,170,112,176,114,205,109,207,113,209,112,217,108,218,113,220,111,227,109,230,113,233,112,238,106,240,113,243,109,248,104,250,111,256,110,263,129,262,130,255,136,251,129,246,129,243,134,240,128,236,128,232,132,229,129,226,129,222,135,218,126,215,126,210,131,207,127,203,126,177,123,170,127,166,125,130,130,123,126,112,127,82" />
	      <area alt="R_Shoulder" href="#" bone="Shoulder" shape="poly" coords="184,111,198,118,197,131,179,136,177,119" />
	      <area alt="L_Shoulder" href="#" bone="Shoulder" shape="poly" coords="53,111,42,117,39,132,63,131,64,118" />
	      <area alt="L_Elbow" href="#" bone="Elbow" shape="poly" coords="34,207,30,223,47,227,56,220,47,208" />
	      <area alt="R_Elbow" href="#" bone="Elbow" shape="poly" coords="205,207,192,211,185,219,194,229,208,225" />
	      <area alt="L_Wrist" href="#" bone="Wrist" shape="poly" coords="25,298,41,299,40,310,23,309" />
	      <area alt="R_Wrist" href="#" bone="Wrist" shape="poly" coords="218,300,199,300,197,311,219,310" />
				<area alt="Pelvis" href="#" bone="Hip" shape="poly" coords="68,254,74,246,80,243,88,243,93,245,98,248,101,253,108,258,109,257,111,263,129,263,129,258,135,262,139,254,144,246,153,243,160,245,167,250,169,257,171,269,173,282,176,301,170,313,156,318,155,311,153,301,148,301,144,313,137,315,132,315,127,315,124,312,121,304,116,309,113,314,109,316,100,316,95,315,93,309,91,301,86,309,85,316,82,317,72,318,66,313,64,304,64,296,68,284,70,275,72,262,70,251" />
	      <area alt="L_Knee" href="#" bone="Knee" shape="poly" coords="80,424,71,433,75,455,100,455,105,432,97,422" />
	      <area alt="R_Knee" href="#" bone="Knee" shape="poly" coords="160,424,169,432,166,454,142,459,133,438,139,425" />
	      <area alt="L_Ankle" href="#" bone="Ankle" shape="poly" coords="83,564,101,562,105,573,102,583,82,582" />
	      <area alt="R_Ankle" href="#" bone="Ankle" shape="poly" coords="157,562,139,561,136,572,136,584,160,582" />
	    </map>
  	</div>
	</body>
</html>
