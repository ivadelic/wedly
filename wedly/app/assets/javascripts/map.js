function Map(mapElem) {
  this.mapElem = mapElem;
  this.markers = [];
};

Map.prototype.init = function(latitude, longitude) {
  var mapOptions = {
    center: new google.maps.LatLng(latitude, longitude),
    zoom: 15,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  this.canvas = new google.maps.Map(this.mapElem, mapOptions);
};

Map.prototype.addMarker = function(latitude, longitude, markerImage) {
  var mapOptions = {
    position: {latitude, longitude},
    map: this.canvas
  }

  if (markerImage) {
    mapOptions.icon = markerImage;
  }

  var myMarker = new google.maps.Marker(mapOptions);
  this.markers.push(myMarker);
};


$(document).on('ready page:load', function() {
  if ($('#map-canvas').length) {
    var latitude = $('#map-canvas').data(latitude);
    var longitude = $('#map-canvas').data(longitude);

    window.myMap = new Map($('#map-canvas')[0]);
    myMap.init(latitude, longitude);
    myMap.addMarker(latitude, longitude);
  }
});