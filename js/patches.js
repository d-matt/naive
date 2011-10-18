jQuery(document).ready(function($){
  //Trick piwigo as tags page does not present a TITLE
//  $("header").prepend($(".titrePage").html());
//  $(".titrePage").remove();
    $(".titrePage h2").contents().appendTo("header h2");
    $(".titrePage .categoryActions").contents().appendTo("header .categoryActions");
    $(".titrePage").remove();

  //Move header notes as notifications in the content
  $(".header_notes").prependTo("#content").addClass("notice").show();

  //Move error from header ro content 
  $(".error").prependTo("#content");
  $(".notice").prependTo("#content");

  //Trick to expand content id on page without menubar (until piwigo 2.3)
  //if ( ! $("#menubar").length ) {
  //  $("#content").css("margin-left", "0");
  //}

  //Trick to expand image_panel id on diaporamas
  if ( ! $("#imageInfoBar").length ) {
    $("#image_panel").css("margin-right", "0");
  }
});
