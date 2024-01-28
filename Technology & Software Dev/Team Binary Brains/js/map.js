// Initialize the map and set its view to a default location
var map = L.map('map').setView([51.505, -0.09], 13);

// Add a tile layer to the map using OpenStreetMap tiles
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  maxZoom: 19,
  attribution: '© OpenStreetMap contributors'
}).addTo(map);

// FeatureGroup is to store editable layers
var drawnItems = new L.FeatureGroup();
map.addLayer(drawnItems);

// Initialize the Leaflet draw control and pass it the FeatureGroup of editable layers
var drawControl = new L.Control.Draw({
  edit: {
    featureGroup: drawnItems
  }
});
map.addControl(drawControl);

// Initialize the geocoder
var geocoder = L.Control.geocoder({
  defaultMarkGeocode: false,
  position: 'topleft'
}).on('markgeocode', function(e) {
  var bbox = e.geocode.bbox;
  var poly = L.polygon([
    bbox.getSouthEast(),
    bbox.getNorthEast(),
    bbox.getNorthWest(),
    bbox.getSouthWest()
  ]).addTo(map);
  map.fitBounds(poly.getBounds());
}).addTo(map);

// Set up a listener for draw events to store the created shapes
map.on(L.Draw.Event.CREATED, function (event) {
  var layer = event.layer;
  drawnItems.addLayer(layer);
});

// Function to get the coordinates of a city from its name
function getCoordinates(cityName) {
  return fetch('https://nominatim.openstreetmap.org/search?format=json&q=' + cityName)
    .then(response => response.json())
    .then(data => {
      if (data && data.length > 0) {
        var details = data[0];
        return L.latLng(details.lat, details.lon);
      } else {
        return null;
      }
    });
}

function getCoordinates(cityName) {
    return fetch('https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURI(cityName))
      .then(response => response.json())
      .then(data => {
        if (data && data.length > 0) {
          var details = data[0];
          return L.latLng(details.lat, details.lon);
        } else {
          return null;
        }
      })
      .catch(error => console.error('Error fetching coordinates:', error));
  }
// Function to calculate and alert the Distance between two entered city names
function calculateDistance() {
  var city1 = document.getElementById('city1').value;
  var city2 = document.getElementById('city2').value;

  Promise.all([getCoordinates(city1), getCoordinates(city2)]).then(function(results) {
    var latlng1 = results[0];
    var latlng2 = results[1];

    if(latlng1 && latlng2) {
      var distance = latlng1.distanceTo(latlng2);
      alert('Distance between ' + city1 + ' and ' + city2 + ' is: ' + (distance / 1000).toFixed(2) + ' km');
    } else {
      alert('Could not find one of the cities.');
    }
  });
}
Distance