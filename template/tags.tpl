<div class="titrePage">
  <ul class="categoryActions">
  {if $display_mode == 'letters'}
    <li><a href="{$U_CLOUD}" title="{'show tag cloud'|@translate}">{'show tag cloud'|@translate}</a></li>
  {/if}
  {if $display_mode == 'cloud'}
    <li><a href="{$U_LETTERS}" title="{'group by letters'|@translate}">{'group by letters'|@translate}</a></li>
  {/if}
  </ul>
  <h2><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a> / {'Tags'|@translate}</h2>
</div>

{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" class="two_col">
{if isset($tags)}
  {if $display_mode == 'cloud'}
    {combine_script id='naive.jqcloud' path='themes/naive/js/jqcloud-0.2.4.min.js'}
    {combine_css path="themes/naive/css/jqcloud.css" order=-10}
    <script type="text/javascript">
      var word_list = [
        {foreach from=$tags item=tag}
          {ldelim}
            text: "{$tag.name}", 
            weight: {$tag.counter}, 
            url: "{$tag.URL}", 
            title: "{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}"
          {rdelim},
        {/foreach}
      ];
      {literal}
      $(document).ready(function() {
        // Call jQCloud on a jQuery object passing the word list as the first argument. 
        // Chainability of methods is maintained.
          $("#fullTagCloud").jQCloud(word_list);
        });
      {/literal}  
    </script>
  <div id="fullTagCloud" style="width: 850px; height: 350px; position: relative;"></div>
  {/if}
  {if $display_mode == 'letters'}
  <table>
    <tr>
      <td valign="top">
      {foreach from=$letters item=letter}
      <fieldset class="tagLetter">
        <legend class="tagLetterLegend">{$letter.TITLE}</legend>
        <table class="tagLetterContent">
          {foreach from=$letter.tags item=tag}
          <tr class="tagLine">
            <td><a href="{$tag.URL}">{$tag.name}</a></td>
        <td class="nbEntries">{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}</td>
          </tr>
          {/foreach}
        </table>
      </fieldset>
      {if isset($letter.CHANGE_COLUMN) }
      </td>
      <td valign="top">
      {/if}
      {/foreach}
      </td>
    </tr>
  </table>
  {/if}
{/if}
  <div class="clear"></div>
</div> <!-- content -->

