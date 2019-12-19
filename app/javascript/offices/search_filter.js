const applyFilter = () => {

  var searchFilters = document.querySelectorAll(".search-filter");

  var form = document.querySelector('form');

  console.log(form);

  for (const filter of searchFilters) {

    filter.addEventListener( 'change', function() {
      Rails.fire(form, 'submit');
    });
  }
}

export { applyFilter }
