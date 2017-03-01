<!doctype html>
<html lang="en" class="no-js">
<head>
    <g:message code="my.localized.og_title" />
    <g:message code="my.localized.og_type" />
    <g:message code="my.localized.og_url" />
    <g:message code="my.localized.og_image" />
    <g:message code="my.localized.og_site_name" />
    <g:message code="my.localized.og_description" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><g:message code="my.localized.footera" /> | <g:message code="my.localized.scan" /></title>
    <asset:link rel="icon" href="Capture.ico" type="image/x-ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="keywords" content="Why MRI scan, What scan do I need, Was the right scan made, Meniscal tear, Cartilage, Tumor staging, Malignancy, Scopy, Congenital, MRI or CT scan">


</head>

<g:layoutHead/>

<body>

  <!-- Google Webfonts -->
  <link href='https://fonts.googleapis.com/css?family=Roboto:400,300,100,500' rel='stylesheet' type='text/css'/>
  <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'/>

  <!-- Animate.css -->
  <asset:stylesheet src="animate.css"/>
  <!-- Icomoon Icon Fonts-->
  <asset:stylesheet src="icomoon.css"/>
  <!-- Owl Carousel -->
  <asset:stylesheet src="owl.carousel.min.css"/>
  <asset:stylesheet src="owl.theme.default.min.css"/>
  <!-- Magnific Popup -->
  <asset:stylesheet src="magnific-popup.css"/>
  <!-- Theme Style -->
  <asset:stylesheet src="style.css"/>
  <!-- Icon Style -->
  <asset:stylesheet src="icon.css"/>

  <!-- Jquery -->
  <asset:javascript src="jquery.js"/>

  <header id="fh5co-header" role="banner">
    <nav class="navbar navbar-default" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
        <!-- Mobile Toggle Menu Button -->
          <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#fh5co-navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
          <g:link  url ="/${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" class="navbar-brand">
            <g:message code="my.localized.logo" />
            <g:message code="my.localized.logo_mobile" />
          </g:link>
        </div>
        <ul class = "lang">
          <g:if test = "${session.user == null}">
            <li style = "margin-right: 40px; margin-left: 10px;">
              <g:link controller ="user" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><span style="color:#004080; text-transform: none;"><g:message code="my.localized.login" /><span class="border"></span></span></g:link>
            </li>
          </g:if>
          <g:if test = "${session.name}">
            <li><a style = "text-transform: none;">
              <g:message code = "my.localized.greeting"/>, </a>
            </li>
            <li>
              <g:link controller = "user" action = "info" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><span style="color:#004080;"><span style = "text-transform: none;">${session.name}<span class="border"></span></span></span></g:link>
            </li>
            <li style = "margin-right: 40px; margin-left: 10px;">
              <g:link controller ="user" action = "logout" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><span style="color:#004080;"><span style = "text-transform: none;"><g:message code="my.localized.logout" /><span class="border"></span></span></span></g:link>
            </li>
          </g:if>

            <li><g:link controller = "${params.controller}" action = "${params.action}" params = "[lang: 'en']">EN</g:link></li> |
            <li><g:link controller = "${params.controller}" action = "${params.action}" params = "[lang: 'zt']">繁</g:link></li> |
            <li><g:link controller = "${params.controller}" action = "${params.action}" params = "[lang: 'zs']">简</g:link></li>
        </ul>
        <div id="fh5co-navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span style="color:#004080;"><g:message code="my.localized.scan" /><span class="border"></span></span></a></li>
        <!--    <li><g:link controller = "clinic_finder" action="hongkong" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><span style="color:#004080;"><g:message code="my.localized.finder" /><span class="border"></span></span></g:link></li> !-->
            <li><g:link controller = "opinion" action="indexx" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><span style="color:#004080;"><g:message code="my.localized.opinion" /><span class="border"></span></span></g:link></li>
            <li><g:link controller = "storage" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><span style="color:#004080;"><g:message code="my.localized.storage" /><span class="border"></span></span></g:link></li>
            <!--<li><a href="<g:message code="my.localized.blog" />" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><span style="color:#004080;"><g:message code="my.localized.news"/><span class="border"></span></span></a></li>-->


            <g:if test = "${session.name}">

              <li id = "mobile_user">
                <g:link controller = "user" action = "info" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><span style="color:#004080;"><i class="icon-user" aria-hidden="true">${session.name}<span class="border"></span></span></i></g:link>
              </li>
              <li id = "mobile_logout">
                <g:link controller ="user" action = "logout" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><span style="color:#004080;"><g:message code="my.localized.logout" /><span class="border"></span></span></g:link>
              </li>

            </g:if>


            <li class="dropdown" id = "lang_nav">
              <a href="#" id = "lang_nav" style="color:#004080;" class="dropdown-toggle" data-toggle ="dropdown" aria-haspopup="true" aria-expanded="false">
                <g:message code="my.localized.lang" /><span class="caret"></span></a>
              <ul class = "dropdown-menu">
                  <g:link controller = "${params.controller}" action = "${params.action}" params = "[lang: 'en']"><li><span>EN<span class="border"></span></span></g:link></li>
                  <g:link controller = "${params.controller}" action = "${params.action}" params = "[lang: 'zt']"><li><span>繁<span class="border"></span></span></g:link></li>
                  <g:link controller = "${params.controller}" action = "${params.action}" params = "[lang: 'zs']"><li><span>简<span class="border"></span></span></g:link></li>

              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
  <!-- END .header -->
  <g:layoutBody/>
  <br><br><br>
  <footer id="fh5co-footer">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-sm-6 col-xs-12">
          <div class="fh5co-footer-widget">
            <h1 class="fh5co-footer-logo"><g:message code="my.localized.footera" /></h1>
            <p><g:message code="my.localized.footerb" /></p>
          </div>
          <!--<div class="fh5co-footer-widget">
            <ul class="fh5co-social">
              <li><a href="#"><i class="icon-facebook"></i></a></li>
              <li><a href="#"><i class="icon-twitter"></i></a></li>
              <li><a href="#"><i class="icon-instagram"></i></a></li>
              <li><a href="#"><i class="icon-linkedin"></i></a></li>
              <li><a href="#"><i class="icon-youtube"></i></a></li>
            </ul>
          </div>-->
        </div>
        <div class="col-md-2 col-sm-2 col-xs-4">
          <div class="fh5co-footer-widget ">
            <h4 class="fh5co-footer-lead "><g:message code="my.localized.company" /></h4>
            <ul>
              <li><g:link controller = "about" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.about" /></g:link>
              <li><g:link controller = "contact" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.contact" /></g:link>
              <li><g:link controller = "recruit" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.recruit" /></g:link>
              <!--<li><a href="<g:message code="my.localized.blog"/>" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.news" /></a></li>-->
              <li><g:link controller = "faq" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.faq" /></g:link>
            </ul>
          </div>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-4">
          <div class="fh5co-footer-widget ">
            <h4 class="fh5co-footer-lead"><g:message code = "my.localized.features"/></h4>
            <ul class="fh5co-list-check">
              <li><g:link controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.scan" /></g:link></li>
              <!-- <li><g:link controller = "clinic_finder" action="hongkong" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.finder" /></g:link></li> -->
              <li><g:link controller = "opinion" action="indexx" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.opinion" /></g:link></li>
              <li><g:link controller = "storage" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.storage" /></g:link></li>
            </ul>
          </div>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-4">
          <div class="fh5co-footer-widget ">
            <h4 class="fh5co-footer-lead"><g:message code="my.localized.security" /></h4>
            <ul>
              <li><g:link controller = "terms" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.tnc" /></g:link></li>
              <li><g:link controller = "privacy_policy" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.privacy" /></g:link></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <asset:javascript src="analytics.js"/>
  <!-- Modernizr JS -->
  <asset:javascript src="modernizr-2.6.2.min.js"/>
  <!-- FOR IE9 below -->
  <!--[if lt IE 9]>
  <script src="js/respond.min.js"></script>
  <![endif]-->


	<!-- jQuery Easing -->
	<asset:javascript src="jquery.easing.1.3.js"/>
	<!-- Bootstrap -->
	<asset:javascript src="bootstrap.min.js"/>
	<!-- Owl carousel -->
	<asset:javascript src="owl.carousel.min.js"/>
	<!-- Waypoints -->
	<asset:javascript src="jquery.waypoints.min.js"/>
	<!-- Magnific Popup -->
	<asset:javascript src="jquery.magnific-popup.min.js"/>
	<!-- Main JS -->
	<asset:javascript src="main.js"/>
  <asset:javascript src="jquery-1.6.1.min.js"/>
	<asset:javascript src="jquery.imagemapster.1.1.3b5.js"/>
	<asset:javascript src="scan.js"/>

</body>
</html>
