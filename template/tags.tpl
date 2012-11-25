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

{include file='infos_errors.tpl'}

{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" class="two_col">
{if isset($tags)}
  {if $display_mode == 'cloud'}
  <div id="fullTagCloud">
    {foreach from=$tags item=tag}
		<span><a href="{$tag.URL}" class="tagLevel{$tag.level}" title="{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}">{$tag.name}</a></span>
    {/foreach}
  </div>
  {/if}
  {if $display_mode == 'letters'}
  <div id="tags_by_letter">
    {foreach from=$letters item=letter}
    <fieldset class="tagLetter">
      <legend>{$letter.TITLE}</legend>
      <table>
        {foreach from=$letter.tags item=tag}
        <tr>
          <td><a href="{$tag.URL}">{$tag.name}</a></td>
          <td class="nbEntries">{$pwg->l10n_dec('%d photo', '%d photos', $tag.counter)}</td>
        </tr>
        {/foreach}
      </table>
    </fieldset>
    {/foreach}
  </div>
  {/if}
{/if}
  <div class="clear"></div>
</div> <!-- content -->

