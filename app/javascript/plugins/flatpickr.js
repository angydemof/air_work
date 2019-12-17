import flatpickr from "flatpickr";

import "flatpickr/dist/flatpickr.min.css" // Note this is important!

import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatpickr = () => {
  console.log("hiiiii");
  flatpickr('#start_date', {
    mode: 'range',
    minDate: 'today',
    dateFormat: "d/m/Y",
    plugins: [new rangePlugin({ input: "#end_date"})]
  })
}



export { initFlatpickr }



