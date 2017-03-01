<!doctype html>
<html>
	<head>
	    <meta name="layout" content="main"/>
	    <title>Taipan Health | Clinic Finder</title>


      <asset:javascript src="jquery.min.js"/>

      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8n9yUL90jPu3uaBkWjtOuWAy27DOwOVU"></script>

			<asset:stylesheet src="bootstrap.css" />
			<asset:stylesheet src="carousel.css"/>
			<asset:stylesheet src="finder.css"/>


  </head>
  <body>

		<div class = "container content">
			<div class="col-md-6 col-sm-6"></div>
			<div class = "col-md-3 col-sm-3">
				<g:link class="btn" controller = "clinic_finder" action="orthopedics" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5><g:message code = "my.localized.international"/></h5></g:link>
			</div>
			<div class = "col-md-3 col-sm-3">
				<g:link class="btn btn-success" controller = "clinic_finder" action="hongkong" params = "${[ lang : session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']}"><h5 id = "tab"><g:message code = "my.localized.hong_kong"/></h5></g:link>
			</div>

    	<div class="h row text-center text-title">

      	<h1><g:message code = "my.localized.welcome_clinic_finder"/></h1>
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
      	<div class="col-md-6 col-sm-6">
          <label><g:message code = "my.localized.insurance"/></label>
					<br>
					<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
						<g:select name = "company_select"  class="form-control" id = "company_select" from = "${company}"  optionKey = "name_en" optionValue = "name_zs"  noSelection="${['': '其他']}" required = "required" />
					</g:if>
					<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
						<g:select name = "company_select"  class="form-control" id = "company_select" from = "${company}"  optionKey = "name_en" optionValue = "name_zt"  noSelection="${['': '其他']}" required = "required" />
					</g:elseif>
					<g:else>
						<g:select name = "company_select"  class="form-control" id = "company_select" from = "${company}"  optionKey = "name_en" optionValue = "name_en"  noSelection="${['': 'Others']}" required = "required" />
					</g:else>
					<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
						<g:select name = "plan_select"  class="form-control"  id = "plan_select"  from = ""   noSelection="${['':'选择计划']}" required = "required" />
					</g:if>
					<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
						<g:select name = "plan_select"  class="form-control"  id = "plan_select"  from = ""   noSelection="${['':'選擇計劃']}" required = "required" />
					</g:elseif>
					<g:else>
						<g:select name = "plan_select"  class="form-control"  id = "plan_select"  from = ""   noSelection="${['':'Select Plan']}" required = "required" />
					</g:else>
				</div>
				<div class="col-md-6 col-sm-6">
        	<label class="pull-left"><g:message code = "my.localized.location"/></label>
					<br>
					<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
						<g:select name = "territory_select" class="form-control"  id = "territory_select" from = "${territory}" optionKey = "name_en" optionValue = "name_zs"  noSelection="${['':'选择地区']}" required = "required" />
					</g:if>
					<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
						<g:select name = "territory_select" class="form-control"  id = "territory_select" from = "${territory}" optionKey = "name_en" optionValue = "name_zt"  noSelection="${['':'選擇地區']}" required = "required" />
					</g:elseif>
					<g:else>
						<g:select name = "territory_select" class="form-control"  id = "territory_select" from = "${territory}" optionKey = "name_en" optionValue = "name_en"  noSelection="${['':'Select Territory']}" required = "required" />
					</g:else>
					<br />
					<g:if test = "${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs'}">
						<g:select name = "district_select" class="form-control"  id = "district_select"  from = ""   noSelection="${['':'选择分区']}" required = "required" />
					</g:if>
					<g:elseif test="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt'}">
						<g:select name = "district_select" class="form-control"  id = "district_select"  from = ""   noSelection="${['':'選擇分區']}" required = "required" />
					</g:elseif>
					<g:else>
						<g:select name = "district_select" class="form-control"  id = "district_select"  from = ""   noSelection="${['':'Select District']}" required = "required" />
					</g:else>
				</div>
				<div class="col-md-0 col-sm-0">
        	<label class="pull-left" id = "purpose_label">Purpose</label>
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
			</div>
			<br>
			<div class="container">
				<div class="col-md-6 col-sm-6"></div>
				<div class = "col-md-3 col-sm-3"></div>
				<div class="col-md-3 col-sm-3" id = "button_submit">
					<a id="finder_button" class="btn btn-success"><h5 id = "tab"><g:message code = "my.localized.submit"/></h5></a>
				</div>
			</div>
		</div>
		<br>
		<div class="container" >
      <div class="col-md-6 col-sm-6">
      	<div id="googleMap"></div>
				<ul id = "tag" class = "nav">
					<li>
						<asset:image src = "hospital_marker.svg"/> Public Hospital
					</li>
					<li>
						<asset:image src = "private_marker.svg"/> Private Hospital
					</li>
				</ul>
      </div>
			<div class="col-md-6 col-sm-6" id = "list-group" style = "height: 500px; overflow-y: auto;">
				<!-- ADD LIST VIEW CODE HERE -->
			</div>
		</div>
		<script>
			window.onload = function() {
	  var startPos;
	  var geoOptions = {
	    enableHighAccuracy: true
	  }

	  var geoSuccess = function(position) {
	    startPos = position;
	    document.getElementById('startLat').innerHTML = startPos.coords.latitude;
	    document.getElementById('startLon').innerHTML = startPos.coords.longitude;
	  };
	  var geoError = function(error) {
	    console.log('Error occurred. Error code: ' + error.code);
	    // error.code can be:
	    //   0: unknown error
	    //   1: permission denied
	    //   2: position unavailable (error response from location provider)
	    //   3: timed out
	  };

	  navigator.geolocation.getCurrentPosition(geoSuccess, geoError, geoOptions);

	};


		var markers = [];
		var windows = [];
		var mapProp = {
			center:new google.maps.LatLng(22.344044,114.100998),
			zoom:10,
			mapTypeId:google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
		geocoder = new google.maps.Geocoder();

		$(document).ready(function(){

			$('#company_select').prop('disabled', true);
			$('#list-group').css('display', 'none');
			$('#tag').css('display', 'none');
			var isMobile = false;
			if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
			 // some code..
			 isMobile = true;
			}

		var bounds;
		var newURL = window.location.protocol + "//" + window.location.host;



		function locate_hospital(lat, longi,type, hospital, index){
						var pos = new google.maps.LatLng(lat, longi);
						var marker_icon;
						if(type == "1")
						{
							marker_icon = '/assets/hospital_marker.svg'
						}
						else
						{
							marker_icon = '/assets/private_marker.svg'
						}
							//In this case it creates a marker, but you can get the lat and lng from the location.LatLng
							map.setCenter( pos );
							var marker = new google.maps.Marker( {
									map     : map,
									position: pos,
									icon: newURL + marker_icon,
							} );
							markers.push(marker);

							google.maps.event.addListener(marker,'click',function() {
							  map.setZoom(18);
							  map.setCenter(marker.getPosition());
							  });

							bounds.extend(marker.getPosition());
							var infowindow = new google.maps.InfoWindow({
							  content: hospital
							  });
							windows.push(infowindow);
							google.maps.event.addListener(marker,'mouseover',function() {
  							infowindow.open(map,marker);
							var container = $('#list-group'),
    						scrollTo = $('#abc' + index);

							container.scrollTop(
							    scrollTo.offset().top - container.offset().top + container.scrollTop()
							);

							// Or you can animate the scrolling:
							container.animate({
							    scrollTop: scrollTo.offset().top - container.offset().top + container.scrollTop()
							});

							$('#abc' + index).css('background-color','#f5f5f5');
							  });
							  google.maps.event.addListener(marker,'mouseout',function() {
								  infowindow.close();
										$('#abc' + index).css('background-color','');
								});
							map.fitBounds (bounds);

		}



		$('#finder_button').click(function(){
			$('#list-group').css('display', 'block');
			$('#tag').css('display', 'block');
			bounds = new google.maps.LatLngBounds();
			var URL = '${createLink(controller: 'clinic_finder' , action:'find_medic', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ])}';
			for (var i = 0; i < markers.length; i++) {
		    markers[i].setMap(null);
		  }
			  markers = [];
			  windows = [];
			  var locations = [];
						var items = [];
						$.ajax({
							url:URL,
							dataType: "json",
							data: {company: $('#company_select').val(), plan: $('#plan_select').val(), territory: $('#territory_select').val(), district : $('#district_select').val(), purpose : $('#purpose_select').val()},
							success: function(resp){
								if(resp.hospital.length == 0)
									{
										items.push('<div class = "list-group-item" style = "height:400px;">' +
											'<h3 style = "text-align: center;">' + 'No result found.'  + '</h3>'
											+ '</div>'
										)
										$('#list-group').html(items.join(''));
										map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
										return;
									}
								console.log(resp);

								$('#list-group').html(null);


								$.each(resp.hospital, function(i, item) {
									var index = 0;

									for(var j = 0; j < locations.length; j++)
									{

										if(locations[j] == resp.hospital[i].location)
										{
											index = j;
											break;
										}
										else if(j == locations.length - 1)
										{

											locations.push(resp.hospital[i].location);
											locate_hospital(resp.hospital[i].latitude, resp.hospital[i].longitude, resp.hospital[i].type, resp.hospital[i].name, i);
											index = locations.length;
										}
									}
									if(locations.length == 0)
									{
										index = locations.length;
										locations.push(resp.hospital[i].location);
											locate_hospital(resp.hospital[i].latitude, resp.hospital[i].longitude, resp.hospital[i].type, resp.hospital[i].name, i);
									}

									var locate = resp.hospital[i].location.replace(/\s/g, '%20');
									var hospital = resp.hospital[i].name.replace(/\s/g, '%20');
									var hospital_type_image;
									if(resp.hospital[i].type == '1')
									{
										hospital_type_image = '<asset:image src = "hospital_marker.svg"/>';
									}
									else
									{
										hospital_type_image = '<asset:image src = "private_marker.svg"/>';
									}
//									locate = locate.split(',');

									var link = 'https://maps.google.com?daddr='  + locate + '%20' + hospital ;

									if(!isMobile)
									{
											link = 'https://maps.google.com?saddr=Current+Location&daddr='  + locate + '%20' + hospital;
									}
											items.push('<a  class="list-group-item" id = "abc' + i + '" onClick="map_direction(\'' + link + '\')"  onmouseover = "hospital_window(\'' + index + '\',\''  + i +  '\')" onmouseleave = "hospital_window_close(\'' + index + '\',\''  + i +  '\')">'
													+ '<div class = "row">'
													+ '	<div class = "col-md-10">'
													+ '<div class = "row">'
													+ '<div class = "row" id = "heading' + i + '">'
													+ '	<div class = "col-md-12">'
													  + '<h4 class= "list-group-item-heading" >' + resp.hospital[i].name +  '</h4>'
												  + '</div>'

													+	'</div>'
													+ '<div class = "row" id = "location' + i + '">'
													+ '	<div class = "col-md-12">'
												  + resp.hospital[i].location
												  + '</div>'
													+ '</div>'
													+ '	<div class = "col-md-12" id = "direction_label' + i + '">'
													+ '<h4><g:message code = "my.localized.click_location"/></h4>'
													+	'</div>'
													+ '</div>'
													+ '</div>'
													+ '<div >'
													+ '<div id = "hospital_image' + i + '">'
													+ hospital_type_image
													+ '</div>'
													+ '</div>'
													+ '</div>'
													+ '</div>'

													/*
													+	'	<div class = "row">'
													+	'	<div class="col-md-6">'
													+   '<h5 id = "medic_name_mb">' + resp.medic[i].name + '</h5>'
													+	'	</div>'
													+	'	<div class="col-md-6">'
											    + 'Charge'  +   '<div id = "money"> $' + resp.medic[i].charge
													+	'	</div>'
													+	'	</div>'
													+	'	</div>'
													+	'	<div class = "row">'
													+	'	<div class="col-md-6">'
													+	'	</div>'
													+	'	<div class="col-md-6">'
												+ 'Claimed'  +   '<div id = "money"> - $'   + resp.medic[i].claims
													+	'	</div>'
													+	'	</div>'
													+	'	</div>'
													+	'	<div class = "row">'
													+	'	<div class="col-md-6">'
													+   '<h5 id = "medic_name">' +resp.medic[i].name + '</h5>'
													+	'	</div>'
													+	'	<div class="col-md-6" id = "netlabel">'
												+ 'Netpay'  +   '<div id = "netpay"> $' + resp.medic[i].netpay
													+	'	</div>'
													+	'	</div>'
													+	'	</div>'
													+ '</div>'
													*/
													+	'</a>');

											$('#list-group').html(items.join(''));
								});
							}
					});
		});


		var plan = $('#plan_select').text();

		$('#company_select').change(function(){
			if($('#company_select').val() == '')
			{
				$('#plan_select').find('option')
			    .remove()
			    .end()
			    .append('<option value="">' + plan + '</option>')
			    .val('')
				$('#plan_select').prop('selectedIndex', 0);
				return;
			}


		  var URL = '${createLink(controller: 'clinic_finder' , action:'plan_select', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ])}';
			$.ajax({
				url:URL,
				data: {
					company: $('#company_select').val()
				},
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


		var territory = $('#district_select').text();
		$('#territory_select').change(function(){

			if($('#territory_select').val() == '')
			{
				$('#district_select').find('option')
			    .remove()
			    .end()
			    .append('<option value="">' + territory + '</option>')
			    .val('')
				$('#district_select').prop('selectedIndex', 0);
				return;
			}

		var URL = '${createLink(controller: 'clinic_finder' , action:'territory_select', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ])}';
		$('#district_select').prop('disabled', true);
		$('#district_select').css('cursor', 'wait');
		$('#district_select').find('option')
			.remove()
			.end()
			.append('<option value="">' + 'loading...' + '</option>')
			.val('')
		$('#district_select').prop('selectedIndex', 0);
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
			$('#district_select').prop('disabled', false);
			$('#district_select').css('cursor', 'default');
			$('#district_select').html(resp);

		}
		});



		});


		function codeLatLng(lat, lng) {

	    var latlng = new google.maps.LatLng(lat, lng);
	    geocoder.geocode({'latLng': latlng}, function(results, status) {
	      if (status == google.maps.GeocoderStatus.OK) {
	      console.log(results)
	        if (results[1]) {
	         //formatted address
	         alert(results[0].formatted_address)
	        //find country name
	             for (var i=0; i<results[0].address_components.length; i++) {
	            for (var b=0;b<results[0].address_components[i].types.length;b++) {

	            //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
	                if (results[0].address_components[i].types[b] == "administrative_area_level_1") {
	                    //this is the object you are looking for
	                    city= results[0].address_components[i];
	                    break;
	                }
	            }
	        }
	        //city data
	        alert(city.short_name + " " + city.long_name)


	        } else {
	          alert("No results found");
	        }
	      } else {
	        alert("Geocoder failed due to: " + status);
	      }
	    });
	  }

		});
		function zoom_hospital(index){
			map.setZoom(18);
			map.setCenter(markers[index].getPosition());
		}

		function hospital_window(index, i){
			var element = document.getElementById('abc' + i);
			var element_height = element.clientHeight + 2.2222;
			element_height = element_height + 'px';

			var a = document.getElementById('direction_label' + i);
			a.style.display = "block";
			var b = document.getElementById('heading' + i);
			b.style.display = "none";
			var c = document.getElementById('location' + i);
			c.style.display = "none";
			var d = document.getElementById('hospital_image' + i);
			d.style.display = "none";
			element.style.height = element_height;
			windows[index].open(map,markers[index]);

		}

		function hospital_window_close(index,i){
			var element = document.getElementById('abc' + i);
			var a = document.getElementById('direction_label' + i);
			a.style.display = "none";
			var b = document.getElementById('heading' + i);
			b.style.display = "block";
			var c = document.getElementById('location' + i);
			c.style.display = "block";
			var d = document.getElementById('hospital_image' + i);
			d.style.display = "block";
			element.style.height = 'auto';
				windows[index].close();
		}

		function map_direction(link){
			params  = 'width='+screen.width * 0.7;
			params += ', height='+screen.height * 0.8;
			params += ', top=0, left=0'
			params += ', fullscreen=yes';
    	var myWindow = window.open(link , "", params);
		}

		</script>
	</body>
</html>
