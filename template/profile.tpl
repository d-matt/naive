{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" class="two_col">
  <div class="titrePage">
    <h2><a href="{$U_HOME}">{'Home'|@translate}</a> / {'Profile'|@translate}</h2>
  </div>

  {include file='infos_errors.tpl'}

  {$PROFILE_CONTENT}
</div> <!-- content -->
