var mapElement = document.getElementById('map');
mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

var map = new mapboxgl.Map({
  container: 'map', //Container ID
  style: 'mapbox://styles/mapbox/light-v10', //Map style
  center: [mapElement.dataset.userLng, mapElement.dataset.userLat], //Starting postition
  zoom: 13
});



