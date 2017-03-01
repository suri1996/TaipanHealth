<!doctype html>
<html>
	<head>
		<meta name="layout" content="scan_layout"/>
    <title>Scan Assist</title>
		<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-80579342-1', 'auto');
  ga('send', 'pageview');

</script>
	</head>
	<body>
  	<div class = "container content" >
    	<div class="row text-center">
      	<h1 style="color:#004080;">Welcome to Scan Assist</h1>
    	</div>
    	<div id="bone" class="col-md-6 col-xs-12 col-sm-6" style="padding:80px;">
      	<div>
					<asset:image id="body_image" src="human_body.jpg" width="205" height="318" usemap="#body_map" alt="Body image" />
      	</div>
    	</div>
	    <map id="bodyMap" name="body_map">
	  		<area alt="Eyes" href="#" part="Eyes" shape="poly" coords="86,34,91,27,99,27,107,27,114,26,119,32,113,36,106,30,100,29,91,36" />
	      <area alt="Nose" href="#" part="Nose" shape="poly" coords="101,32,96,42,108,42" />
	      <area alt="L-Ear" href="#" part="Ear" shape="poly" coords="81,37,77,34,75,38,78,50,82,54" />
	      <area alt="R_Ear" href="#" part="Ear" shape="poly" coords="125,35,128,35,128,45,125,53,121,50" />
	      <area alt="Throat" href="#" part="Throat" shape="poly" coords="83,62,101,68,120,61,121,79,113,93,90,93,84,79" />
	      <area alt="Thorax" href="#" part="Thorax" shape="poly" coords="62,107,91,95,114,95,145,107,149,136,144,170,61,172,57,137" />
	      <area alt="Abdomen" href="#" part="Abdomen" shape="poly" coords="62,177,143,176,145,210,59,211" />
	      <area alt="Pelvis" href="#" part="Pelvis" shape="poly" coords="59,217,147,216,152,261,103,271,54,259" />
	  	</map>
  	</div>
	</body>
</html>
