import flatpickr from "flatpickr";

import "flatpickr/dist/flatpickr.min.css" // Note this is important!

import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatpickr = () => {
  flatpickr('#start_date', {
    altInput: true,
    minDate: 'today',
    plugins: [new rangePlugin({ input: "#end_date"})]
  })
}



export { initFlatpickr }



