import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

import { initFlatpickr } from '../plugins/flatpickr';
import { schedule } from '../offices/schedule_choice';
import { currentLocation } from '../offices/current_location';
import { applyFilter } from '../offices/search_filter';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { equipment } from '../offices/equipment_choice';
import { previewImageOnFileSelect } from '../components/photo_preview';
import { initSweetalert } from '../plugins/init_sweetalert';

initSweetalert('#sweet-alert-demo', {
  title: "Delete",
  text: "Are you sure you wish to delete?",
  icon: "warning",
}, (value) => {
  if (value) {
    const link = document.querySelector('#delete-link');
    const card = document.querySelector(".card-dashboard")

    card.addEventListener('click', (event) => {
      event.preventDefault();
      console.log("card");
    })

    console.log(link);
    link.click();
  }
});


initMapbox();
initFlatpickr();
schedule();
initAutocomplete();
applyFilter();
equipment();
currentLocation();
previewImageOnFileSelect();

