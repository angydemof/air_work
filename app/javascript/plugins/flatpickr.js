import flatpickr from "flatpickr";

import "flatpickr/dist/flatpickr.min.css" // Note this is important!

import rangePlugin from "flatpickr/dist/plugins/rangePlugin"



const initFlatpickr = () => {

  flatpickr('#start_date', {
    mode: 'range',
    minDate: 'today',
    dateFormat: "d/m/Y",
    plugins: [new rangePlugin({ input: "#end_date"})]
  })

  if (document.querySelector('.unavailable-dates')) {
    const unavailableDates = JSON.parse(document.querySelector('.unavailable-dates').dataset.unavailable);
    console.log(unavailableDates);
     flatpickr("#datepicker", {
      mode: 'range',
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "Y-m-d"
  });
}
}


export { initFlatpickr }



