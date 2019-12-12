import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

$("#calendar").flatpickr({
    mode: 'range',
    dateFormat: "Y-m-d"
});

document.addEventListener('DOMContentLoaded', function() {
  flatpickr('#calendar');
})
