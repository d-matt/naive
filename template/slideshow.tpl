{combine_script id='naive.pict_navigation' path='themes/naive/js/pict_navigation.js'}
<div class="titrePage">
  <div class="categoryActions">
    {include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
  </div>
</div>

<div id="image_panel" >
  {$ELEMENT_CONTENT}
</div>

