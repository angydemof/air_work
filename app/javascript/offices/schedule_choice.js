import $ from 'jquery';

const schedule = () => {
  $(document).ready(function(){
    $(".schedule-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
};

export { schedule };
