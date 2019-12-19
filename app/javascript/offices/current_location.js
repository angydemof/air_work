import mapboxgl from 'mapbox-gl';

const currentLocation = () => {

  const onSelect = document.getElementById('ask-location');
  var form = document.querySelector('form');

  if (onSelect) {

    onSelect.addEventListener('click', (event) => {
    var options = {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    };

    function success(pos) {
      var crd = pos.coords;
      console.log('Your current position is:');

      //console.log(`Latitude : ${crd.latitude}`);
      //console.log(`Longitude: ${crd.longitude}`);
      //console.log(`More or less ${crd.accuracy} meters.`);

      const currentLocation = document.getElementById('current_location');
      currentLocation.value = `${crd.latitude} ${crd.longitude}`;
      const searchBar = document.getElementById('office_address');
      searchBar.value = "Your current location"
      Rails.fire(form, 'submit');
    }

    function error(err) {
        console.warn(`ERROR(${err.code}): ${err.message}`);
      }
      navigator.geolocation.getCurrentPosition(success, error, options);
    });
  }
}



export { currentLocation }
