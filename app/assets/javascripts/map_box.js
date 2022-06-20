var mapElement = document.getElementById("map");
if (mapElement != null) {
	mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

	var map = new mapboxgl.Map({
		container: "map", //Container ID
		style: "mapbox://styles/mapbox/dark-v10", //Map style
		center: [mapElement.dataset.userLng, mapElement.dataset.userLat], //Starting postition
		zoom: 13,
	});

	var markers = JSON.parse(mapElement.dataset.markers);

	for (const marker of markers) {
		const popup = new mapboxgl.Popup({ offset: 25 }).setHTML(
			"<div>" + "<h2>" + marker.name + "</h2>" + "</div>"
		);
		const el = document.createElement("div");
		el.className = "marker";
		new mapboxgl.Marker(el)
			.setLngLat([marker.lng, marker.lat])
			.setPopup(popup)
			.addTo(map);
	}
}

var mapElementEvent = document.getElementById("map-event");
if (mapElementEvent != null) {
mapboxgl.accessToken = mapElementEvent.dataset.mapboxApiKey;

var map = new mapboxgl.Map({
	container: "map-event", //Container ID
	style: "mapbox://styles/mapbox/dark-v10", //Map style
	center: [mapElementEvent.dataset.eventLng, mapElementEvent.dataset.eventLat], //Starting postition
	zoom: 15,
});

const el = document.createElement("div");
el.className = "marker";
new mapboxgl.Marker(el)
	.setLngLat([mapElementEvent.dataset.eventLng, mapElementEvent.dataset.eventLat])
	.addTo(map);
}
