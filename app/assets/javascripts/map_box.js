var mapElement = document.getElementById('map');
mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

var map = new mapboxgl.Map({
  container: 'map', //Container ID
  style: 'mapbox://styles/mapbox/light-v10', //Map style
  center: [mapElement.dataset.userLng, mapElement.dataset.userLat], //Starting postition
  zoom: 13
});


var markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach(function(marker){
  let div_el = document.createElement('div');
  div_el.className = 'marker';
    new mapboxgl.Marker(div_el)
    .setLngLat([marker.lng,marker.lat])
    .setPopup(new mapboxgl.Popup({offset:25})
      .setHTML(
        "<div>" + 
          "<h1>" + marker.name + "</h1>" +
          "<h3> ID:" + marker.user_id + "</h3>" +
        "</div>"
      ))
      .addTo(map);
  });
