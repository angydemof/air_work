import flatpickr from "flatpickr";

import "flatpickr/dist/flatpickr.min.css" // Note this is important!

import rangePlugin from "flatpickr/dist/plugins/rangePlugin"



const initFlatpickr = () => {

  const weekdays = {
    "1": "Monday",
    "2": "Tuesday",
    "3": "Wednesday",
    "4": "Thursday",
    "5": "Friday",
    "6": "Saturday",
    "7": "Sunday"
  }

  flatpickr('#start_date', {
    mode: 'range',
    minDate: 'today',
    disable: [
      function(date) {
        if (document.querySelector('.unavailable-dates')) {
          const unavailableDates = JSON.parse(document.querySelector('.unavailable-dates').dataset.unavailable);
          return unavailableDates.includes(weekdays[date.getDay()]);
        }
        return false;
      }
    ],
    dateFormat: "d/m/Y",
    plugins: [new rangePlugin({ input: "#end_date"})]
  })

}


export { initFlatpickr }


