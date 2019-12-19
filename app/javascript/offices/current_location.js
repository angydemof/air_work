import mapboxgl from 'mapbox-gl';

const currentLocation = () => {

  const onSelect = document.getElementById('current-location');

  onSelect.addEventListener('click', (event) => {
    var options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    function success(pos) {
      var crd = pos.coords;
      console.log('Your current position is:');

      console.log(`Latitude : ${crd.latitude}`);
      console.log(`Longitude: ${crd.longitude}`);
      console.log(`More or less ${crd.accuracy} meters.`);

      const results = Geocoder.search([48.856614, 2.3522219])
      console.log(`Address : ${results.first.address}`);

    }

    function error(err) {
      console.warn(`ERROR(${err.code}): ${err.message}`);
    }
    navigator.geolocation.getCurrentPosition(success, error, options);
  });

}



export { currentLocation }
