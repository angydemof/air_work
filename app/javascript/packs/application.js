import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';

import { initFlatpickr } from '../plugins/flatpickr';
import { schedule } from '../offices/schedule_choice';
import { initAutocomplete } from '../plugins/init_autocomplete';

initMapbox();
initFlatpickr();
schedule();
initAutocomplete();
