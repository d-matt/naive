{$MENUBAR}
{* --- Plugins category actions that will be moved to <header> with js --- *}
{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}
<div class="titrePage">
  <ul class="categoryActions">
    {if !empty($PLUGIN_INDEX_BUTTONS)}{foreach from=$PLUGIN_INDEX_BUTTONS item=button}<li>{$button}</li>{/foreach}{/if}
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

{include file='infos_errors.tpl'}

<div id="content" class="two_col">
  {if !empty($PLUGIN_INDEX_CONTENT_BEGIN)}{$PLUGIN_INDEX_CONTENT_BEGIN}{/if}

{if !empty($no_search_results)}
<p class="search_results">{'No results for'|@translate} :
	<em><strong>
	{foreach $no_search_results as $res}
	{if !$res@first} &mdash; {/if}
	{$res}
	{/foreach}
	</strong></em>
</p>
{/if}

{if !empty($category_search_results)}
<p class="search_results">{'Album results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
	<em><strong>
	{foreach from=$category_search_results item=res name=res_loop}
	{if !$smarty.foreach.res_loop.first} &mdash; {/if}
	{$res}
	{/foreach}
	</strong></em>
</p>
{/if}

{if !empty($tag_search_results)}
<p class="search_results">{'Tag results for'|@translate} <strong>{$QUERY_SEARCH}</strong> :
	<em><strong>
	{foreach from=$tag_search_results item=tag name=res_loop}
	{if !$smarty.foreach.res_loop.first} &mdash; {/if} <a href="{$tag.URL}">{$tag.name}</a>
	{/foreach}
	</strong></em>
</p>
{/if}

  {* ---> Calendar view ---*}
  {if isset($FILE_CHRONOLOGY_VIEW)}
    {include file=$FILE_CHRONOLOGY_VIEW}
  {/if}
  {* <--- Calendar view *}

  {if !empty($CONTENT_DESCRIPTION)}
  <div class="additional_info">
        {$CONTENT_DESCRIPTION}
  </div>
  {/if}

  {if !empty($CATEGORIES)}{$CATEGORIES}{/if}

  {if !empty($cats_navbar)}
    {include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$cats_navbar}
  {/if}


  {if !empty($THUMBNAILS)}
  <ul id="thumbnails" class="thumbnails">
    {$THUMBNAILS}
  </ul>
  {/if}
  <div class="clear center">
    {if !empty($thumb_navbar)}
      {include file='navigation_bar.tpl'|@get_extent:'navbar' navbar=$thumb_navbar}
    {/if}
  </div>
  {if !empty($PLUGIN_INDEX_CONTENT_END)}{$PLUGIN_INDEX_CONTENT_END}{/if}
</div>
{if !empty($PLUGIN_INDEX_CONTENT_AFTER)}{$PLUGIN_INDEX_CONTENT_AFTER}{/if}
