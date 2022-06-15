var mapElement = document.getElementById('map');
if (typeof mapElement != "undefined") {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;


