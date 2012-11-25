{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" class="two_col">
  <div class="titrePage">
    <ul class="categoryActions">
    {combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
      <li><a href="{$U_HELP}" onclick="popuphelp(this.href); return false;" title="{'Help'|@translate}" class="pwg-state-default pwg-button">
        <span class="pwg-icon pwg-icon-help">&nbsp;</span><span class="pwg-button-text">{'Help'|@translate}</span>
      </a></li>
    </ul>
    <h2><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a> / {'Search'|@translate}</h2>
  </div>

  {include file='infos_errors.tpl'}

  <form class="filter" method="post" id="search_form" name="search" action="{$F_SEARCH_ACTION}">
    <fieldset>
      <legend>{'Filter'|@translate}</legend>
      <p>
        <label>{'Search for words'|@translate}</label>
        <input type="text" style="width: 300px" name="search_allwords" size="30">
        <br/>
        <label>
            <input type="radio" name="mode" value="AND" checked="checked">{'Search for all terms'|@translate}
        </label>
        <label>
          <input type="radio" name="mode" value="OR">{'Search for any terms'|@translate}
        </label>
      </p>
      <p>
        <label>{'Search for Author'|@translate}</label>
        <input type="text" style="width: 300px" name="search_author" size="30">
      </p>
    </fieldset>

    {if isset($TAG_SELECTION)}
    <fieldset>
      <legend>{'Search tags'|@translate}</legend>
      {$TAG_SELECTION}
      <label>
        <input type="radio" name="tag_mode" value="AND" checked="checked"> {'All tags'|@translate}
      </label>
      <label>
        <input type="radio" name="tag_mode" value="OR"> {'Any tag'|@translate}
      </label>
    </fieldset>
    {/if}

    <fieldset>
      <legend>{'Search by Date'|@translate}</legend>
        <p>
          <label>
            {'Date'|@translate} <span class="small">(<a class="date_today" href="#" onClick="document.search.start_day.value={$smarty.now|date_format:"%d"};document.search.start_month.value={$smarty.now|date_format:"%m"};document.search.start_year.value={$smarty.now|date_format:"%Y"};return false;">{'today'|@translate}</a>)</span>
          </label>
          <select id="start_day" name="start_day">
            <option value="0">--</option>
            {section name=day start=1 loop=32}
            <option value="{$smarty.section.day.index}" {if $smarty.section.day.index==$START_DAY_SELECTED}selected="selected"{/if}>{$smarty.section.day.index}</option>
            {/section}
          </select>
          <select id="start_month" name="start_month">
            {html_options options=$month_list selected=$START_MONTH_SELECTED}
          </select>
          <input id="start_year" name="start_year" type="text" size="4" maxlength="4" >
          <input id="start_linked_date" name="start_linked_date" type="hidden" disabled="disabled">
        </p>
        <p>
          <label>
            {'End-Date'|@translate}
            <span class="small">(<a class="date_today" href="#" onClick="document.search.end_day.value={$smarty.now|date_format:"%d"};document.search.end_month.value={$smarty.now|date_format:"%m"};document.search.end_year.value={$smarty.now|date_format:"%Y"};return false;">{'today'|@translate}</a>)</span>
          </label>
          <select id="end_day" name="end_day">
            <option value="0">--</option>
            {section name=day start=1 loop=32}
            <option value="{$smarty.section.day.index}" {if $smarty.section.day.index==$END_DAY_SELECTED}selected="selected"{/if}>{$smarty.section.day.index}</option>
            {/section}
          </select>
          <select id="end_month" name="end_month">
            {html_options options=$month_list selected=$END_MONTH_SELECTED}
          </select>
          <input class="date" id="end_year" name="end_year" type="text" size="4" maxlength="4" >
          <input id="end_linked_date" name="end_linked_date" type="hidden" disabled="disabled">
        </p>
          <label>
            <input type="radio" name="date_type" value="date_creation" checked="checked">{'Creation date'|@translate}
          </label>
          <label>
            <input type="radio" name="date_type" value="date_available">{'Post date'|@translate}
          </label>
    </fieldset>

    <fieldset>
      <legend>{'Search Options'|@translate}</legend>
      <label>{'Search in albums'|@translate}</label>
      <select class="categoryList" name="cat[]" multiple="multiple" >
        {html_options options=$category_options selected=$category_options_selected}
      </select>
      <br/>
      <label>{'Search in sub-albums'|@translate}</label>
      <input type="checkbox" name="subcats-included" value="1" checked="checked">
    </fieldset>
    <button type="submit" name="submit"><span class="icon check">{'Submit'|@translate}</span></button>
    <button type="reset"><span class="icon x">{'Reset'|@translate}</span></button>
  </form>
  <div class="clear"></div>
  <script type="text/javascript"><!--
    document.search.search_allwords.focus();
  //--></script>
</div> <!-- content -->

