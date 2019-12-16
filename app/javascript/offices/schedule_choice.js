import $ from 'jquery';

const schedule = () => {
  $(document).ready(function(){
    $(".schedule-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
  console.log("Is this working?")
};

export { schedule };
