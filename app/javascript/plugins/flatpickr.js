import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin.js"


['0', '1', '2'].forEach((i) => {
  flatpickr(`.datepicker-${i}`, {
    mode: 'range',
    plugins: [new rangePlugin({ input: `.end-date-${i}`})],
    altInput: true,
    minDate: "today",
    dateFormat: "Y-m-d"
  })
});
