{$MENUBAR}
{* --- Plugins category actions that will be moved to <header> with js --- *}
{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}
<div class="titrePage">
  <ul class="categoryActions">
    {if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
    {if isset($chronology_views)}
    <li>
      <div class="calendarViews">{'View'|@translate}:
        <select onchange="document.location = this.options[this.selectedIndex].value;">
        {foreach from=$chronology_views item=view}
          <option value="{$view.VALUE}"{if $view.SELECTED} selected="selected"{/if}>{$view.CONTENT}</option>
        {/foreach}
        </select>
      </div>
    </li>
  {/if}
  </ul>
</div>
{* --- *}

<div id="content" class="two_col">
  {if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}
  {* ---> Calendar view ---*}
  {if isset($FILE_CHRONOLOGY_VIEW)}
    {include file=$FILE_CHRONOLOGY_VIEW}
  {/if}
  {* <--- Calendar view *}

  {if !empty($CATEGORIES)}{$CATEGORIES}{/if}
  {if !empty($THUMBNAILS)}
    {$THUMBNAILS}
  {/if}
  <div class="clear center">
    {if !empty($navbar)}{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}
  </div>
  {if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}
</div>
{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
