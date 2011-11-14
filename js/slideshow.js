jQuery(document).ready(function($){
  //Create a container div that will hold the image and the nav buttons
  var slideshow = $("<div id='slideshow_wrapper'></div>");
  $(".navButtons a").addClass("button");
  slideshow.append($(".navButtons").addClass("slideshow_buttons"));
  slideshow.append($("#subject"));
  
  //Change the body's  style (e.g. background set to black) 
  $("body").addClass("slideshow_body");

  //Add the slideshow container to the body
  slideshow.appendTo("body");

  //remove all the rest
  $("#the_page").remove();

  //and finally, maximize the picture to fit the window
  $('#subject').maximize();
});

