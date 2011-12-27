(function($) {
  // This is a very basic plugin to maximize an image to fit the browser's size.
  // Apply this plugin on the image element you want to maximize.
  //
  // kown bug : approximations on the computed height and weight tends to spread 
  // and become obvious with multiple resize !
  $.fn.maximize = function(){
    var img = $(this);		
 
    function resizeImg() {
      var h = $(window).height();
      var w = $(window).width();

      var window_ratio = h / w;
      var img_ratio = img.height() / img.width();

      if ( (w * img_ratio) > h  ) {
        w =  Math.floor( h / img_ratio );
      }
      else {
        h = Math.floor( w * img_ratio );
      }

      var margin_top =  Math.floor( ($(window).height() - h ) /2 ); 
  
      img.css({
        "width": w+'px',
        "height": h+'px',
        "margin-top": margin_top+"px"
      });
    } 
    resizeImg();
    $(window).resize(function() {
      resizeImg();
    }); 
  return this;
  };
})(jQuery);
