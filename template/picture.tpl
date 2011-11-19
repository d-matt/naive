{combine_script id='naive.pict_navigation' path='themes/naive/js/pict_navigation.js'}
{combine_script id='rating' path='themes/default/js/rating.js'}
{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}
<aside id="imageInfoBar">
  {include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
  <div id="randomButtons">
    <ul>
      {if isset($U_SLIDESHOW_START) }
      <li><a id="start_stop_slideshow" href="{$U_SLIDESHOW_START}" title="{'slideshow'|@translate}" rel="nofollow">{'slideshow'|@translate}</a></li>
      {/if}
      {if isset($U_METADATA)}
      <li>
        <a href="{$U_METADATA}">
        {if isset($metadata)}
        {'Hide file metadata'|@translate}
        {else}
        {'Show file metadata'|@translate}
        {/if}
        </a>
      </li>
      {/if}
      {if isset($current.U_DOWNLOAD) }
      <li><a href="{$current.U_DOWNLOAD}" title="{'download this file'|@translate}">{'download'|@translate}</a></li>
      {/if}
      {if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
      {if isset($favorite) }
      <li><a href="{$favorite.U_FAVORITE}">{if $favorite.IS_FAVORITE}{'delete this photo from your favorites'|@translate}{else}{'add this photo to your favorites'|@translate}{/if}</a></li>
      {/if}
      {if !empty($U_SET_AS_REPRESENTATIVE) }
      <li><a href="{$U_SET_AS_REPRESENTATIVE}" title="{'set as album representative'|@translate}">{'representative'|@translate}</a></li>
      {/if}
      {if isset($U_ADMIN) }
      <li><a href="{$U_ADMIN}" title="{'Modify information'|@translate}">{'Modify information'|@translate}</a></li>
      {/if}
    </ul>
  </div>
  <div id="imageInfos">
    <dl>
    {if $display_info.author and isset($INFO_AUTHOR)}
      <dt>{'Author'|@translate}</dt>
      <dd>{$INFO_AUTHOR}</dd>
      {/if}
      {if $display_info.created_on and isset($INFO_CREATION_DATE)}
      <dt>{'Created on'|@translate}</dt>
      <dd>{$INFO_CREATION_DATE}</dd>
      {/if}
      {if $display_info.posted_on}
      <dt>{'Posted on'|@translate}</dt>
      <dd>{$INFO_POSTED_DATE}</dd>
      {/if}
      {if $display_info.tags and isset($related_tags)}
      <dt>{'Tags'|@translate}</dt>
      <dd id="Tags">
        {foreach from=$related_tags item=tag name=tag_loop}
        {if !$smarty.foreach.tag_loop.first}, {/if}
        <a href="{$tag.URL}">{$tag.name}</a>
        {/foreach}
      </dd>
      {/if}
      {if $display_info.categories and isset($related_categories)}
      <dt>{'Albums'|@translate}</dt>
      <dd>
        {foreach from=$related_categories item=cat name=tag_loop}
        {if !$smarty.foreach.tag_loop.first}, {/if}
        {'&nbsp;'|@str_ireplace:'&#32;':$cat}{/foreach}
      </dd>
      {/if}
      {if $display_info.visits}
      <dt>{'Visits'|@translate}</dt>
      <dd>{$INFO_VISITS}</dd>
      {/if}
      {if $display_info.rating_score and isset($rate_summary)}
      {if isset($rate_summary)}
      <dt>{'Average rate'|@translate}</dt>
      <dd id="ratingSummary">
        {if $rate_summary.count}
        {assign var='rate_text' value='%.2f (rated %d times)'|@translate }
        {$pwg->sprintf($rate_text, $rate_summary.average, $rate_summary.count) }
        {else}
        {'no rate'|@translate}
        {/if}
      </dd>
      {/if}
      {if isset($rating)}
      <dt><span id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</span></dt>
      <dd>
        <form action="{$rating.F_ACTION}" method="post" id="rateForm">
          <div>&nbsp;
            {foreach from=$rating.marks item=mark name=rate_loop}
            {if !$smarty.foreach.rate_loop.first} | {/if}
            {if isset($rating.USER_RATE) && $mark==$rating.USER_RATE}
            <input type="button" name="rate" value="{$mark}" class="rateButtonSelected" title="{$mark}" />
            {else}
            <input type="submit" name="rate" value="{$mark}" class="rateButton" title="{$mark}" />
            {/if}
            {/foreach}
            <script type="text/javascript">
              makeNiceRatingForm( {ldelim}rootUrl: '{$ROOT_URL|@escape:"javascript"}',
              image_id: {$current.id},
              updateRateText: "{'Update your rating'|@translate|@escape:'javascript'}",
              updateRateElement: document.getElementById("updateRate"),
              ratingSummaryText: "{'%.2f (rated %d times)'|@translate|@escape:'javascript'}",
              ratingSummaryElement: document.getElementById("ratingSummary") {rdelim} );
            </script>
          </div>
        </form>
      </dd>
      {/if}
      {/if}
    </dl>
  </div> 
  {if isset($metadata)}
  <div id="imageMeta">
    {foreach from=$metadata item=meta}
    <h3>{$meta.TITLE}</h3>
    <dl>
      {foreach from=$meta.lines item=value key=label}
      <dt>{$label}</dt>
      <dd>{$value}</dd>
      {/foreach}
    </dl>
    {/foreach}
  </div> <!-- imageMeta -->
  {/if}
</aside>
<div id="toggle_info_bar" role="button" class="hidden">&raquo;</div>
<div id="image_panel" class="two_col">
  {$ELEMENT_CONTENT}
  {if isset($comments) OR isset($comment_add)}
  <div id="toggle_comments" role="button">
    <h3><span class="hidden rot-90 toggle_button">&laquo;</span>{'Comments'|@translate}
    {if $COMMENT_COUNT > 0}
      ({$COMMENT_COUNT})
    {/if}
    </h3>
  </div>
  <div id="comments">
    {if isset($comments)}
      {include file='comment_list.tpl'}
    {/if}

    {if isset($comment_add)}
    <form method="post" action="{$comment_add.F_ACTION}" class="filter" id="addComment">
      <fieldset>
        <legend>{'Add a comment'|@translate}</legend>
      {if $comment_add.SHOW_AUTHOR}
        <label>{'Author'|@translate}</label>
        <input type="text" name="author">
      {/if}
        <textarea name="content" id="contentid">{$comment_add.CONTENT}</textarea>
        <input type="hidden" name="key" value="{$comment_add.KEY}">
        <button class="submit icon check" type="submit">{'Submit'|@translate}</button>
      </fieldset>
    </form>
    {/if}
  </div>
{/if}{*comments*}
</div>
{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}
