$(document).ready(function() {

  if(!navigator.geolocation) return;
  
  navigator.geolocation.getCurrentPosition(function(pos) {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(pos.coords.latitude,pos.coords.longitude);
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        //Check result 0
        var result = results[0];
        //look for locality tag and administrative_area_level_1
        var city = "";
        var state = "";
        for(var i=0, len=result.address_components.length; i<len; i++) {
          var ac = result.address_components[i];
          if(ac.types.indexOf("locality") >= 0) city = ac.long_name;
          if(ac.types.indexOf("administrative_area_level_1") >= 0) state = ac.long_name;
        }
        //only report if we got Good Stuff
        if(city != '' && state != '') {
          var location = {
            city: city,
            state: state
          }
          $.post('/geolocator', location)
            .then(function(feed) {
              console.log(feed);
            })
            .fail(function(message) {
              console.error(message);
            }) 
        }
      } 
    });
  
  });

})
