var mapElement = document.getElementById('map');
if (typeof mapElement != "undefined") {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

  var map = new mapboxgl.Map({
    container: 'map', //Container ID
    style: 'mapbox://styles/mapbox/light-v10', //Map style
    center: [mapElement.dataset.userLng, mapElement.dataset.userLat], //Starting postition
    zoom: 13
  });
  
  var markers = JSON.parse(mapElement.dataset.markers);
  
  for (const marker of markers){
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
  };

}
