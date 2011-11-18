jQuery(document).ready(function($){
  //Picture Navigation
  function trigger_link(name) {
    var next_page = $("a[id="+ name +"]").attr("href");
    if (next_page){
        document.location.href = next_page;
    }
  }
  $(document).keydown(function(e) {
      // note : with keypress function, arrow keys won't work with chrome
      // see http://bugs.jquery.com/ticket/7300
      switch(e.keyCode) {
         // s
         case 83: trigger_link("start_stop_slideshow"); break;
         // Left
         case 37: trigger_link("prev_pict"); break;
         // Right
         case 39: trigger_link("next_pict"); break;
         // Home
         case 36: trigger_link('first_pict'); break;
         // End
         case 35: trigger_link('last_pict'); break;
         // Up
         case 38: trigger_link('increase_freq'); break;
         // Down
         case 40: trigger_link('decrease_freq'); break;
         // Pause
         case 32: trigger_link('play_pause'); break;
         // +
         case 107: trigger_link('increase_freq'); break;
         // -
         case 109: trigger_link('decrease_freq'); break;

      }
  });

  //Rearrange navigation buttons
  $("#imageInfoBar .navButtons").hide();

  $("#image_wrapper").css("width", $("#subject").css("width"));
 
  $("#go_to_prev").clone().addClass("arrow").appendTo("#go_to_prev_holder");
  $("#go_to_next").clone().addClass("arrow").appendTo("#go_to_next_holder");

  $(".arrow a").removeClass("button");

  $("#go_to_prev_holder").mouseover(function () {
    $(".arrow", this).show();
  }).mouseout(function () {
    $(".arrow").hide();
  });
  $("#go_to_prev_holder").click(function () {
    trigger_link("prev_pict");
  });
  $("#go_to_next_holder").mouseover(function () {
    $(".arrow", this).show();
  }).mouseout(function () {
    $(".arrow").hide();
  });
  $("#go_to_next_holder").click(function () {
    trigger_link("next_pict");
  });
});
