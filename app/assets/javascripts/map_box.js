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
