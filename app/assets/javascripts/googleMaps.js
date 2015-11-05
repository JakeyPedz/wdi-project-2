var jake_style = [
{
  "featureType": "administrative",
  "elementType": "labels.text.fill",
  "stylers": [
  {
    "color": "#444444"
  }
  ]
},
{
  "featureType": "landscape",
  "elementType": "all",
  "stylers": [
  {
    "color": "#f2f2f2"
  }
  ]
},
{
  "featureType": "poi",
  "elementType": "all",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
},
{
  "featureType": "road",
  "elementType": "all",
  "stylers": [
  {
    "saturation": -100
  },
  {
    "lightness": 45
  }
  ]
},
{
  "featureType": "road.highway",
  "elementType": "all",
  "stylers": [
  {
    "visibility": "simplified"
  }
  ]
},
{
  "featureType": "road.arterial",
  "elementType": "labels.icon",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
},
{
  "featureType": "transit",
  "elementType": "all",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
},
{
  "featureType": "water",
  "elementType": "all",
  "stylers": [
  {
    "color": "#46bcec"
  },
  {
    "visibility": "on"
  }
  ]
}
]

var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('mapIndex'), {
    center: {lat: 0, lng: 0},
    zoom: 1,
    styles: jake_style
  });
}