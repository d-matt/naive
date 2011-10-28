{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content">
  <div class="titrePage">
    <h2><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a> / {'About'|@translate}</h2>
  </div>
  <div id="piwigoAbout">
  {$ABOUT_MESSAGE}
  {if isset($THEME_ABOUT) }
  {$THEME_ABOUT}
  {/if}
  </div>
  <div class="clear"></div>
</div>
