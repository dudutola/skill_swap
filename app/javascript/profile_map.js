// app/assets/javascripts/profile_map.js
import mapboxgl from 'mapbox-gl';

document.addEventListener("DOMContentLoaded", function() {
  var latitude = parseFloat(document.getElementById("user-latitude").value);
  var longitude = parseFloat(document.getElementById("user-longitude").value);

  if (latitude && longitude) {
    // Initialize the map and set view to user location (latitude, longitude)
    var map = new mapboxgl.Map({
      container: 'map', // The div with id="map"
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [longitude, latitude], // Longitude, Latitude
      zoom: 5, // You can adjust the zoom level as needed
    });

    // Add a marker to the map
    new mapboxgl.Marker()
      .setLngLat([longitude, latitude])
      .addTo(map);
  } else {
    document.getElementById('map').innerText = "Location not available.";
  }
});
