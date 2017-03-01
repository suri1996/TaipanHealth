<!doctype html>
<html>
	<head>
	    <meta name="layout" content="main"/>
	    <title>Clinic Finder</title>


      <asset:javascript src="jquery.min.js"/>

      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8n9yUL90jPu3uaBkWjtOuWAy27DOwOVU"></script>
      <script>


      </script>

      <style>
      select {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        }

			/* The Modal (background) */
			.modal {
    		display: none; /* Hidden by default */
    		position: fixed; /* Stay in place */
    		z-index: 1; /* Sit on top */
    		left: 0;
    		top: 0;
    		width: 100%; /* Full width */
    		height: 100%; /* Full height */
    		overflow: auto; /* Enable scroll if needed */
    		background-color: rgb(0,0,0); /* Fallback color */
    		background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
				}

			/* Modal Content/Box */
			.modal-content {
    			background-color: #fefefe;
    			margin: 15% auto; /* 15% from the top and centered */
    			padding: 20px;
    			border: 1px solid #888;
    			width: 80%; /* Could be more or less, depending on screen size */
				}

				/* The Close Button */
			.close {
    			color: #aaa;
    			float: right;
    			font-size: 28px;
    			font-weight: bold;
				}

			.close:hover,
			.close:focus {
    			color: black;
    			text-decoration: none;
    			cursor: pointer;
				}

			.selection_left{
				width:40%;
				float: left;
			}

			.selection_right{
				width: 50%;
			}

      </style>

  </head>
  <body>
    <asset:stylesheet src="bootstrap.css" />
		<div class = "container content">
    	<div class="row text-center">
      	<h1 style="color:#004080;">Welcome to Clinic Finder</h1>
      	<br> <br>
      	<div class="container">
        	<div class="row">
          	<div class="col-md-6 col-sm-6">
							<div class = "row">
            	<label class="pull-left">Insurance</label>
						</div>
<div class = "row">
						<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
							<g:select name = "company_select" id = "company_select" class = "selection_left" from = "${company}"  optionKey = "id" optionValue = "name_zs"  noSelection="${['': '选择保险公司']}" required = "required" />
						</g:if>
						<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
							<g:select name = "company_select" id = "company_select" class = "selection_left" from = "${company}"  optionKey = "id" optionValue = "name_zt"  noSelection="${['': '選擇保險公司']}" required = "required" />
						</g:elseif>
						<g:else>
							<g:select name = "company_select" id = "company_select" class = "selection_left" from = "${company}"  optionKey = "id" optionValue = "name_en"  noSelection="${['': 'Select Company']}" required = "required" />
						</g:else>

						<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
							<g:select name = "plan_select" id = "plan_select"  class = "selection_right" from = ""   noSelection="${['':'选择计划']}" required = "required" />
						</g:if>
						<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
							<g:select name = "plan_select" id = "plan_select"  class = "selection_right" from = ""   noSelection="${['':'選擇計劃']}" required = "required" />
						</g:elseif>
						<g:else>
							<g:select name = "plan_select" id = "plan_select"  class = "selection_right" from = ""   noSelection="${['':'Select Plan']}" required = "required" />
						</g:else>

</div>
<br />
							<div class = "row">
            	<label class="pull-left">Location</label>
						</div>

<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
							<g:select name = "territory_select" id = "territory_select" class = "selection_left" from = "${territory}" optionKey = "id" optionValue = "name_zs"  noSelection="${['':'选择地区']}" required = "required" />
</g:if>
<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
		<g:select name = "territory_select" id = "territory_select" class = "selection_left" from = "${territory}" optionKey = "id" optionValue = "name_zt"  noSelection="${['':'選擇地區']}" required = "required" />
</g:elseif>
<g:else>
	<g:select name = "territory_select" id = "territory_select" class = "selection_left" from = "${territory}" optionKey = "id" optionValue = "name_en"  noSelection="${['':'Select Territory']}" required = "required" />
</g:else>
							<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
								<g:select name = "district_select" id = "district_select"  class = "selection_right" from = ""   noSelection="${['':'选择分区']}" required = "required" />
							</g:if>
							<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
								<g:select name = "district_select" id = "district_select"  class = "selection_right" from = ""   noSelection="${['':'選擇分區']}" required = "required" />
							</g:elseif>
							<g:else>
								<g:select name = "district_select" id = "district_select"  class = "selection_right" from = ""   noSelection="${['':'Select District']}" required = "required" />
							</g:else>
            	<br> <br> <br>
            	<label class="pull-left">Purpose</label>
							<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
								<g:select name = "purpose_select" id = "purpose_select"  from = "${purpose}" optionKey = "name_en" optionValue = "name_zs"   noSelection="${['':'选择服务']}" required = "required" />
							</g:if>
							<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
								<g:select name = "purpose_select" id = "purpose_select"  from = "${purpose}" optionKey = "name_en" optionValue = "name_zt"  noSelection="${['':'選擇服務']}" required = "required" />
							</g:elseif>
							<g:else>
								<g:select name = "purpose_select" id = "purpose_select"  from = "${purpose}" optionKey = "name_en" optionValue = "name_en"  noSelection="${['':'Select Purpose']}" required = "required" />
							</g:else>

							<br> <br> <br>
							<!-- Trigger/Open The Modal -->
							<button id="myBtn">Submit</button>

							<button id="finder_button">Find</button>
							<!-- The Modal -->
							<div id="myModal" class="modal">
								<!-- Modal content -->
	  						<div class="modal-content">
	    						<span class="close">x</span>
									<form action =  "/${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}/finder/finder_interested">
										<h1> <g:message code = "my.localized.coming"/> </h1>
										<h2> <g:message code = "my.localized.interested"/> </h2>
										<div class="row">
											<input type = "email" name = "email" style="width:260px;"/><br><br>
											<input type = "submit" class= "btn btn-success btn-lg" value = "submit" style="width:160px"/>
										</div>
									</form>
	  						</div>
							</div>
            	<br>
          	</div>

          	<div class="col-md-6 col-sm-6">
            	<div id="googleMap" style="width:500px;height:380px;"></div>
          	</div>
        	</div>
      	</div>
      	<br> <br>
    	</div>
		</div>


		<script>
			// Get the modal
			var modal = document.getElementById('myModal');

			// Get the button that opens the modal
			var btn = document.getElementById("myBtn");

			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];

			// When the user clicks on the button, open the modal
			btn.onclick = function() {
				modal.style.display = "block";
			}

			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
				modal.style.display = "none";
			}

			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}
		</script>

<script>
$(document).ready(function(){

	var mapProp = {
		center:new google.maps.LatLng(22.344044,114.100998),
		zoom:10,
		mapTypeId:google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);


geocoder = new google.maps.Geocoder();

var markers = [];
function locate_hospital(address){
	geocoder.geocode( { 'address' : address }, function( results, status ) {
			if(status == google.maps.GeocoderStatus.OK ) {

					//In this case it creates a marker, but you can get the lat and lng from the location.LatLng
					map.setCenter( results[0].geometry.location );
					var marker = new google.maps.Marker( {
							map     : map,
							position: results[0].geometry.location
					} );
					markers.push(marker);
					google.maps.event.addListener(marker,'click',function() {
					  map.setZoom(18);
					  map.setCenter(marker.getPosition());
					  });

			} else {
					alert( 'Geocode was not successful for the following reason: ' + status );
			}
	} );
}

$('.abc').click(function(){
	   var id = $(this).children("input[name='data-id']");
	alert(id.val());
	map.setZoom(18);
	map.setCenter(markers[0].getPosition());
});


$('#finder_button').click(function(){
	var URL = '${createLink(controller: 'clinic_finder' , action:'find_medic', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ])}';
	for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
	  markers = [];

				var items = [];
				$.ajax({
					url:URL,
					dataType: "json",
					data: {plan: $('#plan_select').val(), territory: $('#territory_select').val(), district : $('#district_select').val(), purpose : $('#purpose_select').val()},
					success: function(resp){
						console.log(resp);
						$('#list').html(null);
						$.each(resp.hospital,function (i, item){
										locate_hospital(resp.hospital[i].location);
						});
								alert(markers);
						$.each(resp.medic, function(i, item) {

									items.push('<a href = "#">'
											+	 '<li>'
											+ '<div class = "row" style = "margin-bottom: 15px;">'
											+ '	<div class = "col-md-12">'
										  + resp.medic[i].hospital.name_en
										  + '</div>'
											+	'</div>'
											+	'	<div class = "row">'
											+	'	<div class="col-md-6">'
											+	'	</div>'
											+	'	<div class="col-md-3">'
									    + 'charge'
											+	'	</div>'
											+	'	<div class="col-md-3">'
									    +   '$' + resp.medic[i].charge
											+	'	</div>'
											+	'	</div>'
											+	'	<div class = "row">'
											+	'	<div class="col-md-6">'
											+	'	</div>'
											+	'	<div class="col-md-3">'
									    + ' claimed'
											+	'	</div>'
											+	'	<div class="col-md-3">'
								      +	 '$' + resp.medic[i].claims
											+	'	</div>'
											+	'	</div>'
											+	'	<div class = "row">'
											+	'	<div class="col-md-6">'
											+	'	District:' + resp.medic[i].district
											+	'	</div>'
											+	'	<div class="col-md-3">'
											+ ' Net '
											+	'	</div>'
											+	'	<div class="col-md-3">'
											+ ' $' + resp.medic[i].netpay
											+ '	</div>'
											+	'</li>'
											+	'</a>');
									$('#list').html(items.join(''));
						});
					}
			});








});


$('#company_select').change(function(){

  var URL = '${createLink(controller: 'clinic_finder' , action:'plan_select', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ])}';
	$.ajax({
		url:URL,
		data: {company: $('#company_select').val()},
		success: function(resp){
			if(${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'})
				resp = resp.replace('null_select','選擇計劃')
			else if(${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'})
				resp = resp.replace('null_select','选择计划')
			else {
				resp = resp.replace('null_select','Select Plan')
			}
				$("#plan_select").html(resp);

		}
});
});

$('#territory_select').change(function(){
var URL = '${createLink(controller: 'clinic_finder' , action:'territory_select', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ])}';
$.ajax({
	url:URL,
	data: {territory: $('#territory_select').val()},
	success: function(resp){
	if(${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'})
		resp = resp.replace('null_select','選擇分區')
	else if(${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'})
		resp = resp.replace('null_select','选择分区')
	else {
		resp = resp.replace('null_select','Select District')
	}
	$('#district_select').html(resp);

}
});

});



});

</script>


</body>
</html>
