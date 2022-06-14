var mapElement = document.getElementById('map');
mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

var map = new mapboxgl.Map({
  container: 'map', //Container ID
  style: 'mapbox://styles/mapbox/light-v10', //Map style
  center: [2.2374527, 48.9141275], //Starting postition
  zoom: 13
});


var markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
  const el = document.createElement('div');
  el.className = 'marker';
    new mapboxgl.Marker(el)
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
