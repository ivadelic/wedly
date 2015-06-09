function Map(mapElem) {
  this.mapElem = mapElem;
  this.markers = [];
}

Map.prototype.init = function(latitude, longitude){
  var options = {
    center: {lat: latitude, lng: longitude},//new google.maps.LatLng(latitude, longitude),
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  this.canvas = new google.maps.Map(this.mapElem, options);
}

Map.prototype.addMarker = function(latitude, longitude, markerImage, content) {
  var options = {
    position: {lat: latitude, lng: longitude},
    map: this.canvas,
    title: "Meet your marker"
  }

  if (markerImage) {
    options.icon = markerImage;
  }

  var myMarker = new google.maps.Marker(options);

  var info = new google.maps.InfoWindow({
    content: content
  })

  google.maps.event.addListener(myMarker, 'click', function(){
    info.open(options.map, myMarker)
  })

  this.markers.push(myMarker);
}

Map.prototype.removeMarker = function(marker) {
  marker.setMap(null);

  var index = this.markers.indexOf(marker);
  this.markers.splice(index, 1);
}

$(document).on('ready page:load', function() {
  if ($('#map-canvas').length) {
    var latitude = $('#map-canvas').data('latitude');
    var longitude = $('#map-canvas').data('longitude');
    var customImage = "http://maps.google.com/mapfiles/ms/icons/yellow-dot.png";

    window.myMap = new Map($('#map-canvas')[0]);
    myMap.init(latitude, longitude);
    myMap.addMarker(latitude, longitude);

    // $.getJSON("/weddings/1/events/4/nearbys", function(json) {
    //   json.forEach(function(coord) {
    //     myMap.addMarker(parseFloat(coord.latitude), parseFloat(coord.longitude), customImage);
    //   })
    // })

    if (window.nearbys) {
      nearbys.forEach(function(coord) {
        myMap.addMarker(parseFloat(coord.latitude), parseFloat(coord.longitude), customImage, content);
      })
    }
    // else {
    //   alert("NO NEARBYSSSSS")
    // }
  }


});