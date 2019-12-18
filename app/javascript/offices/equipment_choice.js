import $ from 'jquery';

const equipment = () => {
  $(document).ready(function(){
    $(".equipment-choice").click(function(){
      $(this).toggleClass("active");
    });
  });
};

export { equipment };

