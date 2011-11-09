jQuery(document).ready(function($){
  //Set the image width and height to fill all the space while preserving ratio
  var h = $(window).height();
  var w = $(window).width();
  var window_ratio = h / w;  

  var img_ratio = $("#image_wrapper img").height() / $("#image_wrapper img").width();
  if ( (w * img_ratio) > h  ) {
    var w = Math.floor( h / img_ratio );
  }
  else { 
    var h = Math.floor( w * img_ratio );
  }

  //Create a container div that will hold the image
  var div_container = $("<div id='fullscreen_image'></div>");
  div_container.css({"text-align": "center", "background-color": "black"}); 
  div_container.append($("#image_wrapper img").css({"width": w, "height": h}));

  //Create a container div that will hold the buttons
  var div_buttons = $("<div id='buttons'></div>");
  div_buttons.css({"position": "fixed", "top": "10px", "right": "10px"});
  //move header to body in order to keep navigation buttons
  div_buttons.append($(".navButtons"));

  //Change background color to black
  $("body").css("background-color", "black");

  //Add the image container to the body
  div_buttons.appendTo("body");
  div_container.appendTo("body");


  //remove all the rest
  $("#the_page").remove();
});

