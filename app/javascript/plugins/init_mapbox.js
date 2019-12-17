import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const showReview = document.querySelector('.show-review');

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {

     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      if (showReview) {

      map.on('load', function () {
        map.addSource('markers', {
          "type": "geojson",
          "data": {
            "type": "FeatureCollection",
            "features": [{
              "type": "Feature",
              "geometry": {
                "type": "Point",
                "coordinates": [marker.lng, marker.lat]
              },
              "properties": {
                "modelId": 1,
              },
            }]
          }
        });
        map.addLayer({
          "id": "circles1",
          "source": "markers",
          "type": "circle",
          "paint": {
            "circle-radius": {
              'base': 1.75,
              'stops': [
              [4, 45],
              [22, 2400]
              ]
            },
            "circle-color": "#11BF98",
            "circle-opacity": 0.3,
            "circle-stroke-width": 0,
          }
        });

      });
      }
      else {


      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);

      }


    });

    fitMapToMarkers(map, markers);


  }





};

export { initMapbox };
