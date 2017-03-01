<!doctype html>
<html>
	<head>
		<meta name="layout" content="scan_layout"/>
    <title>Scan Assist</title>
	</head>
	<body>
		<asset:stylesheet src="carousel.css"/>
		<asset:stylesheet src="scan.css"/>
		<asset:stylesheet src="tab.css"/>
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
					<g:link class="btn btn-success" controller = "scan" action="organ" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}">
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
					<div class="btn btn-success" data-toggle ="dropdown"><h5><g:message code="my.localized.assist3"/><span class="caret" style="float:right"></span></h5></div>
					<ul class = "dropdown-menu">
						<g:link class="btn" controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist1"/></h5></g:link>
						<g:link class="btn" controller = "scan" action="body_part" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code="my.localized.assist2"/></h5></g:link>
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
			<div class="col-md-12 col-xs-12 col-sm-12">
				<!--<div class="col-md-9 col-sm-9"></div>
				<div class="col-md-3 col-sm-3 col-xs-12" style="padding-right:0px;padding-left:0px;">
					<g:link controller = "clinic_finder"  action = "hongkong" class = "btn btn-success"  params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.find"/>!</g:link>
				</div>-->
    		<div id="organ" class="col-md-4 col-xs-12 col-sm-5">
    			<div>
						<asset:image id="organ_image" src="46317.jpg" width="246" height="430" usemap="#organ_map" alt="Organ image" />
    			</div>
    		</div>
				<div class="col-md-8 col-xs-12 col-sm-7">
					<!--<div class="col-md-6 col-sm-6"></div> CLINIC FINDER LINK
					<div class="col-md-6 col-sm-6 col-xs-12" style="padding-right:0px;">
						<g:link controller = "clinic_finder"  action = "hongkong" class = "btn btn-success"  params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.find"/>!</g:link>
					</div>-->
					<div  id="selections">
						<h3 class="text-center">Stomach</h3><div class="table-responsive"><table class="table table-striped table-bordered"><thead><tr><th>Condition</th><th>First Choice</th><th>Second Choice</th></tr></thead><tbody><tr><td>Malignancy</td><td>Scopy</td><td>-</td></tr><tr><td>Status after Surgery</td><td>Xray Oesophagus with omnipaque</td><td>-</td></tr><tr><td>Ulcer/Gastritis</td><td>Scopy</td><td>-</td></tr></tbody></table></div>
					</div>
				</div>
			</div>
	    <map id="organMap" name="organ_map">
				<area alt="Pipe" href="#" organ="Oesophagus" key = "O" shape="poly" coords="115,109,120,133,122,154,122,166,122,183,122,198,121,214,123,227,133,226,130,217,131,204,130,187,130,164,129,146,129,129,126,114,121,103" />
				<area alt="Stomach" href="#" organ="Stomach" key = "S" shape="poly" coords="102,275,112,268,119,270,131,272,136,269,139,263,147,258,153,250,157,244,160,232,166,229,169,236,173,243,177,256,174,266,170,276,163,282,158,287,153,291,144,294,136,293,126,293,119,291,113,283,105,287" />
				<area alt="SI" href="#" organ="Small Intestine" key = "SI" shape="poly" coords="116,388,111,387,107,386,102,382,99,379,102,375,97,373,95,371,95,364,97,357,100,349,95,345,88,343,83,340,81,337,81,333,83,331,80,325,77,321,78,314,81,310,79,303,85,303,93,305,102,308,110,311,116,311,122,313,127,313,131,311,138,312,143,306,149,307,153,304,157,301,163,301,164,297,166,305,165,313,167,321,164,327,165,335,167,341,170,348,165,356,158,357,155,357,155,366,153,372,145,376,138,371,134,367,130,363,128,376,125,384" />
				<area alt="Colon" href="#" organ="Colon" key = "C" shape="poly" coords="115,389,118,398,121,407,121,415,128,415,129,408,133,398,136,389,129,387,123,383" />
			</map>
  	</div>
	</body>
</html>
