import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    placeholder: "Select cities"
});
  $('.departure').select2({
    placeholder: "Departure city"
});
  $('.nationality').select2({
    placeholder: "Nationality"
});
};

export { initSelect2 };
