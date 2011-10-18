{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" class="two_col">
  <div class="titrePage">
    <h2><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a> / {'User comments'|@translate}</h2>
  </div>

  <form class="filter" action="{$F_ACTION}" method="get">
    <fieldset>
      <legend>{'Filter'|@translate}</legend>
      <label>{'Keyword'|@translate}</label>
      <input type="text" name="keyword" value="{$F_KEYWORD}">
      <label>{'Author'|@translate}</label>
      <input type="text" name="author" value="{$F_AUTHOR}">
      <label>{'Album'|@translate}</label>
      <select name="cat">
        <option value="0">------------</option>
        {html_options options=$categories selected=$categories_selected}
      </select>
      <label>{'Since'|@translate}</label>
      <select name="since">
        {html_options options=$since_options selected=$since_options_selected}
      </select>
    </fieldset>

    <fieldset>
      <legend>{'Display'|@translate}</legend>
      <label>{'Sort by'|@translate}</label>
      <select name="sort_by">
        {html_options options=$sort_by_options selected=$sort_by_options_selected}
      </select>
      <label>{'Sort order'|@translate}</label>
      <select name="sort_order">
        {html_options options=$sort_order_options selected=$sort_order_options_selected}
      </select>
      <label>{'Number of items'|@translate}</label>
      <select name="items_number">
        {html_options options=$item_number_options selected=$item_number_options_selected}
      </select>
    </fieldset>

    <p>
      <input class="submit" type="submit" value="{'Filter and display'|@translate}">
    </p>
  </form>

  {if !empty($navbar) }{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}

  {if isset($comments)}
  <div id="comments">
    {include file='comment_list.tpl'}
  </div>
  {/if}
  <div class="clear"></div>
</div> <!-- content -->
