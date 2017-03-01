<!doctype html>
	<html>
	<head>
	    <meta name="layout" content="main"/>
	    <title><g:message code="my.localized.footera" /></title>

	<asset:stylesheet src="index.css"/>
	<!-- Custom CSS for slider -->
	<asset:stylesheet src="carousel.css"/>
	<!-- Bootstrap Core CSS -->
  <asset:stylesheet src="bootstrap.min.css"/>


	</head>

	<body>
		<!-- Carousel -->
    <div id="carousel-hero" class="ch-landing-carousel carousel slide hidden-xs article-slide" data-ride="carousel">
      <div class="carousel-outer">
        <div class="carousel-inner">
					<div class="item active">
            <div class="fill" style="background-image:url('../assets/home.jpg');">
    					<div class="container">
        				<div class="container-fluid">
            			<div class="ch-landing__row row">
                		<div class="col-md-5 col-md-offset-1 col-sm-12 col-xs-12 ch-landing__details">
											<div class="ch-landing__header">
                        <h3><g:message code="my.localized.help1"/></h3>
                    	</div>
											<div class="ch-landing__cta row">
                        <div class="col-xs-12 col-md-11">
                          <div class="ch-landing-custom-quote">
                						<g:link controller = "about" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" class = "button" ><g:message code="my.localized.about"/></g:link>
                          </div>
                      	</div>
                      </div>
										</div>
										<div class="col-sm-5 col-md-4 col-md-offset-1 ch-landing__details hidden-xs hidden-sm">
											<div class="ch-landing__details_text">
												<h4><g:message code="my.localized.help"/></h4>
												<ul>
	                    		<li><g:message code="my.localized.promisehome1"/></li>
													<li><g:message code="my.localized.promisehome2"/></li>
													<li><g:message code="my.localized.promisehome3"/></li>
													<li><g:message code="my.localized.promisehome4"/></li>
													<li><g:message code="my.localized.promisehome5"/></li>
													<li><g:message code="my.localized.promisehome6"/></li>
													<li><g:message code="my.localized.promisehome7"/></li>
	                			</ul>
											</div>
										</div>
                	</div>
            		</div>
        			</div>
    				</div>
					</div>
          <div class="item">
            <div class="fill" style="background-image:url('../assets/scan.jpg');">
    					<div class="container">
        				<div class="container-fluid">
            			<div class="ch-landing__row row">
                		<div class="col-md-5 col-md-offset-1 col-sm-12 col-xs-12 ch-landing__details">
                    	<div class="ch-landing__header">
                        <h2><g:message code="my.localized.scan" /></h2>
                        <h3><g:message code="my.localized.sca1" /></h3>
                    	</div>
                    	<div class="ch-landing__cta row">
                        <div class="col-xs-12 col-md-11">
                          <div class="ch-landing-custom-quote">
                						<g:link controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" class = "button" ><g:message code="my.localized.scan"/></g:link>
                          </div>
                      	</div>
                      </div>
                		</div>
										<div class="col-sm-5 col-md-4 col-md-offset-1 ch-landing__details hidden-xs hidden-sm">
											<div class="ch-landing__details_text">
												<h4><g:message code="my.localized.promise"/></h4>
												<ul>
                      		<li><g:message code="my.localized.promisescan1"/></li>
                      		<li><g:message code="my.localized.promisescan2"/></li>
                        	<li><g:message code="my.localized.promisescan3"/></li>
													<li><g:message code="my.localized.promise2"/></li>
                      		<li><g:message code="my.localized.promise3"/></li>
                  			</ul>
											</div>
										</div>
            			</div>
        				</div>
    					</div>
						</div>
          </div>
          <!--<div class="item">
          	<div class="fill" style="background-image:url('../assets/finder.jpg');">
  						<div class="container">
        				<div class="container-fluid">
            			<div class="ch-landing__row row">
              			<div class="col-md-5 col-md-offset-1 col-sm-12 col-xs-12 ch-landing__details">
                  		<div class="ch-landing__header">
                      	<h2><g:message code="my.localized.finder" /></h2>
                      	<h3>Find a clinic to do your scan and find a clinic for treatment</h3>
                  		</div>
                  		<div class="ch-landing__cta row">
                        <div class="col-xs-12 col-md-11">
													<div class="ch-landing-custom-quote">
                						<g:link controller = "clinic_finder" action="hongkong" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" class="button"><g:message code="my.localized.finder"/></g:link>
                          </div>
                      	</div>
                  		</div>
              			</div>
										<div class="col-sm-5 col-md-4 col-md-offset-1 ch-landing__details hidden-xs hidden-sm">
											<div class="ch-landing__details_text">
                      	<h4><g:message code="my.localized.promise"/></h4>
												<ul>
                      		<li><g:message code="my.localized.promisefinder1"/></li>
													<li><g:message code="my.localized.promisefinder2"/></li>
													<li><g:message code="my.localized.promisefinder3"/></li>
                        	<li><g:message code="my.localized.promise2"/></li>
                      		<li><g:message code="my.localized.promise3"/></li>
                  			</ul>
											</div>
                		</div>
            			</div>
        				</div>
    					</div>
						</div>
					</div>-->
          <div class="item">
          	<div class="fill" style="background-image:url('../assets/opinion.jpg');">
    					<div class="container">
      					<div class="container-fluid">
          				<div class="ch-landing__row row">
                		<div class="col-md-5 col-md-offset-1 col-sm-12 col-xs-12 ch-landing__details">
                  		<div class="ch-landing__header">
                      	<h2><g:message code="my.localized.opinion" /></h2>
                      	<h3><g:message code="my.localized.opinio1" /><h3>
                  		</div>
                  		<div class="ch-landing__cta row">
                      	<div class="col-xs-12 col-md-11">
                          <g:link controller = "opinion" action="indexx" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" class="button"><g:message code="my.localized.opinion"/></g:link>
                        </div>
                    	</div>
                		</div>
										<div class="col-sm-5 col-md-4 col-md-offset-1 ch-landing__details hidden-xs hidden-sm">
											<div class="ch-landing__details_text">
                      	<h4><g:message code="my.localized.promise"/></h4>
												<ul>
                      		<li><g:message code="my.localized.promiseopinion1"/></li>
													<li><g:message code="my.localized.promiseopinion2"/></li>
													<li><g:message code="my.localized.promiseopinion3"/></li>
													<li><g:message code="my.localized.promiseopinion4"/></li>
                        	<li><g:message code="my.localized.promise2"/></li>
                      		<li><g:message code="my.localized.promise3"/></li>
                  			</ul>
											</div>
                		</div>
      						</div>
  							</div>
							</div>
		      	</div>
        	</div>

					<div class="item">
						<div class="fill" style="background-image:url('../assets/storage.jpg');">
							<div class="container">
								<div class="container-fluid">
									<div class="ch-landing__row row">
										<div class="col-md-5 col-md-offset-1 col-sm-12 col-xs-12 ch-landing__details">
											<div class="ch-landing__header">
												<h2><g:message code="my.localized.storage"/></h2>
												<h3><g:message code="my.localized.storag1"/><h3>
											</div>
											<div class="ch-landing__cta row">
												<div class="col-xs-12 col-md-11">
													<g:link controller = "storage" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}" class="button"><g:message code="my.localized.storage"/></g:link>
												</div>
											</div>
										</div>
										<div class="col-sm-5 col-md-4 col-md-offset-1 ch-landing__details hidden-xs hidden-sm">
											<div class="ch-landing__details_text">
												<h4><g:message code="my.localized.promise"/></h4>
												<ul>
													<li><g:message code="my.localized.promisestorage1"/></li>
													<li><g:message code="my.localized.promisestorage2"/></li>
													<li><g:message code="my.localized.promisestorage3"/></li>
													<li><g:message code="my.localized.promisestorage4"/></li>
													<li><g:message code="my.localized.promisestorage5"/></li>
													<li><g:message code="my.localized.promisestorage6"/></li>
													<li><g:message code="my.localized.promise2"/></li>
													<li><g:message code="my.localized.promise3"/></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-hero" data-slide="prev">
					<span class="icon-prev"></span>
				</a>
				<a class="right carousel-control" href="#carousel-hero" data-slide="next">
					<span class="icon-next"></span>
				</a>
			</div>

			<div class='carousel-indicators row'>
				<div class="col-md-3 active" data-target='#carousel-hero' data-slide-to='0'><h2><g:message code="my.localized.footera"/></h2></div>
    		<div class="col-md-3" data-target='#carousel-hero' data-slide-to='1'><h2><g:message code="my.localized.scan"/></h2></div>
      	<!--<div class="col-md-3" data-target='#carousel-hero' data-slide-to='2'><h2><g:message code="my.localized.finder"/></h2></div> Change the width in index.css to 20% when putting this back, currently it is 25% -->
    		<div class="col-md-3" data-target='#carousel-hero' data-slide-to='2'><h2><g:message code="my.localized.opinion"/></h2></div>
      	<div class="col-md-3" data-target='#carousel-hero' data-slide-to='3'><h2><g:message code="my.localized.storage"/></h2></div>
			</div>
		</div>

		<div id="fh5co-features" class="col-xs-12 hidden-sm hidden-md hidden-lg">
			<div class="fh5co-feature-text text-center">
				<h3 class="fh5co-section-lead"><g:message code="my.localized.footerb"/></h3>
			</div>
			<div class="fill" style="background-image:url('../assets/home.jpg');">
				<div class="container" style="height:260px;"></div>
			</div>
		</div>
		<!-- Features -->

		<div id="fh5co-features">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-10 col-xs-10 col-md-offset-1 col-xs-offset-1">
						<h2 class="fh5co-section-lead"><g:message code="my.localized.services"/></h2>
						<h3 class="fh5co-section-sub-lead"><g:message code="my.localized.services2" /></h3>
					</div>
					<div class="fh5co-spacer fh5co-spacer-md"></div>
				</div>
				<div class="row">
					<div class="col-md-6 col-sm-12 fh5co-feature-border">
						<div class="fh5co-feature">
							<div class="fh5co-feature-icon to-animate">
								<i class="icon-head"></i>
							</div>
							<div class="fh5co-feature-text">
								<g:link controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h3><g:message code="my.localized.scan" /></h3></g:link>
								<p><g:message code="my.localized.scan2" /></p>
								<p><g:link controller = "scan" action="bone" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.scanbutton"/></g:link></p>
								<br>
							</div>
						</div>
						<!--<div class="fh5co-feature no-border">
							<div class="fh5co-feature-icon to-animate">
								<i class="icon-globe"></i>
							</div>
							<div class="fh5co-feature-text">
								<g:link controller = "clinic_finder" action="hongkong" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h3><g:message code="my.localized.finder" /></h3></g:link>
								<p><g:message code="my.localized.finder2" /></p>
								<p><g:link controller = "clinic_finder" action="hongkong" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.finderbutton"/></g:link></p>
							</div>
						</div>-->
					</div>
					<div class="col-md-6 col-sm-12">
						<div class="fh5co-feature">
							<div class="fh5co-feature-icon to-animate">
								<i class="icon-microphone"></i>
							</div>
							<div class="fh5co-feature-text">
								<g:link controller = "opinion" action="indexx" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h3><g:message code="my.localized.opinion" /></h3></g:link>
								<p><g:message code="my.localized.opinion2" /></p>
								<p><g:link controller = "opinion" action="indexx" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.opinionbutton"/></g:link></p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-12 col-md-offset-3">
						<div class="fh5co-feature no-border">
							<div class="fh5co-feature-icon to-animate">
								<i class="icon-bag"></i>
							</div>
							<div class="fh5co-feature-text">
								<g:link controller = "storage" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h3><g:message code="my.localized.storage"/></h3></g:link>
								<p><g:message code="my.localized.storage2"/></p>
								<p><g:link controller = "storage" action="index" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><g:message code="my.localized.check_storage"/></g:link></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css"/>
		<div class="container"> BLOG
			<div class="well" id = "well0">
        <div class="media">
      		<div class="media-body">
        		<h1 id = "post0_title"></h1>
        		<div class = "row">
      				<div class="col-md-8 blogShort" id = "post0">
        				<article><p id = "post0_content"  class = "post_content"></p></article>
								<div class = "blog_desktop">
									<span><i class="glyphicon glyphicon-calendar"></i><i  id = "post0_date"></i></span>  &nbsp
									<div id="fb-root" style = "display: inline-block;"></div>
									<script>(function(d, s, id) {
								  	var js, fjs = d.getElementsByTagName(s)[0];
								  	if (d.getElementById(id)) return;
								  	js = d.createElement(s); js.id = id;
								  	js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.7";
								  	fjs.parentNode.insertBefore(js, fjs);
									}(document, 'script', 'facebook-jssdk'));</script>
									<div id = "post0_share" class="fb-like"  data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="false"></div>
									<a class="btn btn-warning btn-circle text-uppercase" id = "post0_comment"><span><i class="glyphicon glyphicon-comment"></i><span class = "post_comment_link" id = "post0_comment_length"></span></span></a>
									<span><a id = "post0_facebook" class="btn btn-primary btn-circle text-uppercase"  target = "_blank"><i style = "color: white;" class="icon-facebook" aria-hidden="true"></i>Share</span></a>
									<span><a id = "post0_weibo" class="btn btn-danger btn-circle text-uppercase"  target = "_blank"><i style = "color: white;" class="fa fa-weibo" aria-hidden="true"></i>Share</span></a>
								</div>
           		</div>
      				<div class="col-md-4">
              	<img class = "post_image"  id = "post0_image" />
       				</div>
      			</div>
						<div class="row blog_mobile">
							<div class = "col-md-2"><span><i class="glyphicon glyphicon-calendar"></i><i id = "post0_date_mobile"></i></span></div>
							<div class = "col-md-2">
								<a class="btn btn-warning btn-circle text-uppercase" id = "post0_comment_mobile"><span><i class="glyphicon glyphicon-comment"></i><span class = "post_comment_link" id = "post0_comment_length_mobile"></span></span></a>
								<div id = "post0_share_mobile" class="fb-like"  data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="false"></div>
								<span><a id = "post0_facebook_mobile" class="btn btn-primary btn-circle text-uppercase"  target = "_blank"><i style = "color: white;" class="icon-facebook" aria-hidden="true"></i>Share</span></a>
								<span><a id = "post0_weibo_mobile" class="btn btn-danger btn-circle text-uppercase"  target = "_blank"><i style = "color: white;" class="fa fa-weibo" aria-hidden="true"></i>Share</span></a>
							</div>
						</div>
      			<div class = "post_comment_detail" id = "post0_comment_details"></div>
					</div>
   			</div>
    	</div>
   		<div class="well" id = "well1">
        <div class="media">
      		<div class="media-body">
        		<h1 id = "post1_title"></h1>
        		<div class = "row">
      				<div class="col-md-8 blogShort" id = "post1">
        				<article><p id = "post1_content"  class = "post_content"></p></article>
								<div class = "blog_desktop">
								<span><i class="glyphicon glyphicon-calendar"></i><i  id = "post1_date"></i></span>  &nbsp
								<div id = "post1_share" class="fb-like"  data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="false"></div>
									<a class="btn btn-warning btn-circle text-uppercase" id = "post1_comment"><span><i class="glyphicon glyphicon-comment"></i><span class = "post_comment_link" id = "post1_comment_length"></span></span></a>
									<span><a id = "post1_facebook" class="btn btn-primary btn-circle text-uppercase"  target = "_blank"><i style = "color: white;" class="icon-facebook" aria-hidden="true"></i>Share</span></a>
									<span><a id = "post1_weibo" class="btn btn-danger btn-circle text-uppercase"  target = "_blank"><i style = "color: white;" class="fa fa-weibo" aria-hidden="true"></i>Share</span></a>
								</div>
							</div>
      				<div class="col-md-4">
               <img class = "post_image"  id = "post1_image" />
       				</div>
      			</div>
            <div class="row blog_mobile">
           		<div class = "col-md-2"><span><i class="glyphicon glyphicon-calendar"></i><i id = "post1_date_mobile"></i></span></div>
           		<div class = "col-md-2">
            		<a class="btn btn-warning btn-circle text-uppercase" id = "post1_comment_mobile"><span><i class="glyphicon glyphicon-comment"></i><span class = "post_comment_link" id = "post1_comment_length_mobile"></span></span></a>
								<div id = "post1_share_mobile" class="fb-like"  data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="false"></div>
								<span><a id = "post1_facebook_mobile" class="btn btn-primary btn-circle text-uppercase"  target = "_blank"><i style = "color: white;" class="icon-facebook" aria-hidden="true"></i>Share</span></a>
								<span><a id = "post1_weibo_mobile" class="btn btn-danger btn-circle text-uppercase"  target = "_blank"><i style = "color: white;" class="fa fa-weibo" aria-hidden="true"></i>Share</span></a>
							</div>
         		</div>
      			<div class = "post_comment_detail" id = "post1_comment_details"></div>
					</div>
   			</div>
    	</div>
  	</div>-->

		<div class="fh5co-bg-section">
			<div class="col-md-12">
				<div class="fh5co-hero-wrap">
					<div class="fh5co-hero-intro text-center">
						<h2 class="fh5co-lead"><span class="quo">&ldquo;</span><g:message code="my.localized.quote" /><span class="quo">&rdquo;</span></h2>
					</div>
				</div>
			</div>
		</div>
		<input id = "lang_code" type = "hidden" value = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}" />

<!--	<asset:javascript src="bootstrap.min.js"/> !-->
	<asset:javascript src="jquery.min.js"/>
	<!-- Bootstrap -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script>

  $(document).ready(function(){
  var lang = $('#lang_code').val();
  $('#well0').css('display', 'none');
  $('#well1').css('display', 'none');
	if(lang == 'zs')
	{
		lang = "zt";
	}

  var FEED_URL = 'https://blog.taipanhealth.com/index.php/' +  lang + '/feed/';
  $.get(FEED_URL, function(data) {
      var $XML = $(data);
    console.log(data);

      $XML.find("item").each(function(i) {
          var $this = $(this),
              item = {
                  title: $this.find("title").text(),
                  link:  $this.find("link").text(),
                  content: $this.find("description").text(),
                  pubDate: $this.find("pubDate").text(),
				          image: $this.find("feature_image").text(),
				          comment_link: $this.find("comments_link").text()

              };
        if(item.content.indexOf("&#8230; <a") >= 0)
        {
          item.content = item.content.replace('&#8230; <a', '&#8230; <a');
        }
				var weiboContent = item.content.substring(0,200) + '...';
     $('#well' + i).css('display', 'block');
     $('#post' + i + '_title').html(item.title);
     $('#post' + i + '_content').html(item.content);
     $('#post' + i + '_link').attr('href',item.link);
     $('#post' + i + '_image').attr('src' ,item.image);
     $('#post' + i + '_date').html(' ' + item.pubDate + ' ');
		 $('#post' + i + '_date_mobile').html(' ' + item.pubDate + ' ');
		 $('#post' + i + '_share').attr('data-href', item.link);
		 $('#post' + i + '_facebook').attr('href', 'https://www.facebook.com/sharer/sharer.php?u=' + item.link);
		 $('#post' + i + '_weibo').attr('href', 'http://service.weibo.com/share/share.php?title=' + weiboContent + '&url=' + item.link + '/&pic=' + item.image);
		 $('#post' + i + '_share_mobile').attr('data-href', item.link);
		 $('#post' + i + '_facebook_mobile').val('href','https://www.facebook.com/sharer/sharer.php?u=' + item.link);
		 $('#post' + i + '_weibo_mobile').attr('href', 'http://service.weibo.com/share/share.php?title=' + weiboContent + '&url=' + item.link + '/&pic=' + item.image);

     if(item.image == '')
     {
      $('#post' + i).removeClass('col-md-8');
      $('#post' + i).removeClass('col-md-8');
      $('#post' + i).addClass('col-md-12');
     }
     $('#post' + i + '_comment_length').html('0 Comments');
     var biggest = 0;
     $.get(item.comment_link, function(data2) {
      var $XML2 = $(data2);

       $XML2.find("item").each(function(j){
        var $this = $(this),
          item = {
            comment_details: $this.find("description").text(),
            author: $this.find("author").text(),
            time: $this.find("pubDate").text()
          };
					$('#post' + i + '_comment_length_mobile').html(j + 1 + ' Comments');
          $('#post' + i + '_comment_length').html(j + 1 + ' Comments');
          $('#post' + i + '_comment_details').append('<div class = "row comment_row" >' + '<div class = "col-md-1">' + '<img src = "/assets/avatar.png" />' + '</div>' +  '<div class = "col-md-11">' + '<P>' + '<strong style = "color: #000000;">' + item.author + ' &nbsp</strong>' + item.time + '<br />' + item.comment_details  + '</h4>' +  '</div>' + '</div>');
       });
     });



          //etc...
      });
  });

  $('#post0_comment').click(function(){
   if($('#post0_comment_details').css('display') == 'none')
    $('#post0_comment_details').css('display', 'block');
   else {
     $('#post0_comment_details').css('display', 'none');
   }
  });

	$('#post0_comment_mobile').click(function(){
	 if($('#post0_comment_details').css('display') == 'none')
		$('#post0_comment_details').css('display', 'block');
	 else {
		 $('#post0_comment_details').css('display', 'none');
	 }
	});

  $('#post1_comment').click(function(){
   if($('#post1_comment_details').css('display') == 'none')
    $('#post1_comment_details').css('display', 'block');
   else {
     $('#post1_comment_details').css('display', 'none');
   }
  });

	$('#post1_comment_mobile').click(function(){
   if($('#post1_comment_details').css('display') == 'none')
    $('#post1_comment_details').css('display', 'block');
   else {
     $('#post1_comment_details').css('display', 'none');
   }
  });


  });
 </script>
	</body>
</html>
